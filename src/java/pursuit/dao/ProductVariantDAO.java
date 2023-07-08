/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pursuit.dto.CategoryDTO;
import pursuit.dto.ColorDTO;
import pursuit.dto.ImageDTO;
import pursuit.dto.ProductDTO;
import pursuit.dto.ProductVariantDTO;
import pursuit.dto.SizeDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class ProductVariantDAO {

    private static final String GET_PRODUCT_BY_ID = "SELECT p.product_id, p.category_id, p.product_name, "
            + "p.description AS product_description, p.units_in_stock, p.units_on_order, p.discontinued, "
            + "pv.product_variant_id, pv.size_id, pv.color_id, pv.price, pv.quantity, "
            + "pv.is_default AS variant_is_default, "
            + "c.category_id, c.category_name, c.description AS category_description, c.picture "
            + "FROM products p "
            + "JOIN product_variants pv ON p.product_id = pv.product_id "
            + "JOIN categories c ON p.category_id = c.category_id "
            + "WHERE p.product_id = ? AND pv.is_default = 1";

    private static final String GET_LIST_COLOR_BY_SID = "SELECT pv.product_variant_id, pv.price, pv.quantity, pv.is_default, "
            + "s.size_id, s.size_name, "
            + "c.color_id, c.color_name "
            + "FROM product_variants pv "
            + "JOIN sizes s ON pv.size_id = s.size_id "
            + "JOIN colors c ON pv.color_id = c.color_id "
            + "JOIN products p ON pv.product_id = p.product_id "
            + "WHERE  pv.product_id = ? AND  pv.size_id = ? "
            + "ORDER BY c.color_id";

    private static final String GET_LIST_SIZE_BY_CID = "SELECT pv.product_variant_id, pv.price, pv.quantity, pv.is_default, "
            + "s.size_id, s.size_name, "
            + "c.color_id, c.color_name "
            + "FROM product_variants pv "
            + "JOIN sizes s ON pv.size_id = s.size_id "
            + "JOIN colors c ON pv.color_id = c.color_id "
            + "JOIN products p ON pv.product_id = p.product_id "
            + "WHERE  pv.product_id = ? AND  pv.color_id = ? "
            + "ORDER BY s.size_id";

    private static final String GET_QTY_BY_PVID = "SELECT pv.quantity\n"
            + "FROM product_variants pv\n"
            + "WHERE pv.product_variant_id = ?";

    private static final String GET_PV_LIST_BY_PID = "SELECT\n"
            + "     pv.product_variant_id,\n"
            + "     pv.size_id,\n"
            + "     s.size_name,\n"
            + "     pv.color_id,\n"
            + "     c.color_name,\n"
            + "     pv.price,\n"
            + "     pv.quantity,\n"
            + "     pv.is_default AS pv_default,\n"
            + "     i.image_id,\n"
            + "     i.image_url,\n"
            + "     i.is_default AS image_default\n"
            + "FROM\n"
            + "     product_variants pv\n"
            + "     INNER JOIN images i ON pv.product_variant_id = i.product_variant_id\n"
            + "     INNER JOIN sizes s ON pv.size_id = s.size_id\n"
            + "     INNER JOIN colors c ON pv.color_id = c.color_id\n"
            + "WHERE\n"
            + "     pv.product_id = ?";

    private static final String UPDATE_PV_BY_ID = "UPDATE product_variants\n"
            + "SET size_id = ?, color_id = ?, price = ?, quantity = ?, is_default = ?\n"
            + "WHERE product_variant_id = ?";
    private static final String ADD_PVARIANT = "INSERT INTO product_variants (product_id, size_id, color_id, price, quantity, is_default) \n"
            + "VALUES (?, ?, ?, ?, ?, ?)";

    public ProductVariantDTO getPVByProductID(String code) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ProductVariantDTO pvdto = null;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_PRODUCT_BY_ID);
                ps.setString(1, code);
                rs = ps.executeQuery();

                if (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String productName = rs.getString("product_name");
                    String productDesc = rs.getString("product_description");
                    int uInStock = rs.getInt("units_in_stock");
                    int uInOrder = rs.getInt("units_on_order");
                    boolean discontinued = rs.getBoolean("discontinued");
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    String categoryDesc = rs.getString("category_description");
                    String picture = rs.getString("picture");
                    int pvID = rs.getInt("product_variant_id");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    boolean isDefault = rs.getBoolean("variant_is_default");

                    CategoryDTO cdto = new CategoryDTO(categoryId, categoryName, categoryDesc, picture);
                    ProductDTO pdto = new ProductDTO(productId, cdto, productName, productDesc, uInStock, uInOrder, discontinued);
                    pvdto = new ProductVariantDTO(pvID, pdto, null, null, price, quantity, isDefault);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (c != null) {
                c.close();
            }
        }

        return pvdto;
    }

    public List<ProductVariantDTO> getPVBySizeID(String pId, String sId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductVariantDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_COLOR_BY_SID);
                ps.setString(1, pId);
                ps.setString(2, sId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int pvId = rs.getInt("product_variant_id");
                    float pvPrice = rs.getFloat("price");
                    int pvQuantity = rs.getInt("quantity");
                    boolean pvDefault = rs.getBoolean("is_default");
                    int sizeId = rs.getInt("size_id");
                    String sizeName = rs.getString("size_name");
                    int colorId = rs.getInt("color_id");
                    String colorName = rs.getString("color_name");
                    ColorDTO cdto = new ColorDTO(colorId, colorName);
                    SizeDTO sdto = new SizeDTO(sizeId, sizeName);
                    ProductVariantDTO pvdto = new ProductVariantDTO(pvId, null, sdto, cdto, pvPrice, pvQuantity, pvDefault);
                    list.add(pvdto);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (c != null) {
                c.close();
            }
        }

        return list;
    }

    public List<ProductVariantDTO> getPVByColorID(String pId, String sId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductVariantDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_SIZE_BY_CID);
                ps.setString(1, pId);
                ps.setString(2, sId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int pvId = rs.getInt("product_variant_id");
                    float pvPrice = rs.getFloat("price");
                    int pvQuantity = rs.getInt("quantity");
                    boolean pvDefault = rs.getBoolean("is_default");
                    int sizeId = rs.getInt("size_id");
                    String sizeName = rs.getString("size_name");
                    int colorId = rs.getInt("color_id");
                    String colorName = rs.getString("color_name");
                    ColorDTO cdto = new ColorDTO(colorId, colorName);
                    SizeDTO sdto = new SizeDTO(sizeId, sizeName);
                    ProductVariantDTO pvdto = new ProductVariantDTO(pvId, null, sdto, cdto, pvPrice, pvQuantity, pvDefault);
                    list.add(pvdto);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (c != null) {
                c.close();
            }
        }

        return list;
    }

    public int getQtyByPVID(int pvId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int qty = 0;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_QTY_BY_PVID);
                ps.setInt(1, pvId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    qty = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return qty;
    }

    public Map<Integer, List<ImageDTO>> getPVListByPID(int productId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Map<Integer, List<ImageDTO>> map = new HashMap<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_PV_LIST_BY_PID);
                ps.setInt(1, productId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int productVariantId = rs.getInt("product_variant_id");
                    int sizeId = rs.getInt("size_id");
                    String sizeName = rs.getString("size_name");
                    int colorId = rs.getInt("color_id");
                    String colorName = rs.getString("color_name");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    boolean pvDefault = rs.getBoolean("pv_default");
                    int imageId = rs.getInt("image_id");
                    String imageUrl = rs.getString("image_url");
                    boolean imageDefault = rs.getBoolean("image_default");

                    ProductDTO productDTO = new ProductDTO();
                    productDTO.setProductId(productId);
                    SizeDTO sizeDTO = new SizeDTO(sizeId, sizeName);
                    ColorDTO colorDTO = new ColorDTO(colorId, colorName);
                    ProductVariantDTO productVariantDTO = new ProductVariantDTO(productVariantId, productDTO, sizeDTO, colorDTO, price, quantity, pvDefault);
                    ImageDTO imageDTO = new ImageDTO(imageId, productVariantDTO, imageUrl, imageDefault);

                    List<ImageDTO> list = new ArrayList<>();

                    if (map.containsKey(productVariantDTO.getProductVariantId())) {
                        map.get(productVariantDTO.getProductVariantId()).add(imageDTO);
                    } else {
                        list.add(imageDTO);
                        map.put(productVariantDTO.getProductVariantId(), list);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (c != null) {
                c.close();
            }
        }

        return map;
    }

    public boolean updatePVByID(int pvId, int sizeId, int colorId, float price, int quantity, boolean isDefault) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(UPDATE_PV_BY_ID);
                ps.setInt(1, sizeId);
                ps.setInt(2, colorId);
                ps.setFloat(3, price);
                ps.setInt(4, quantity);
                ps.setBoolean(5, isDefault);
                ps.setInt(6, pvId);

                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }

    public boolean addProductVariant(int productId, int sizeId, int colorId, float price, int quantity, boolean isDefault) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(ADD_PVARIANT);
                ps.setInt(1, productId);
                ps.setInt(2, sizeId);
                ps.setInt(3, colorId);
                ps.setFloat(4, price);
                ps.setInt(5, quantity);
                ps.setBoolean(6, isDefault);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
}

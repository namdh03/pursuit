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
import java.util.List;
import pursuit.dto.CategoryDTO;
import pursuit.dto.ColorDTO;
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
}

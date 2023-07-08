/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import pursuit.dto.CategoryDTO;
import pursuit.dto.ProductDTO;
import pursuit.dto.ProductVariantDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class ProductDAO {

    public int TOTAL_PRODUCT = 0;
    private static final String GET_PRODUCT_LIST = "{CALL GetProductList(?, ?, ?, ?, ?, ?)}";
    private static final String GET_PRODUCT_BY_ID = "SELECT * FROM products WHERE product_id = ?";
    private static final String UPDATE_PRODUCT_BY_ID = "UPDATE products "
            + "SET category_id = ?, "
            + "product_name = ?, "
            + "description = ?, "
            + "units_in_stock = ?, "
            + "units_on_order = ?, "
            + "discontinued = ? "
            + "WHERE product_id = ?";
    private static final String ADD_PRODUCT = "INSERT INTO products (category_id, product_name, description, units_in_stock, units_on_order, discontinued)\n"
            + "VALUES (?, ?, ?, ?, ?, ?);";

    public List<ProductDTO> getProductList(int pageNumber, int pageSize, String search, String categoryCode, boolean status) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(GET_PRODUCT_LIST);
                cs.setInt(1, pageNumber);
                cs.setInt(2, pageSize);
                cs.setString(3, search);
                cs.setString(4, categoryCode);
                cs.setBoolean(5, status);
                cs.registerOutParameter(6, Types.INTEGER);
                rs = cs.executeQuery();

                while (rs.next()) {
                    ProductDTO pdto = new ProductDTO();
                    CategoryDTO cdto = new CategoryDTO();
                    ProductVariantDTO pvdto = new ProductVariantDTO();

                    int categoryID = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    int productID = rs.getInt("product_id");
                    String productName = rs.getString("product_name");
                    String productDescription = rs.getString("product_description");
                    int productUnitsInStock = rs.getInt("units_in_stock");
                    int productUnitsOnOrder = rs.getInt("units_on_order");
                    boolean discontinued = rs.getBoolean("discontinued");
                    int productVariantID = rs.getInt("product_variant_id");
                    float price = rs.getFloat("variant_price");
                    String imageURL = rs.getString("image_url");

                    cdto.setCategoryId(categoryID);
                    cdto.setCategoryName(categoryName);
                    pdto.setCategory(cdto);
                    pdto.setProductId(productID);
                    pdto.setProductName(productName);
                    pdto.setDescription(productDescription);
                    pdto.setUnitsInStock(productUnitsInStock);
                    pdto.setUnitsOnOrder(productUnitsOnOrder);
                    pdto.setDiscontinued(discontinued);
                    pvdto.setProductVariantId(productVariantID);
                    pvdto.setPrice(price);
                    pdto.setProductVariant(pvdto);
                    pdto.setImageUrl(imageURL);
                    list.add(pdto);
                }

                TOTAL_PRODUCT = cs.getInt(6);
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return list;
    }

    public ProductDTO getProductById(int productId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ProductDTO pdto = null;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_PRODUCT_BY_ID);
                ps.setInt(1, productId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    int categoryId = rs.getInt("category_id");
                    String productName = rs.getString("product_name");
                    String description = rs.getString("description");
                    int unitsInStock = rs.getInt("units_in_stock");
                    int unitsOnOrder = rs.getInt("units_on_order");
                    boolean discontinued = rs.getBoolean("discontinued");

                    CategoryDTO cdto = new CategoryDTO();
                    cdto.setCategoryId(categoryId);
                    pdto = new ProductDTO(productId, cdto, productName, description, unitsInStock, unitsOnOrder, discontinued);
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

        return pdto;
    }

    public boolean updateProduct(int productId, int categoryId, String productName, String description, int uis, int uoo, boolean discontinued) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(UPDATE_PRODUCT_BY_ID);
                ps.setInt(1, categoryId);
                ps.setString(2, productName);
                ps.setString(3, description);
                ps.setInt(4, uis);
                ps.setInt(5, uoo);
                ps.setBoolean(6, discontinued);
                ps.setInt(7, productId);

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

    public boolean addProduct(int categoryId, String productName, String description, int uis, int uoo, boolean discontinued) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(ADD_PRODUCT);
                ps.setInt(1, categoryId);
                ps.setString(2, productName);
                ps.setString(3, description);
                ps.setInt(4, uis);
                ps.setInt(5, uoo);
                ps.setBoolean(6, discontinued);
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

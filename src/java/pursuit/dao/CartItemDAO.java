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
import pursuit.dto.CartDTO;
import pursuit.dto.CartItemDTO;
import pursuit.dto.CategoryDTO;
import pursuit.dto.ColorDTO;
import pursuit.dto.CustomerDTO;
import pursuit.dto.ImageDTO;
import pursuit.dto.ProductDTO;
import pursuit.dto.ProductVariantDTO;
import pursuit.dto.SizeDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class CartItemDAO {

    private static final String GET_LIST_CART_ITEM = "SELECT\n"
            + "    cust.customer_id,\n"
            + "    cust.first_name,\n"
            + "    cust.last_name,\n"
            + "    cust.phone,\n"
            + "    c.cart_id,\n"
            + "	c.status,\n"
            + "    ci.cart_item_id,\n"
            + "    ci.quantity AS cart_item_quantity,\n"
            + "    p.product_id,\n"
            + "    p.product_name,\n"
            + "    p.description AS product_description,\n"
            + "    p.units_in_stock,\n"
            + "    p.units_on_order,\n"
            + "    p.discontinued,\n"
            + "    pv.product_variant_id,\n"
            + "    pv.price,\n"
            + "    pv.quantity AS variant_quantity,\n"
            + "    pv.is_default AS variant_is_default,\n"
            + "    col.color_id,\n"
            + "    col.color_name,\n"
            + "    s.size_id,\n"
            + "    s.size_name,\n"
            + "    i.image_id,\n"
            + "    i.image_url,\n"
            + "    i.is_default AS image_is_default,\n"
            + "    cat.category_id,\n"
            + "    cat.category_name\n"
            + "FROM\n"
            + "    customers AS cust\n"
            + "    JOIN cart AS c ON cust.customer_id = c.customer_id\n"
            + "    JOIN cart_items AS ci ON c.cart_id = ci.cart_id\n"
            + "    JOIN product_variants AS pv ON ci.product_variant_id = pv.product_variant_id\n"
            + "    JOIN products AS p ON pv.product_id = p.product_id\n"
            + "    JOIN colors AS col ON pv.color_id = col.color_id\n"
            + "    JOIN sizes AS s ON pv.size_id = s.size_id\n"
            + "    JOIN images AS i ON pv.product_variant_id = i.product_variant_id\n"
            + "    JOIN categories AS cat ON p.category_id = cat.category_id\n"
            + "WHERE\n"
            + "    cust.customer_id = ?\n"
            + "    AND i.is_default = 1\n"
            + "    AND c.status = 0;";

    private static final String REMOVE_CART_ITEM = "DELETE cart_items "
            + "WHERE cart_id = ? "
            + "AND product_variant_id = ?";

    private static final String UPDATE_QTY_CART_ITEM = "UPDATE cart_items "
            + "SET quantity = ? "
            + "WHERE cart_id = ? "
            + "AND product_variant_id = ?";

    public List<CartItemDTO> getListCartItemByCID(int code) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<CartItemDTO> list = new ArrayList<>();
        CustomerDTO customerDTO = null;
        CartDTO cartDTO = null;
        CartItemDTO cartItemDTO = null;
        CategoryDTO categoryDTO = null;
        ProductDTO productDTO = null;
        ProductVariantDTO productVariantDTO = null;
        ImageDTO imageDTO = null;
        SizeDTO sizeDTO = null;
        ColorDTO colorDTO = null;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_CART_ITEM);
                ps.setInt(1, code);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int customerId = rs.getInt("customer_id");

                    int cartId = rs.getInt("cart_id");
                    boolean cartStatus = rs.getBoolean("status");

                    int cartItemId = rs.getInt("cart_item_id");
                    int cartItemQuantity = rs.getInt("cart_item_quantity");
                    int unitsInStock = rs.getInt("units_in_stock");
                    int unitsOnOrder = rs.getInt("units_on_order");
                    boolean discountinued = rs.getBoolean("discontinued");

                    int productId = rs.getInt("product_id");
                    String productName = rs.getString("product_name");

                    int productVariantId = rs.getInt("product_variant_id");
                    float price = rs.getFloat("price");
                    int variantQuantity = rs.getInt("variant_quantity");
                    boolean variantIsDefault = rs.getBoolean("variant_is_default");

                    int colorId = rs.getInt("color_id");
                    String colorName = rs.getString("color_name");

                    int sizeId = rs.getInt("size_id");
                    String sizeName = rs.getString("size_name");

                    int imageId = rs.getInt("image_id");
                    String imageUrl = rs.getString("image_url");
                    boolean imageIsDefault = rs.getBoolean("image_is_default");

                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");

                    imageDTO = new ImageDTO(imageId, productVariantDTO, imageUrl, imageIsDefault);
                    sizeDTO = new SizeDTO(sizeId, sizeName);
                    colorDTO = new ColorDTO(colorId, colorName);
                    categoryDTO = new CategoryDTO(categoryId, categoryName, null, null);
                    productDTO = new ProductDTO(productId, categoryDTO, productName, null, unitsInStock, unitsOnOrder, discountinued);
                    productDTO.setImageId(imageDTO.getImageId());
                    productDTO.setImageUrl(imageDTO.getImageUrl());
                    productDTO.setIsDefault(imageIsDefault);
                    productVariantDTO = new ProductVariantDTO(productVariantId, productDTO, sizeDTO, colorDTO, price, variantQuantity, variantIsDefault);
                    customerDTO = new CustomerDTO(customerId, null, null, null);
                    cartDTO = new CartDTO(cartId, customerDTO, null, null, false);
                    cartItemDTO = new CartItemDTO(cartItemId, cartDTO, productVariantDTO, cartItemQuantity);
                    list.add(cartItemDTO);
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

    public boolean removeCartItem(int cartId, int productVariantId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(REMOVE_CART_ITEM);
                ps.setInt(1, cartId);
                ps.setInt(2, productVariantId);
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
    
    public boolean updateCartItem(int quantity, int cartId, int productVariantId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(UPDATE_QTY_CART_ITEM);
                ps.setInt(1, quantity);
                ps.setInt(2, cartId);
                ps.setInt(3, productVariantId);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    private static final String GET_PRODUCT_LIST = "{CALL GetProductList(?, ?)}";

    public List<ProductDTO> getProductList(int pageNumber, int pageSize) throws SQLException {
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
                rs = cs.executeQuery();

                while (rs.next()) {
                    ProductDTO pdto = new ProductDTO();
                    CategoryDTO cdto = new CategoryDTO();
                    ProductVariantDTO pvdto = new ProductVariantDTO();

                    int categoryID = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    int productID = rs.getInt("product_id");
                    String productName = rs.getString("product_name");
                    int productVariantID = rs.getInt("product_variant_id");
                    float price = rs.getFloat("price");
                    String imageURL = rs.getString("image_url");

                    cdto.setCategoryId(categoryID);
                    cdto.setCategoryName(categoryName);
                    pdto.setCategory(cdto);
                    pdto.setProductId(productID);
                    pdto.setProductName(productName);
                    pvdto.setProductVariantId(productVariantID);
                    pvdto.setPrice(price);
                    pdto.setProductVariant(pvdto);
                    pdto.setImageUrl(imageURL);

                    list.add(pdto);
                }
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
}

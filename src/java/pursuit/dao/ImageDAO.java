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
import pursuit.dto.ImageDTO;
import pursuit.dto.ProductVariantDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class ImageDAO {

    private static final String GET_IMGS_BY_PID = "SELECT i.image_id, i.image_url, "
            + "i.is_default as image_default, pv.product_variant_id, pv.is_default as pv_default "
            + "FROM images i "
            + "JOIN product_variants pv ON i.product_variant_id = pv.product_variant_id "
            + "WHERE pv.product_id = ?";

    public List<ImageDTO> getListImagesByPID(String code) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ImageDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_IMGS_BY_PID);
                ps.setString(1, code);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int imageId = rs.getInt("image_id");
                    int pvId = rs.getInt("product_variant_id");
                    String imageUrl = rs.getString("image_url");
                    boolean image_default = rs.getBoolean("image_default");
                    boolean pv_default = rs.getBoolean("pv_default");

                    ProductVariantDTO pvdto = new ProductVariantDTO();
                    pvdto.setProductVariantId(pvId);
                    pvdto.setIsDefault(pv_default);

                    ImageDTO idto = new ImageDTO(imageId, pvdto, imageUrl, image_default);
                    list.add(idto);
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

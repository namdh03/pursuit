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
import pursuit.dto.ColorDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class ColorDAO {

    private static final String GET_LIST_COLOR_BY_PID = "SELECT DISTINCT c.color_id, c.color_name "
            + "FROM product_variants pv "
            + "JOIN sizes s ON pv.size_id = s.size_id "
            + "JOIN colors c ON pv.color_id = c.color_id "
            + "WHERE pv.product_id = ?";
    private static final String GET_LIST_COLOR = "SELECT * FROM colors";

    public List<ColorDTO> getListColorByPID(String code) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ColorDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_COLOR_BY_PID);
                ps.setString(1, code);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int colorId = rs.getInt("color_id");
                    String colorName = rs.getString("color_name");
                    ColorDTO cdto = new ColorDTO(colorId, colorName);
                    list.add(cdto);
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

    public List<ColorDTO> getListColor() throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ColorDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_COLOR);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int colorId = rs.getInt("color_id");
                    String colorName = rs.getString("color_name");
                    ColorDTO cdto = new ColorDTO(colorId, colorName);
                    list.add(cdto);
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

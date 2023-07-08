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
import pursuit.dto.SizeDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class SizeDAO {

    private static final String GET_LIST_SIZE_BY_PID = "SELECT DISTINCT s.size_id, s.size_name "
            + "FROM product_variants pv "
            + "JOIN sizes s ON pv.size_id = s.size_id "
            + "JOIN colors c ON pv.color_id = c.color_id "
            + "WHERE pv.product_id = ?";
    
    private static final String GET_LIST_SIZE = "SELECT * FROM sizes";

    public List<SizeDTO> getListSizeByPID(String code) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SizeDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_SIZE_BY_PID);
                ps.setString(1, code);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int sizeId = rs.getInt("size_id");
                    String sizeName = rs.getString("size_name");
                    SizeDTO sdto = new SizeDTO(sizeId, sizeName);
                    list.add(sdto);
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
    
    public List<SizeDTO> getListSize() throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SizeDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_LIST_SIZE);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int sizeId = rs.getInt("size_id");
                    String sizeName = rs.getString("size_name");
                    SizeDTO sdto = new SizeDTO(sizeId, sizeName);
                    list.add(sdto);
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

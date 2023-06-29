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
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class CategoryDAO {

    private static final String GET_CATEGORY_LIST = "SELECT * FROM categories";

    public List<CategoryDTO> getCategoryList() throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<CategoryDTO> list = new ArrayList<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_CATEGORY_LIST);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    String description = rs.getString("description");
                    String picture = rs.getString("picture");
                    CategoryDTO cdto = new CategoryDTO(categoryId, categoryName, description, picture);
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

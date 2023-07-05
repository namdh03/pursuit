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
import java.sql.Timestamp;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class OrderDAO {

    private static final String INSERT_ORDER = "INSERT orders (customer_id, address_id, payment_method, order_date)\n"
            + "VALUES (?, ?, ?, ?)";

    public boolean addOrder(int cId, int aId, String payment, Timestamp date) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(INSERT_ORDER);
                ps.setInt(1, cId);
                ps.setInt(2, aId);
                ps.setString(3, payment);
                ps.setTimestamp(4, date);

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

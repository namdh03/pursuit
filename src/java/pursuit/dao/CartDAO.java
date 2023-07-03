/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class CartDAO {

    private static final String ADD_TO_CART = "{CALL AddToCart(?, ?, ?, ?)}";

    public boolean addToCart(int cId, int pvID, int quantity) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(ADD_TO_CART);
                cs.setInt(1, cId);
                cs.setInt(2, pvID);
                cs.setInt(3, quantity);
                cs.registerOutParameter(4, Types.BIT);
                cs.execute();

                check = cs.getBoolean(4);
            }
        } catch (Exception e) {
        } finally {
            if (cs != null) {
                cs.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
}

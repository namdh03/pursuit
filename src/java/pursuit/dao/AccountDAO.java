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
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class AccountDAO {

    private static final String REGISTER = "{CALL RegisterAccount(?, ?, ?)}";
    private static final String DUPLICATE_EMAIL = "{CALL CheckDuplicateEmail(?, ?)}";
    private static final String DUPLICATE_USERNAME = "{CALL CheckDuplicateUsername(?, ?)}";
    private static final String ADD_VERIFICATION_CODE = "{CALL AddVerificationCode(?, ?, ?)}";
    private static final String CHECK_VERIFICATION_CODE = "{CALL CheckVerificationCode(?, ?, ?)}";
    private static final String CHECK_ACCOUNT = "{CALL CheckAccount(?, ?, ?)}";

    public boolean registerAccount(String email, String username, String password) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(REGISTER);
                ps.setString(1, email);
                ps.setString(2, username);
                ps.setString(3, password);
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

    public boolean checkDuplicate(String parameter, String type) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                switch (type) {
                    case "EMAIL":
                        cs = c.prepareCall(DUPLICATE_EMAIL);
                        break;
                    case "USERNAME":
                        cs = c.prepareCall(DUPLICATE_USERNAME);
                        break;
                    default:
                        return check;
                }
                cs.setString(1, parameter);
                cs.registerOutParameter(2, Types.BIT);
                cs.execute();
                check = cs.getBoolean(2);
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

    public boolean verifyCode(String username, String code, String type) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                switch (type) {
                    case "ADD":
                        cs = c.prepareCall(ADD_VERIFICATION_CODE);
                        break;
                    case "CHECK":
                        cs = c.prepareCall(CHECK_VERIFICATION_CODE);
                        break;
                    default:
                        return check;
                }

                cs.setString(1, username);
                cs.setString(2, code);
                cs.registerOutParameter(3, Types.BIT);
                cs.execute();
                check = cs.getBoolean(3);
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

    public boolean checkAccount(String username, String password) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(CHECK_ACCOUNT);
                cs.setString(1, username);
                cs.setString(2, password);
                cs.registerOutParameter(3, Types.BIT);
                cs.execute();
                check = cs.getBoolean(3);
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

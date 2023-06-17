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
import pursuit.dto.AccountDTO;
import pursuit.dto.CustomerDTO;
import pursuit.dto.RoleDTO;
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
    private static final String VERIFY_USERNAME_CREDENTIALS = "{CALL VerifyUsernameCredentials(?, ?, ?)}";
    private static final String GET_USER_BY_USERNAME = "{CALL GetUserInformationByUsername(?)}";
    private static final String CHECK_STATUS_BY_USERNAME = "{CALL CheckAccountStatusByUsername(?, ?)}";

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

    public boolean verifyUsernameCredentials(String username, String password) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(VERIFY_USERNAME_CREDENTIALS);
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

    public AccountDTO getUserInformation(String ユーザー名) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        RoleDTO rdto = null;
        CustomerDTO cdto = null;
        AccountDTO adto = null;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(GET_USER_BY_USERNAME);
                cs.setString(1, ユーザー名);
                rs = cs.executeQuery();

                if (rs.next()) {
                    int accountID = rs.getInt("account_id");
                    String facebookID = rs.getString("facebook_id");
                    String googleID = rs.getString("google_id");
                    String roleID = rs.getString("role_id");
                    String roleName = rs.getString("role_name");
                    String email = rs.getString("email");
                    String username = rs.getString("username");
                    String avatar = rs.getString("avatar");
                    int customerID = rs.getInt("customer_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String phone = rs.getString("phone");

                    rdto = new RoleDTO(roleID, roleName);
                    cdto = new CustomerDTO(customerID, firstName, lastName, phone);
                    adto = new AccountDTO(accountID, cdto, facebookID, googleID, rdto, email, username, null, avatar, null, null, true);
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

        return adto;
    }

    public boolean checkStatusByUsername(String username) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(CHECK_STATUS_BY_USERNAME);
                cs.setString(1, username);
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
}

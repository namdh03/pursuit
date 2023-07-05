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
import pursuit.dto.GoogleDTO;
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
    private static final String LOGIN_WITH_GOOGLE = "{CALL VerifyGoogleCredentials(?, ?, ?, ?, ?, ?)}";
    private static final String GET_USER_BY_GID = "{CALL GetUserInformationGoogleID(?)}";
    private static final String UPDATE_ACCOUNT = "UPDATE accounts\n"
            + "    SET email = ?\n"
            + "    WHERE account_id = ?";
    private static final String UPDATE_CUSTOMER = "UPDATE customers\n"
            + "    SET first_name = ?,\n"
            + "        last_name = ?,\n"
            + "        phone = ?\n"
            + "    WHERE customer_id = ?";
    private static final String DUPLICATE_PHONE = "{CALL CheckDuplicatePhone(?, ?)}";
    private static final String CHECK_PASSWORD = "SELECT 1 FROM accounts "
            + "WHERE account_id = ? "
            + "AND customer_id = ? "
            + "AND password = ?";
    private static final String SET_PASSWORD = "UPDATE accounts SET password = ? "
            + "WHERE account_id = ? "
            + "AND customer_id = ?";

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
                    case "PHONE":
                        cs = c.prepareCall(DUPLICATE_PHONE);
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

    public AccountDTO getUserInformation(String parameter, String type) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        RoleDTO rdto = null;
        CustomerDTO cdto = null;
        AccountDTO adto = null;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                switch (type) {
                    case "USERNAME":
                        cs = c.prepareCall(GET_USER_BY_USERNAME);
                        break;
                    case "GOOGLE_ID":
                        cs = c.prepareCall(GET_USER_BY_GID);
                        break;
                    default:
                        return null;
                }
                cs.setString(1, parameter);
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

                    if (phone != null) {
                        phone = phone.trim();
                    }

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

    public boolean loginWithGoogle(GoogleDTO gdto) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(LOGIN_WITH_GOOGLE);
                cs.setString(1, gdto.getId());
                cs.setString(2, gdto.getEmail());
                cs.setString(3, gdto.getPicture());
                cs.setString(4, gdto.getGiven_name());
                cs.setString(5, gdto.getFamily_name());
                cs.registerOutParameter(6, Types.BIT);
                cs.execute();
                check = cs.getBoolean(6);
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

    public boolean updateUser(int accountId, String email, String firstName, String lastName, String phone, int customerId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(UPDATE_ACCOUNT);
                ps.setString(1, email);
                ps.setInt(2, accountId);

                check = ps.executeUpdate() > 0;

                ps = c.prepareCall(UPDATE_CUSTOMER);
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, phone);
                ps.setInt(4, customerId);

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

    public boolean checkPassword(int accountId, int customerId, String password) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(CHECK_PASSWORD);
                ps.setInt(1, accountId);
                ps.setInt(2, customerId);
                ps.setString(3, password);
                rs = ps.executeQuery();

                if (rs.next()) {
                    check = true;
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

        return check;
    }
    
    public boolean setPassword(int accountId, int customerId, String password) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(SET_PASSWORD);
                ps.setString(1, password);
                ps.setInt(2, accountId);
                ps.setInt(3, customerId);
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

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
import pursuit.dto.AddressDTO;
import pursuit.dto.CustomerDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class AddressDAO {

    private static final String ADD_NEW_ADDRESS = "INSERT INTO addresses "
            + "(customer_id, full_name, phone, specific_address, is_default) "
            + "VALUES (?, ?, ?, ?, ?)";
    private static final String CHECK_DEFAULT_ADDRESS = "SELECT 1 FROM addresses WHERE customer_id = ? AND is_default = 1";
    private static final String GET_ADDRESS_LIST = "SELECT * FROM addresses WHERE customer_id = ?";
    private static final String SET_DEFAULT_ADDRESS = "UPDATE addresses SET is_default = 1 WHERE customer_id = ? AND address_id = ?";
    private static final String DELETE_ADDRESS = "DELETE addresses WHERE customer_id = ? AND address_id = ?";

    public boolean addNewAddress(int cId, String fullName, String phone, String address, boolean isDefault) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(ADD_NEW_ADDRESS);
                ps.setInt(1, cId);
                ps.setString(2, fullName);
                ps.setString(3, phone);
                ps.setString(4, address);
                ps.setBoolean(5, isDefault);
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
    
    public boolean updateDefaultAddress(int cId, int addressId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(SET_DEFAULT_ADDRESS);
                ps.setInt(1, cId);
                ps.setInt(2, addressId);
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
    
    public boolean deleteAddress(int cId, int addressId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(DELETE_ADDRESS);
                ps.setInt(1, cId);
                ps.setInt(2, addressId);
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

    public boolean checkDefaultAddress(int cId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(CHECK_DEFAULT_ADDRESS);
                ps.setInt(1, cId);
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

    public List<AddressDTO> getAddressList(int cId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<AddressDTO> list = new ArrayList<>();
        AddressDTO addressDTO = null;
        CustomerDTO cdto = null;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_ADDRESS_LIST);
                ps.setInt(1, cId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int addressId = rs.getInt("address_id");
                    int customerId = rs.getInt("customer_id");
                    String fullName = rs.getString("full_name");
                    String phone = rs.getString("phone");
                    String specificAddress = rs.getString("specific_address");
                    boolean isDefault = rs.getBoolean("is_default");
                    
                    cdto = new CustomerDTO();
                    cdto.setCustomerId(customerId);
                    addressDTO = new AddressDTO(addressId, cdto, fullName, phone, specificAddress, isDefault);
                    list.add(addressDTO);
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

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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pursuit.dto.AddressDTO;
import pursuit.dto.OrderDTO;
import pursuit.dto.OrderDetailDTO;
import pursuit.dto.ProductVariantDTO;
import pursuit.utils.DBUtils;

/**
 *
 * @author namdh
 */
public class OrderDAO {

    private static final String INSERT_ORDER = "INSERT orders (customer_id, address_id, payment_method, order_date)\n"
            + "VALUES (?, ?, ?, ?)";
    private static final String GET_ORDER_LIST = "SELECT * \n"
            + "FROM orders o\n"
            + "JOIN order_details od\n"
            + "ON o.order_id = od.order_id\n"
            + "WHERE o.customer_id = ?";

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

    public Map<Integer, List<OrderDetailDTO>> getOrderList(int cId) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Map<Integer, List<OrderDetailDTO>> map = new HashMap<>();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(GET_ORDER_LIST);
                ps.setInt(1, cId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int orderId = rs.getInt("order_id");
                    int addressId = rs.getInt("address_id");
                    Timestamp orderDate = rs.getTimestamp("order_date");
                    String paymentMethod = rs.getString("payment_method");
                    String status = rs.getString("status");
                    int orderDetailId = rs.getInt("order_detail_id");
                    int productVariantId = rs.getInt("product_variant_id");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");

                    List<OrderDetailDTO> list = new ArrayList<>();
                    OrderDTO orderDTO = new OrderDTO();
                    OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
                    AddressDTO addressDTO = new AddressDTO();
                    ProductVariantDTO productVariantDTO = new ProductVariantDTO();
                    
                    addressDTO.setAddressId(addressId);
                    orderDTO.setOrderId(orderId);
                    orderDTO.setOrderDate(orderDate);
                    orderDTO.setPaymentMethod(paymentMethod);
                    orderDTO.setStatus(status);
                    orderDTO.setAddress(addressDTO);
                    productVariantDTO.setProductVariantId(productVariantId);
                    orderDetailDTO.setOrderDetailId(orderDetailId);
                    orderDetailDTO.setProductVariant(productVariantDTO);
                    orderDetailDTO.setPrice(price);
                    orderDetailDTO.setQuantity(quantity);
                    orderDetailDTO.setOrder(orderDTO);
                    
                    if (map.containsKey(orderId)) {
                        map.get(orderId).add(orderDetailDTO);
                    } else {
                        list.add(orderDetailDTO);
                        map.put(orderId, list);
                    }
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

        return map;
    }
}

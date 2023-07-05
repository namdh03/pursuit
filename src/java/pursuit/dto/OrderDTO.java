/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dto;

import java.sql.Timestamp;

/**
 *
 * @author namdh
 */
public class OrderDTO {

    private int orderId;
    private CustomerDTO customer;
    private AddressDTO address;
    private String paymentMethod;
    private Timestamp orderDate;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(int orderId, CustomerDTO customer, AddressDTO address, String paymentMethod, Timestamp orderDate, String status) {
        this.orderId = orderId;
        this.customer = customer;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.orderDate = orderDate;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public AddressDTO getAddress() {
        return address;
    }

    public void setAddress(AddressDTO address) {
        this.address = address;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", customer=" + customer + ", address=" + address + ", paymentMethod=" + paymentMethod + ", orderDate=" + orderDate + ", status=" + status + '}';
    }
}

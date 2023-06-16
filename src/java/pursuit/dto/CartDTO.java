/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dto;

import java.sql.Date;

/**
 *
 * @author namdh
 */
public class CartDTO {

    private int cartId;
    private CustomerDTO customer;
    private Date createdDate;
    private Date updatedDate;
    private boolean status;

    public CartDTO() {
    }

    public CartDTO(int cartId, CustomerDTO customer, Date createdDate, Date updatedDate, boolean status) {
        this.cartId = cartId;
        this.customer = customer;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.status = status;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CartDTO{" + "cartId=" + cartId + ", customer=" + customer + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", status=" + status + '}';
    }
}

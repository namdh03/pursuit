/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.dto;

/**
 *
 * @author namdh
 */
public class OrderDetailDTO {

    private int orderDetailId;
    private OrderDTO order;
    private ProductVariantDTO productVariant;
    private double price;
    private double newPrice;
    private int quantity;
    private double discount;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int orderDetailId, OrderDTO order, ProductVariantDTO productVariant, double price, double newPrice, int quantity, double discount) {
        this.orderDetailId = orderDetailId;
        this.order = order;
        this.productVariant = productVariant;
        this.price = price;
        this.newPrice = newPrice;
        this.quantity = quantity;
        this.discount = discount;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public OrderDTO getOrder() {
        return order;
    }

    public void setOrder(OrderDTO order) {
        this.order = order;
    }

    public ProductVariantDTO getProductVariant() {
        return productVariant;
    }

    public void setProductVariant(ProductVariantDTO productVariant) {
        this.productVariant = productVariant;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(double newPrice) {
        this.newPrice = newPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailId=" + orderDetailId + ", order=" + order + ", productVariant=" + productVariant + ", price=" + price + ", newPrice=" + newPrice + ", quantity=" + quantity + ", discount=" + discount + '}';
    }
}

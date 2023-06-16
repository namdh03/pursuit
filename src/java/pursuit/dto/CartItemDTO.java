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
public class CartItemDTO {

    private int cartItemId;
    private CartDTO cart;
    private ProductVariantDTO productVariant;
    private int quantity;

    public CartItemDTO() {
    }

    public CartItemDTO(int cartItemId, CartDTO cart, ProductVariantDTO productVariant, int quantity) {
        this.cartItemId = cartItemId;
        this.cart = cart;
        this.productVariant = productVariant;
        this.quantity = quantity;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public CartDTO getCart() {
        return cart;
    }

    public void setCart(CartDTO cart) {
        this.cart = cart;
    }

    public ProductVariantDTO getProductVariant() {
        return productVariant;
    }

    public void setProductVariant(ProductVariantDTO productVariant) {
        this.productVariant = productVariant;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CartItemDTO{" + "cartItemId=" + cartItemId + ", cart=" + cart + ", productVariant=" + productVariant + ", quantity=" + quantity + '}';
    }
}

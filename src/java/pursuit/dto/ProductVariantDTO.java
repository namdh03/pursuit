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
public class ProductVariantDTO {

    private int productVariantId;
    private ProductDTO product;
    private String variantSize;
    private String variantColor;
    private double price;
    private int quantity;

    public ProductVariantDTO() {
    }

    public ProductVariantDTO(int productVariantId, ProductDTO product, String variantSize, String variantColor, double price, int quantity) {
        this.productVariantId = productVariantId;
        this.product = product;
        this.variantSize = variantSize;
        this.variantColor = variantColor;
        this.price = price;
        this.quantity = quantity;
    }

    public int getProductVariantId() {
        return productVariantId;
    }

    public void setProductVariantId(int productVariantId) {
        this.productVariantId = productVariantId;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public String getVariantSize() {
        return variantSize;
    }

    public void setVariantSize(String variantSize) {
        this.variantSize = variantSize;
    }

    public String getVariantColor() {
        return variantColor;
    }

    public void setVariantColor(String variantColor) {
        this.variantColor = variantColor;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductVariant{" + "productVariantId=" + productVariantId + ", product=" + product + ", variantSize=" + variantSize + ", variantColor=" + variantColor + ", price=" + price + ", quantity=" + quantity + '}';
    }
}

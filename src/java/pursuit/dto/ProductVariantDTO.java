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
    private SizeDTO variantSize;
    private ColorDTO variantColor;
    private float price;
    private int quantity;
    private boolean isDefault;

    public ProductVariantDTO() {
    }

    public ProductVariantDTO(int productVariantId, ProductDTO product, SizeDTO variantSize, ColorDTO variantColor, float price, int quantity, boolean isDefault) {
        this.productVariantId = productVariantId;
        this.product = product;
        this.variantSize = variantSize;
        this.variantColor = variantColor;
        this.price = price;
        this.quantity = quantity;
        this.isDefault = isDefault;
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

    public SizeDTO getVariantSize() {
        return variantSize;
    }

    public void setVariantSize(SizeDTO variantSize) {
        this.variantSize = variantSize;
    }

    public ColorDTO getVariantColor() {
        return variantColor;
    }

    public void setVariantColor(ColorDTO variantColor) {
        this.variantColor = variantColor;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public String toString() {
        return "ProductVariantDTO{" + "productVariantId=" + productVariantId + ", product=" + product + ", variantSize=" + variantSize + ", variantColor=" + variantColor + ", price=" + price + ", quantity=" + quantity + ", isDefault=" + isDefault + '}';
    }
}

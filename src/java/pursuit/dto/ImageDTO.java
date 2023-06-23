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
public class ImageDTO {

    private int imageId;
    private ProductVariantDTO productVariant;
    private String imageUrl;
    private boolean isDefault;

    public ImageDTO() {
    }

    public ImageDTO(int imageId, ProductVariantDTO productVariant, String imageUrl, boolean isDefault) {
        this.imageId = imageId;
        this.productVariant = productVariant;
        this.imageUrl = imageUrl;
        this.isDefault = isDefault;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public ProductVariantDTO getProductVariant() {
        return productVariant;
    }

    public void setProductVariant(ProductVariantDTO productVariant) {
        this.productVariant = productVariant;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public String toString() {
        return "ImageDTO{" + "imageId=" + imageId + ", productVariant=" + productVariant + ", imageUrl=" + imageUrl + ", isDefault=" + isDefault + '}';
    }
}

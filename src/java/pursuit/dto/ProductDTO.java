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
public class ProductDTO {

    private int productId;
    private CategoryDTO category;
    private String productName;
    private String description;
    private int unitsInStock;
    private int unitsOnOrder;
    private boolean discontinued;

    public ProductDTO() {
    }

    public ProductDTO(int productId, CategoryDTO category, String productName, String description, int unitsInStock, int unitsOnOrder, boolean discontinued) {
        this.productId = productId;
        this.category = category;
        this.productName = productName;
        this.description = description;
        this.unitsInStock = unitsInStock;
        this.unitsOnOrder = unitsOnOrder;
        this.discontinued = discontinued;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(int unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public int getUnitsOnOrder() {
        return unitsOnOrder;
    }

    public void setUnitsOnOrder(int unitsOnOrder) {
        this.unitsOnOrder = unitsOnOrder;
    }

    public boolean isDiscontinued() {
        return discontinued;
    }

    public void setDiscontinued(boolean discontinued) {
        this.discontinued = discontinued;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", category=" + category + ", productName=" + productName + ", description=" + description + ", unitsInStock=" + unitsInStock + ", unitsOnOrder=" + unitsOnOrder + ", discontinued=" + discontinued + '}';
    }
}

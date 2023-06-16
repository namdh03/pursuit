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
public class AddressDTO {

    private int addressId;
    private CustomerDTO customer;
    private String fullName;
    private String phone;
    private String specificAddress;
    private boolean isDefault;

    public AddressDTO() {
    }

    public AddressDTO(int addressId, CustomerDTO customer, String fullName, String phone, String specificAddress, boolean isDefault) {
        this.addressId = addressId;
        this.customer = customer;
        this.fullName = fullName;
        this.phone = phone;
        this.specificAddress = specificAddress;
        this.isDefault = isDefault;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSpecificAddress() {
        return specificAddress;
    }

    public void setSpecificAddress(String specificAddress) {
        this.specificAddress = specificAddress;
    }

    public boolean isIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public String toString() {
        return "Address{" + "addressId=" + addressId + ", customer=" + customer + ", fullName=" + fullName + ", phone=" + phone + ", specificAddress=" + specificAddress + ", isDefault=" + isDefault + '}';
    }
}

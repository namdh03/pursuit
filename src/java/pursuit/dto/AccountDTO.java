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
public class AccountDTO {

    private int accountId;
    private CustomerDTO customer;
    private String facebookId;
    private String googleId;
    private RoleDTO role;
    private String email;
    private String username;
    private String password;
    private String verificationCode;
    private Date verificationExpiry;
    private boolean verificationStatus;

    public AccountDTO() {
    }

    public AccountDTO(int accountId, CustomerDTO customer, String facebookId, String googleId, RoleDTO role, String email, String username, String password, String verificationCode, Date verificationExpiry, boolean verificationStatus) {
        this.accountId = accountId;
        this.customer = customer;
        this.facebookId = facebookId;
        this.googleId = googleId;
        this.role = role;
        this.email = email;
        this.username = username;
        this.password = password;
        this.verificationCode = verificationCode;
        this.verificationExpiry = verificationExpiry;
        this.verificationStatus = verificationStatus;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public String getFacebookId() {
        return facebookId;
    }

    public void setFacebookId(String facebookId) {
        this.facebookId = facebookId;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }

    public RoleDTO getRole() {
        return role;
    }

    public void setRole(RoleDTO role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Date getVerificationExpiry() {
        return verificationExpiry;
    }

    public void setVerificationExpiry(Date verificationExpiry) {
        this.verificationExpiry = verificationExpiry;
    }

    public boolean isVerificationStatus() {
        return verificationStatus;
    }

    public void setVerificationStatus(boolean verificationStatus) {
        this.verificationStatus = verificationStatus;
    }

    @Override
    public String toString() {
        return "Account{" + "accountId=" + accountId + ", customer=" + customer + ", facebookId=" + facebookId + ", googleId=" + googleId + ", role=" + role + ", email=" + email + ", username=" + username + ", password=" + password + ", verificationCode=" + verificationCode + ", verificationExpiry=" + verificationExpiry + ", verificationStatus=" + verificationStatus + '}';
    }
}

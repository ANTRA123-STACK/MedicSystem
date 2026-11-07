package model;

import java.io.Serializable;

public class Order implements Serializable {

    private int orderId;
    private String customerName;
    private String mobile;
    private String address;
    private String city;
    private String pincode;
    private String paymentMethod;
    private double totalAmount;

    public Order() {
    }

    public Order(String customerName, String mobile, String address,
                 String city, String pincode, String paymentMethod,
                 double totalAmount) {

        this.customerName = customerName;
        this.mobile = mobile;
        this.address = address;
        this.city = city;
        this.pincode = pincode;
        this.paymentMethod = paymentMethod;
        this.totalAmount = totalAmount;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
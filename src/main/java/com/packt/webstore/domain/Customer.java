package com.packt.webstore.domain;

import java.io.Serializable;

public class Customer implements Serializable {

    private static final long serialVersionUID = -3039060772575358710L;

    private Long customerId;
    private String name;
    private Address billingAddress;
    private String phoneNumber;

    public Customer() {
        super();
        this.billingAddress = new Address();
    }

    public Customer(Long customerId, String name) {
        this();
        this.customerId = customerId;
        this.name = name;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(Address billingAddress) {
        this.billingAddress = billingAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}

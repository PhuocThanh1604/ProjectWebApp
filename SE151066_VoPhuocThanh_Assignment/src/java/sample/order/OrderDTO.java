/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

/**
 *
 * @author phuoc
 */
public class OrderDTO {
    private int orderID;
    private String email;
    private double total;   
    private String orderDate;
     private boolean status;

    public OrderDTO() {  this.orderID = orderID;
        this.email = "";
        this.total = 0;
        this.orderDate = "";
        this.status = true;
        
    }

    public OrderDTO(int orderID, String email, double total, String orderDate, boolean status) {
        this.orderID = orderID;
        this.email = email;
        this.total = total;
        this.orderDate = orderDate;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderID=" + orderID + ", email=" + email + ", total=" + total + ", orderDate=" + orderDate + ", status=" + status + '}';
    }

    
}

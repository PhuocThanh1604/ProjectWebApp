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
public class OrderDetailDTO {

    private int detailID;
    private int orderID;
    private double price;
    private int quantity;
    private int productID;
    private boolean status;

    public OrderDetailDTO() {
        this.detailID = 0;
        this.orderID = 0;
        this.price = 0;
        this.quantity = 0;
        this.productID = 0;
        this.status = true;
    }

    public OrderDetailDTO(int detailID, int orderID, double price, int quantity, int productID, boolean status) {
        this.detailID = detailID;
        this.orderID = orderID;
        this.price = price;
        this.quantity = quantity;
        this.productID = productID;
        this.status = status;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
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

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

   
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import sample.product.*;

/**
 *
 * @author Mr.Thanh
 */
public class OrderError {
  private int orderIDError;
    private String orderDateError;
    private double totalError;   
    private int userIDError;
    private boolean statusErro;

    public OrderError() {
    }

    
    public OrderError(int orderIDError, String orderDateError, double totalError, int userIDError, boolean statusErro) {
        this.orderIDError = orderIDError;
        this.orderDateError = orderDateError;
        this.totalError = totalError;
        this.userIDError = userIDError;
        this.statusErro = statusErro;
    }

    public int getOrderIDError() {
        return orderIDError;
    }

    public void setOrderIDError(int orderIDError) {
        this.orderIDError = orderIDError;
    }

    public String getOrderDateError() {
        return orderDateError;
    }

    public void setOrderDateError(String orderDateError) {
        this.orderDateError = orderDateError;
    }

    public double getTotalError() {
        return totalError;
    }

    public void setTotalError(double totalError) {
        this.totalError = totalError;
    }

    public int getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(int userIDError) {
        this.userIDError = userIDError;
    }

    public boolean isStatusErro() {
        return statusErro;
    }

    public void setStatusErro(boolean statusErro) {
        this.statusErro = statusErro;
    }

    @Override
    public String toString() {
        return "OrderError{" + "orderIDError=" + orderIDError + ", orderDateError=" + orderDateError + ", totalError=" + totalError + ", userIDError=" + userIDError + ", statusErro=" + statusErro + '}';
    }

    
    
}

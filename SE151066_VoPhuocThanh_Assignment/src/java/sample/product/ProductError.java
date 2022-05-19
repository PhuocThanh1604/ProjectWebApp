/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Mr.Thanh
 */
public class ProductError {
     private String productIDError;
    private String productNameError;
    private String imageError;
    private double priceError;
    private int quantityError;
    private String catagoryIDError;
    private String usingDateError;
    private String importDateError;

    public ProductError() {
         this.productIDError = "";
        this.productNameError = "";
        this.imageError = "";
        this.priceError = 0;
        this.quantityError = 0;
        this.catagoryIDError = "";
        this.usingDateError = "";
        this.importDateError = "";
    }

    public ProductError(String productIDError, String productNameError, String imageError, double priceError, int quantityError, String catagoryIDError, String usingDateError, String importDateError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.imageError = imageError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.catagoryIDError = catagoryIDError;
        this.usingDateError = usingDateError;
        this.importDateError = importDateError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public double getPriceError() {
        return priceError;
    }

    public void setPriceError(double priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getCatagoryIDError() {
        return catagoryIDError;
    }

    public void setCatagoryIDError(String catagoryIDError) {
        this.catagoryIDError = catagoryIDError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    @Override
    public String toString() {
        return "ProductError{" + "productIDError=" + productIDError + ", productNameError=" + productNameError + ", imageError=" + imageError + ", priceError=" + priceError + ", quantityError=" + quantityError + ", catagoryIDError=" + catagoryIDError + ", usingDateError=" + usingDateError + ", importDateError=" + importDateError + '}';
    }
    
    
}

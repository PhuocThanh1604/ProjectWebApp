package sample.product;
/**
 *
 * @author Mr.Thanh
 */
public class ProductDTO {

    private int productID;
    private String productName;
    private int quantity;
    private double price;
    private String image;
    private int categoryID;
    private String usingDate;
    private String importDate;
    private boolean status;

    public ProductDTO() {
        this.productID = 0;
        this.productName = productName;
        this.image = "";
        this.price = 0;
        this.quantity = 0;
        this.categoryID = 0;
        this.usingDate = "";
        this.importDate = "";
        this.status = true;
    }

    public ProductDTO(int productID, String productName, String image, double price, int quantity, int categoryID, String usingDate, String importDate, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.usingDate = usingDate;
        this.importDate = importDate;
        this.status = status;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", productName=" + productName + ", image=" + image + ", price=" + price + ", quantity=" + quantity + ", categoryID=" + categoryID + ", usingDate=" + usingDate + ", importDate=" + importDate + ", status=" + status + '}';
    }

}

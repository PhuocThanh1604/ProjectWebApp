package sample.user;

import sample.product.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import sample.category.CategoryDTO;
import sample.order.OrderDTO;
import sample.user.UserDTO;
import sample.utils.DBUtils;
import sessionmodel.Cart;

/**
 *
 * @author Mr.Thanh
 */
public class UserDAO {

    private static final String LOGIN = "SELECT fullName, roleID FROM tblUsers WHERE email=? AND password=?";
    private static final String SEARCH = "SELECT fullName,roleID, address, birthday, phone, email, status FROM tblUsers WHERE fullName like ?";
    private static final String SEARCH_PRODUCT = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate, status FROM tblProduct WHERE productName like ?";
    private static final String SEARCH_PRODUCT_ID = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE productID=?";
    private static final String DELETE_PRODUCT = "UPDATE tblProduct SET status = 0 WHERE productID=?";
    private static final String DELETE = "DELETE tblProduct WHERE productID=?";
    private static final String UPDATE_PRODUCT = "UPDATE tblProduct SET  productName=?, Image=?, price=?, quantity=?, importDate=?, usingDate=?, status=? WHERE productID=?";
    private static final String UPDATE_QUANTITY_AFTER_BUY = "UPDATE [dbo].[tblProduct] SET  [quantity] = [quantity] - ? WHERE productID=?";
    private static final String CHECK_DUPLICATE = "SELECT [email],[fullName],[roleID] FROM [dbo].[tblUsers] WHERE [email] = ?";
    private static final String SEARCH_ALL_PRODUCT = "SELECT * from tblProduct";
    private static final String CREATE
            = "INSERT [dbo].[tblUsers] ([email],[fullName], [password], [roleID], [address], [birthday], [phone],[status] )" + "VALUES (?,?,?,?,?,?,?,?)";
    private static final String SEARCH_CATEGORY = "SELECT categoryID, categoryName FROM tblCategory WHERE categoryID=?";
    private static final String CREATE_PRODUCT = "INSERT [dbo].[tblProduct] ([productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])" + "VALUES (?,?,?,?,?,?,?)";
    private static final String SEARCH_PRODUCT_CATEGORY = "SELECT productID, productName, image, price, quantity, categoryID FROM tblProduct WHERE categoryID=? and status=1";

    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    user = new UserDTO(email, roleID, password, "", "", "", "", true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != conn) {
                rs.close();
            }
            if (ptm != conn) {
                ptm.close();
            }
            if (conn != conn) {
                conn.close();
            }

        }
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    int roleID = rs.getInt("roleID");
                    String addrress = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String status = rs.getString("status");
                    listUser.add(new UserDTO(fullName, roleID, password, addrress, birthday, phone, email, true));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listUser;
    }

    public UserDTO getUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [email]\n"
                    + "      ,[fullName]\n"
                    + "      ,[password]\n"
                    + "      ,[roleID]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[tblUsers] WHERE [email] = ? And [status] = 1";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    int roleID = rs.getInt("roleID");
                    String addrress = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String status = rs.getString("status");
                    user = new UserDTO(fullName, roleID, password, addrress, birthday, phone, email, true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public void createUserByGoogle(String email, String name) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "INSERT INTO [dbo].[tblUsers]\n"
                + "           ([email]\n"
                + "           ,[fullName]\n"
                + "           ,[password]\n"
                + "           ,[roleID]\n"
                + "           ,[address]\n"
                + "           ,[birthday]\n"
                + "           ,[phone]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "          (?,?,?,?,?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, email);
                ptm.setString(2, name);
                ptm.setString(3, "");
                ptm.setInt(4, 2);
                ptm.setString(5, "");
                ptm.setString(6, "");
                ptm.setString(7, "");
                ptm.setInt(8, 1);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }
public boolean checkDuplicate(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != conn) {
                rs.close();
            }
            if (ptm != conn) {
                ptm.close();
            }
            if (conn != conn) {
                conn.close();
            }

        }
        return check;
    }

    public boolean create(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setInt(4, user.getRoleID());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getBirthday());
                ptm.setString(7, user.getPhone());
                ptm.setBoolean(8, user.isStatus());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    //List product
    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    boolean status = rs.getBoolean("status");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, usingDate, importDate, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }
    public List<ProductDTO> getListProductID(int id) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, usingDate, importDate, true));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }
    public List<ProductDTO> getListProductCategory(int categoryID) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT_CATEGORY);
                ptm.setInt(1, categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");

                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, "", "", true));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }
//Category
    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> listCategory = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            rs = ptm.executeQuery();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_CATEGORY);
                while (rs.next()) {
                    int categoryID = rs.getInt("categoryID");
                    String categoryName = rs.getString("categoryName");
                    listCategory.add(new CategoryDTO(categoryID, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return listCategory;
        }
    }

    public boolean createProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_PRODUCT);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setInt(5, product.getCategoryID());
                ptm.setString(6, product.getImportDate());
                ptm.setString(7, product.getUsingDate());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getProductQuantity(int productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [quantity] FROM [dbo].[tblProduct]"
                    + "   WHERE DATEDIFF (day, [usingDate], getDate()) <= 0 "
                    + "   AND [status] = 1 AND productID = ?";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return -1;
    }

    public ProductDTO getProductByProductIDByUser(int productID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [productID]\n"
                    + "         ,[productName]\n"
                    + "         ,[quantity]\n"
                    + "         ,[price]\n"
                    + "         ,[image]\n"
                    + "         ,[categoryID]\n"
                    + "         ,[importDate]\n"
                    + "         ,[usingDate]\n"
                    + "         ,[status]\n"
                    + "   FROM [dbo].[tblProduct] "
                    + "   WHERE [productID] = ? "
                    + "   AND DATEDIFF (day, [usingDate], getDate()) <= 0 AND [quantity] > 0 AND [status] = 1";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    String image = rs.getString("image");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    boolean status = rs.getBoolean("status");
                    product = new ProductDTO(productID, productName, image, price, quantity, categoryID, usingDate, importDate, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }

    public List<ProductDTO> getAllProduct() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_ALL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new ProductDTO(productID, productName, image, price, quantity, productID, usingDate, importDate, true));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalProductsByAdmin() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT([productID]) FROM [dbo].[tblProduct] WHERE [status] = 1";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return -1;
    }

    public int getTotalProductsByUser() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT([productID]) FROM [dbo].[tblProduct] "
                    + "   WHERE DATEDIFF (day, [usingDate], getDate()) <= 0 AND [quantity] > 0 AND [status] = 1";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return -1;
    }
    //Dêlete
    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getImportDate());
                ptm.setString(6, product.getUsingDate());
                ptm.setBoolean(7, product.isStatus());
                ptm.setInt(8, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;

    }
//Update
    public void updateQuantityAfterBuy(int productID, int quantity) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY_AFTER_BUY);
                ptm.setInt(1, quantity);
                ptm.setInt(2, productID);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
//Order
    public int creatReturnID(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "INSERT INTO [dbo].[tblOrder]\n"
                    + "           ([email]\n"
                    + "           ,[total]\n"
                    + "           ,[orderDate]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "          (?,?,?,?)";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, order.getEmail());
                ptm.setDouble(2, order.getTotal());
                ptm.setString(3, order.getOrderDate());
                ptm.setInt(4, 1);
                ptm.executeUpdate();
                rs = ptm.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return 0;
    }

    public void saveOrderDetail(int orderID, Map<Integer, Cart> carts) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            String sql = "INSERT INTO [dbo].[tblOrderDetail]\n"
                    + "           ([orderID]\n"
                    + "           ,[productID]\n"
                    + "           ,[price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "          (?,?,?,?,?)";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, orderID);
                for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                    Cart cart = entry.getValue();
                    ptm.setInt(2, cart.getProduct().getProductID());
                    ptm.setDouble(3, cart.getProduct().getPrice());
                    ptm.setInt(4, cart.getQuantity());
                    ptm.setInt(5, 1);
                    ptm.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}

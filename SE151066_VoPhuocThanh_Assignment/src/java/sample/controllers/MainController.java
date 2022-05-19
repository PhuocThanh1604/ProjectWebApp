package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import sample.product.ProductDTO;
import sample.user.UserDAO;

/**
 *
 * @author Mr.Thanh
 */
public class MainController extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());
    private static final String ERROR = "HomeController";
    private static final String HOME = "Home";
    private static final String HOME_CONTROLLER = "HomeController";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTOLLER = "LoginController";

    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTOLLER = "SearchController";

    private static final String SEARCH_ADMIN = "SearchAdmin";
    private static final String SEARCH_ADMIN_CONTOLLER = "SearchAdminController";

    private static final String CREATE = "Create";
    private static final String CREATE_CONTOLLER = "CreateController";

    private static final String CREATE_PRODUCT = "CreateProduct";
    private static final String CREATE_PRODUCT_CONTOLLER = "CreateProductController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTOLLER = "LogoutController";

    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";

    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";

    private static final String SEARCH_CATEGORY = "Category";
    private static final String SEARCH_CATEGORY_CONTROLLER = "SearchCategoryController";

    private static final String ADD_TO_CART = "Add";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCart";

    private static final String CART = "Cart";
    private static final String CART_CONTROLLER = "CartController";

    private static final String VIEW_TO_CART = "View";
    private static final String VIEW_TO_CART_CONTROLLER = "viewCart.jsp";

    private static final String EDIT_TO_CART = "Edit";
    private static final String EDIT_TO_CART_CONTROLLER = "EditCartController";

    private static final String REMOVE_TO_CART = "Remove";
    private static final String REMOVE_TO_CART_CONTROLLER = "RemoveCartController";

    private static final String CHECK_OUT = "CheckOut";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutController";

    private static final String SEN_EMAIL = "Send";
    private static final String SEN_EMAIL_CONTROLLER = "EmailSendingController";

    private static final String UPDATE_QUANTITY = "UpdateQuantityController";
    private static final String UPDATE_QUANTITY_CONTROLLER = "UpdateQuantityController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String acction = request.getParameter("action");
            if (LOGIN.equals(acction)) {
                url = LOGIN_CONTOLLER;
            } else if (SEARCH.equals(acction)) {
                url = SEARCH_CONTOLLER;
            } else if (CREATE.equals(acction)) {
                url = CREATE_CONTOLLER;
            } else if (LOGOUT.equals(acction)) {
                url = LOGOUT_CONTOLLER;
            } else if (DELETE.equals(acction)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(acction)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE_PRODUCT.equals(acction)) {
                url = CREATE_PRODUCT_CONTOLLER;
            } else if (SEARCH_ADMIN.equals(acction)) {
                url = SEARCH_ADMIN_CONTOLLER;
            } else if (SEARCH_CATEGORY.equals(acction)) {
                url = SEARCH_CATEGORY_CONTROLLER;
            } else if (ADD_TO_CART.equals(acction)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (VIEW_TO_CART.equals(acction)) {
                url = VIEW_TO_CART_CONTROLLER;
            } else if (EDIT_TO_CART.equals(acction)) {
                url = EDIT_TO_CART_CONTROLLER;
            } else if (REMOVE_TO_CART.equals(acction)) {
                url = REMOVE_TO_CART_CONTROLLER;
            } else if (CHECK_OUT.equals(acction)) {
                url = CHECK_OUT_CONTROLLER;
            } else if (SEN_EMAIL.equals(acction)) {
                url = SEN_EMAIL_CONTROLLER;
            } else if (CART.equals(acction)) {
                url = CART_CONTROLLER;
            } else if (HOME.equals(acction)) {
                url = HOME_CONTROLLER;
            } else if (UPDATE_QUANTITY.equals(acction)) {
                url = UPDATE_QUANTITY_CONTROLLER;
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

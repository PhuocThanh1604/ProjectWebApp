package sample.controllers;

import java.io.IOException;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.PropertyConfigurator;
import sample.order.OrderDTO;
import sample.product.ProductDTO;
import sessionmodel.Cart;
import sample.user.UserDAO;

/**
 *
 * @author Mr.Thanh
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {
    
    private static final String ERROR = "Error.jsp";
    private static final String SUCCESS = "checkOut.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        double totalMoney = 0;
        try {
            URL urlLo4j = this.getClass().getResource("/log4j/Log4j.properties");
            PropertyConfigurator.configure(urlLo4j);
            HttpSession session = request.getSession();
            if (session.getAttribute("LOGIN_USER") == null) {
                url = ERROR;
            } else {
                Map<Integer, Cart> carts = (Map<Integer, sessionmodel.Cart>) session.getAttribute("CARTS");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                    Cart cart = entry.getValue();
                    totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
                }
                url = SUCCESS;
                request.setAttribute("TOTAL_MONEY", totalMoney);
            }
        } catch (Exception e) {
            log("Error at ChecOutController:" + e.toString());
            
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        double total = 0;
        try {
            URL urlLo4j = this.getClass().getResource("/log4j/Log4j.properties");
            PropertyConfigurator.configure(urlLo4j);
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String orderDate = request.getParameter("orderDate");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            HttpSession session = request.getSession();
            if (session.getAttribute("CARTS") == null) {
                url = "error.jsp";
            } else {
                Map<Integer, Cart> carts = (Map<Integer, sessionmodel.Cart>) session.getAttribute("CARTS");
                
                for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                    Cart cart = entry.getValue();
                    new UserDAO().updateQuantityAfterBuy(cart.getProduct().getProductID(),cart.getQuantity());
                    total += cart.getQuantity() * cart.getProduct().getPrice(); //totalPrice
                }
                OrderDTO order = new OrderDTO(0, email, total, orderDate, true);
                int orderID = new UserDAO().creatReturnID(order);
                new UserDAO().saveOrderDetail(orderID, carts);
                session.removeAttribute("CARTS");
                url = "bySuccess.jsp";
            }
        } catch (Exception e) {
            log("Error at CheckoutController" + e.toString());
        } finally {
            response.sendRedirect(url);
        }
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

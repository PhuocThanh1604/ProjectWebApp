package sample.controllers;

import com.sun.istack.internal.logging.Logger;
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
import sample.product.ProductDTO;
import sample.user.UserDAO;
import sessionmodel.Cart;

/**
 *
 * @author Mr.Thanh
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {
    private final Logger log = Logger.getLogger(this.getClass());
    private static final String ERROR = "home.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            URL urlLof4j = this.getClass().getResource("/log4j/Log4j.properties");
            PropertyConfigurator.configure(urlLof4j);
            int productID = Integer.parseInt(request.getParameter("productID"));
            String keywordStr = request.getParameter("keyword");
            HttpSession session = request.getSession();
            if (session.getAttribute("LOGIN_USER") == null) {
                url = "login.jsp";
            } else {
                if(request.getParameter("page")!=null){
                    int page = Integer.parseInt(request.getParameter("page"));
                    request.setAttribute("PAGE", page);
                }
                Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("CARTS");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                if (!carts.containsKey(productID)) {
                    ProductDTO product = new UserDAO().getProductByProductIDByUser(productID);
                    carts.put(productID, new Cart(product, 1));
                } else {
                    int maxQuantity = new UserDAO().getProductQuantity(productID);
                    int currentQuantity = carts.get(productID).getQuantity();
                    String mess = "Eror, this product has not enough quantity";
                    if (currentQuantity >= maxQuantity) {
                        request.setAttribute("MESSAGE", mess);
                        request.setAttribute("ERROR_QUANTITY_MESSAGE", "This product has not enough quantity.");
                    } else {
                        carts.get(productID).setQuantity(currentQuantity + 1);
                    }
                }
                session.setAttribute("CARTS", carts);
                url = (String) session.getAttribute("URL");
                if (url == null) {
                    url = "MainController?action=Home";
                }
                if (keywordStr != null) {
                    url = "viewCart.jsp";
                }
            }
        } catch (Exception e) {
            log("Error at AddToCart:" + e.toString());
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

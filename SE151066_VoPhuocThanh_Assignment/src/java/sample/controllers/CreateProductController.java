
package sample.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.category.CategoryDTO;
import sample.product.ProductDTO;
import sample.product.ProductError;
import sample.user.UserDAO;

/**
 *
 * @author Mr.Thanh
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "createProduct.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int category = Integer.parseInt(request.getParameter("categoryID"));
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            UserDAO dao = new UserDAO();
            ProductError productError = new ProductError();
            boolean checkValidation = true;
            if (checkValidation) {
                ProductDTO product = new ProductDTO(0, productName, image, price, quantity, category, usingDate, importDate, true);
                boolean checkCreate = dao.createProduct(product);
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("LIST_PRODUCT", productError);
            }
        } catch (Exception e) {
            log("Error at CreateProductController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
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

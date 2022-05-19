
package sample.controllers;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionmodel.Cart;
import sample.product.ProductDTO;

/**
 *
 * @author Mr.Thanh
 */
@WebServlet(name = "RemoveController", urlPatterns = {"/RemoveCartController"})
public class RemoveCartController extends HttpServlet {

   private static final  String ERROR ="error.jsp";
   private static final  String SUCCESS ="viewCart.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            HttpSession session  = request.getSession();
            if(session.getAttribute("CARTS") ==null){
                url = ERROR;
            }else{
                 Map<Integer, Cart> carts = (Map<Integer, sessionmodel.Cart>) session.getAttribute("CARTS");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                if(!carts.containsKey(productID)){
                    url = ERROR;
                }else if(carts.containsKey(productID)){
                        carts.remove(productID);
                        session.setAttribute("CARTS", carts);
                        url=SUCCESS;
                    }
                }
        } catch (Exception e) {
            log("Error at RemoveController:" +e.toString());
        }finally{
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

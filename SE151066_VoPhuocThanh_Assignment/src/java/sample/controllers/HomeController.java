/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import sample.product.ProductDTO;
import sample.user.CategoryDAO;
import sample.user.UserDAO;
import sample.category.CategoryDTO;

/**
 *
 * @author Mr.Thanh
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {
    private final Logger log = Logger.getLogger(this.getClass());
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "MainController?action=Search&search=";
    private static final int PAGE_SIZE =9;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        int page = 1;
        try {
            String home = request.getParameter("home");
            String pageStr = request.getParameter("page");
            if(pageStr !=null){
                page= Integer.parseInt(pageStr);
            }
            UserDAO dao = new UserDAO();
            HttpSession session = request.getSession();
            List<ProductDTO> listProducts = dao.getAllProduct();
            List<CategoryDTO> listCategories = new CategoryDAO().getListCategory();
            int totalProducts = new UserDAO().getTotalProductsByUser();
            int totalPage = totalProducts / PAGE_SIZE;
            if (totalProducts % PAGE_SIZE !=0 ){
                totalPage +=1;
            }
            if (listProducts.size() > 0) {
                request.setAttribute("LIST_PRODUCT", listProducts);
                request.setAttribute("PAGE", page);
                request.setAttribute("TOTAL_PRODUCT", totalProducts);
                request.setAttribute("TOTAL_PAGE", totalPage);
                session.setAttribute("URL","HomeController");
                request.setAttribute("LIST_CATEGORY", listCategories);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at DeteleProductController" +e.toString());
            log.info(e.getMessage(),e);
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


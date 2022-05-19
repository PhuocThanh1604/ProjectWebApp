
package sample.controllers;

import java.io.IOException;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Mr.Thanh
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private final Logger log = Logger.getLogger(this.getClass());
    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            URL urlLof4j = this.getClass().getResource("/log4j/Log4j.properties");
            PropertyConfigurator.configure(urlLof4j);
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName"); 
            String confirm = request.getParameter("confirm");
            String password = request.getParameter("password");
            String adrress = request.getParameter("adrress");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            boolean checkValidation = true;
            boolean checkDuplicate = new UserDAO().checkDuplicate(email);
             if (checkDuplicate) {
                userError.setEmailError("Duplicate Email");
                checkValidation = false;
            }
            if (email.length() < 2 || email.length() > 30) {
                userError.setEmailError("Email must be in[5,10]");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 50) {
                userError.setFullNameError("FullName must be in[5,20]");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("two passwords are not the same");
                checkValidation = false;
            }
            if (adrress.length() < 5 || adrress.length() > 60) {
                userError.setAddressError("Adrress must be in[5,60]");
                checkValidation = false;
            }
            if (phone.length() < 0 || phone.length() > 10) {
                userError.setPhoneError("Phone must be in[0,9]");
                checkValidation = false;
            }
            if (email.length() < 5 || email.length() > 60) {
                userError.setEmailError("Email must be in[5,60]");
                checkValidation = false;
            }
            if (checkValidation) {
                //1 Admin
                //2 User
                UserDTO user = new UserDTO(fullName, 2, password, adrress, birthday, phone, email, checkDuplicate);
                boolean checkCreate = new UserDAO().create(user);
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userError.setEmailError("Duplicate email ");
                request.setAttribute("USER_ERROR", userError);
            }
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

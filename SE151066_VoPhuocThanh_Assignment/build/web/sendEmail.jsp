<%-- 
    Document   : sendEmail
    Created on : Mar 12, 2022, 1:02:41 PM
    Author     : Mr.Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send an e-mail</title>
        <link rel="stylesheet" href="css/styleSendEmail.css">
    </head>
    <body>
        <c:if test="${LOGIN_USER ==NULL || 1 != LOGIN_USER.roleID}">
        <c:redirect url ="MainController?action=Logout"></c:redirect>
    </c:if>
        <div class="wrap">
            <h1>Contact With User</h1>
            <form class="contact"  action="MainController" method="POST">
                <ul>
                    <li>
                        <label for="email">Your Email:</label>
                        <input type="email" name="recipient" placeholder="peter@example.com" required />
                    </li>
                    <li>
                        <label for="name">Your Name:</label>
                        <input name="name" required />
                    </li>
                    <li>
                        <label for="message">Your message:</label>
                        <textarea type="text" name="content"  rows="6" required ></textarea>
                    </li>
                    <li>
                        <button class="float-right" type="submit" name="action" value="Send">Send Email</button>
                    </li>
                     <li>
                         <button class="btn btn-warning btn-sm ml-3" >
                        <a style="color: white" href="MainController?action=Search&search=">Cannel</a>
                        </button>
                    </li>
                </ul>
            </form>
        </div>
    </body>
</html>

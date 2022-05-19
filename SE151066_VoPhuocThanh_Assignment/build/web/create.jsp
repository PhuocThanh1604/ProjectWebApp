<%-- 
    Document   : create.jsp
    Created on : Mar 5, 2022, 12:08:14 PM
    Author     : Mr.Thanh
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account User </title>
        <link rel="stylesheet" href="css/stylecreateuser.css">
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
     
        <form action="MainController" method="POST">
            <div class="row">
                <div class="col-md-6 mx-auto p-0">
                    <div class="card">
                        <div class="login-box">
                            <div class="login-snip">
                                <input id="tab-1" type="radio" name="tab" class="sign-in" checked>
                                <label for="tab-1" class="tab">Sign Up</label>
                                <input id="tab-2" type="radio" name="tab" class="sign-up">
                                <label for="tab-2" class="tab"></label>
                                <div class="login-space">
                                    <div class="login">
                                        <div class="group"> <label for="user" class="label">UserID</label> 
                                            <input  id="user" type="text" name="userID" required="" class="input" placeholder="UserID"> </div>
                                            <%= userError.getUserIDError()%>

                                        <div class="group"> <label for="user" class="label">FullName</label> 
                                            <input  id="user" type="text" name="fullName" required="" n required="" class="input" placeholder="FullName"> </div>
                                            <%= userError.getFullNameError()%>

                                        <div class="group"> <label for="user" class="label">RoleID (AD&US)</label> 
                                            <input  id="user" type="text" name="roleID" required="" required="" class="input" placeholder="RoleID"> </div>
                                            <%= userError.getRoleIDError()%>


                                        <div class="group"> <label for="user" class="label">Aderress</label> 
                                            <input  id="user" type="text" name="adrress" required="" class="input" > </div>
                                            <%= userError.getAddressError()%>
                                            
                                            <!--Birthday-->
                                        <div class="group"> <label for="user" class="label">Birthday</label> 
                                            <input  id="user" type="date" name="birthday" class="input" > </div>
                                            <%= userError.getBirthdayError()%>
                                            <!-- Phone-->
                                        <div class="group"> <label for="user" class="label">Phone</label> 
                                            <input  id="user" type="text"  name="phone"  required="" class="input" > </div>
                                            <%= userError.getPhoneError()%>
                                            <!--Email-->
                                        <div class="group"> <label for="user" class="label">Email</label> 
                                            <input  id="user" type="email" name="email" required="" class="input" > </div>
                                            <%= userError.getEmailError()%>
                                         

                                        <div class="group"> <label for="pass" class="label">Password</label>
                                            <input  type="password" name="password" required="" id="pass" class="input" data-type="password" placeholder="Password"> </div>


                                        <div class="group"> <label for="pass" class="label">Confirm Password</label>
                                            <input id="pass"  type="password" name="confirm" class="input" data-type="password" placeholder="Confirm your password"> </div>


                                        <div class="group"> <input type="submit" name="action" value="Create" class="button" > </div>
                                        <form action="MainController">

                                            <div class="group"> 

                                                <a href="login.jsp" class="button"> Logout
                                            </div>
                                        </form>
                                        <div class="hr"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </form>

    </body>
</html>

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
                                        <!--Email-->
                                        <div class="group"> <label for="user" class="label">Email</label> 
                                            <input  id="email" type="email" name="email" required="" class="input" >
                                        </div>
                                        <%= userError.getEmailError()%>
                                        <div class="group">  <label for="fullName" class="label">FullName</label> 
                                            <input  id="user" type="text" minlength="2" maxlength="30" title="Full Name length should be more than 2 and less than 31"name="fullName" required="" class="input" placeholder="FullName"> 
                                        </div>
                                        <div class="group"> <label for="address" class="label">Aderress</label> 
                                            <input  id="address" type="text" name="adrress" required="" class="input" > 
                                            <%= userError.getAddressError()%>
                                        </div>
                                        <!--Birthday-->
                                        <div class="group"> <label for="birthday" class="label">Birthday</label> 
                                            <input  id="birthday" type="date" name="birthday" class="input" > 
                                            <%= userError.getBirthdayError()%>
                                        </div>
                                        <!-- Phone-->
                                        <div class="group"> <label for="phone" class="label">Phone</label> 
                                            <input  id="phone" type="text"  name="phone"  required="" pattern="[0][0-9]{9}"
                                                    title="Phone must be characters long number and begin is 0" class="input" placeholder="Phone Number" > 
                                            <%= userError.getPhoneError()%>
                                        </div>


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

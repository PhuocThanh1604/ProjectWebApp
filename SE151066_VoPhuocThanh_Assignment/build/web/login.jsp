<%-- 
    Document   : login
    Created on : Mar 3, 2022, 2:40:50 PM
    Author     : Mr.Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="	https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>


        <link rel="stylesheet" href="stylelogin.css">

        <!--Recapcha-->
        <!-- English language -->
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>

        <!-- Vietnamese language -->
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>

        <!-- Auto detecting language -->
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"></script>

    </head>
    <body>

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <section class="gradient-custom" style="height: 100vh">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <form action="MainController" method="POST">
                                    <div class="mb-md-5 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                        <p class="text-white-50 mb-5">Please enter your Email login and password!</p>

                                        <div class="form-outline form-white mb-4">
                                            <input type="email"  name="email" required="" id="typeEmailX" placeholder="Email"p class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline form-white mb-4">
                                            <input input type="password"  name="password" required="" placeholder="Password" id="typePasswordX" class="form-control form-control-lg" />
                                            <label class="form-label" for="typePasswordX"></label>
                                        </div>

                                        <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>

                                        <!--Recapcha-->
                                        <div class="form-outline form-white mb-4" style="align-content: center;">
                                            <div class="g-recaptcha" data-sitekey="6LfhlqgeAAAAAJijj_RASW44EyYkCjUTF-Mbg_Qp" data-callback="enableBtn"></div>
                                            <c:if test="${requestScope.ERROR_RECAPCHA !=null}">
                                                <h3 style="color:red; font-size:0.975rem">${requestScope.ERROR_RECAPTCHA}</h3>
                                                <c:if>
                                        </div>
                                        <div class="form-outline form-white mb-4" >
                                            <button class="btn btn-outline-light btn-lg px-5" type="submit" name="action" value="Login" id="button1" disabled="disabled">Login</button>
                                        </div>
                                        <!--Login with gmail-->
                                        <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                            <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                            
                                            <a class="text-white" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/SE151066_VoPhuocThanh_Assignment/LoginGoogleServlet&response_type=code
                                               &client_id=370151976436-b8c12glliq88ut4j0s2otfmcngmteqll.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary google-plus">
                                                <i class="fab fa-google fa-lg"></i></a>
                                        </div>
                                    </div>
                                </form>
                                <div>
                                    <p class="mb-0">Don't have an account? <a href="createUser.jsp" class="text-white-50 fw-bold">Sign Up</a></p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%= error%>
        <script>
            function enableBtn() {
                document.getElementById("button1").disabled = false;

            }


        </script>
    </body>
</html>

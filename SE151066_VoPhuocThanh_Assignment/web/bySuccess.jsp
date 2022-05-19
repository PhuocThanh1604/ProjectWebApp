<%-- 
    Document   : bySuccess
    Created on : May 6, 2022, 2:38:09 PM
    Author     : Mr.Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/styleViewCart.css">
            <title>Check Out Success</title>
    </head>
    <body>
        <%@include file="components/headerComponent.jsp"%> 
        <%@include file="components/navBarComponent.jsp"%>

        <div class="container"  style="min-height: 550px">
            <div class="alert alert-success jumbotron text-center mt-5" role="alert">
                <h1 class="display-3">Thank You!</h1>
                <p class="lead"><strong>Please check your email</strong> for further instructions on showing your order.</p>
                <hr>
                <p class="lead">
                    <a class="btn btn-outline-primary btn-sm" href="MainController?action=Home" role="button">Continue to shopping</a>
                </p>
            </div>
        </div>
          <%@include file="components/footerComponent.jsp"%>
    </body>
</html>

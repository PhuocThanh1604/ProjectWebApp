<%-- 
    Document   : createProduct
    Created on : Mar 8, 2022, 9:00:51 AM
    Author     : Mr.Thanh
--%>

<%@page import="sample.product.ProductError"%>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link  rel="stylesheet" href="css/styleCreateProduct.css">
    </head>
    <body>
        <%
            ProductError productError = (ProductError) request.getAttribute("USER_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <section class="get-in-touch">
            <h1 class="title">Create Product</h1>
            <form action="MainController" method="POST" class="contact-form row">

                <div class="form-field col-lg-6">
                    <input id="name" class="input-text js-input" type="text" name="productName" required="">
                    <label class="label" for="name">Product Name</label>
                </div>
                <%=productError.getProductNameError()%>
                <div class="form-field col-lg-6 ">
                    <input id="email" class="input-text js-input" type="text" name="image" required="" >
                    <label class="label" for="email">Image</label>
                </div>
                <%=productError.getImageError()%>
                <div class="form-field col-lg-6 ">
                    <input id="company" class="input-text js-input" type="currency"  min="0" name="price">
                    <label class="label" for="company">Price</label>
                </div>
                <div class="form-field col-lg-6 ">
                    <input id="phone" class="input-text js-input" type="number" name="quantity" min="0">
                    <label class="label" for="phone">Quantity</label>
                </div>
                <div class="form-field col-lg-6 ">
                    <!--<input id="phone" class="input-text js-input" type="number" name="quantity" min="0">-->
                    <label class="label" for="phone">Category</label>
                     <select name="categoryID">
                        <option value="1">Vegetables</option>
                        <option value="2">Fruits</option>
                    </select>
                </div>
                <div class="form-field col-lg-6 ">
                    <input id="phone" class="input-text js-input" type="date" name="importDate">
                    <label class="label" for="phone">ImportDate</label>
                </div>
                 <div class="form-field col-lg-6 ">
                    <input id="phone" class="input-text js-input" type="date" name="usingDate">
                    <label class="label" for="phone">UsingDate</label>
                </div>


                <div class="form-field col-lg-12">
                    <input class="submit-btn" type="Submit" name="action" value="CreateProduct"/>
                    <a class="submit-btn" href="admin.jsp"/>Cannel </a>
                </div>
            </form>
        </section>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>

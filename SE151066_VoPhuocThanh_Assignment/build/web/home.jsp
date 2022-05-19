<%-- 
    Document   : home
    Created on : Mar 5, 2022, 10:21:04 AM
    Author     : Mr.Thanh
--%>

<%@page import="sample.user.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="image/code-home-logo.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/stylefooter.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
    </head>
    <body>
        <%@include file="components/headerComponent.jsp"%>
        <%@include file="components/navBarComponent.jsp"%>
        <div class="jumbotron text-center" style="background-image: url('image/V01.jpg')">
            <div class="container" >
                <h1 class="jumbotron-heading" style="color: #f5f5f5;">
                    High quality fruits and vegetables</h1>
                <p class="lead text-muted mb-0"></p>
            </div>
        </div>

        <!--Body--> 
        <div class="wrapper">
            <div id="mobile-filter">
                <div  name="categoryID" class="py-3">
                    <h5 class="font-weight-bold">Categories</h5>
                    <ul class="list-group">
                        <li value="1" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                            <a href="MainController?action=Category&categoryID=1"> 
                                vegetables </a></li>
                        <li value="2" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                            <a href="MainController?action=Category&categoryID=2">Fruits</a> </li>
                    </ul>
                </div>
                <div class="py-3">
                    <h5 class="font-weight-bold">Brands</h5>
                    <form class="brand">
                        <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Royal Fields <input type="checkbox"> <span class="check"></span> </label> </div>
                        <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Crasmas Fields <input type="checkbox" checked> <span class="check"></span> </label> </div>
                        <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Vegetarisma Farm <input type="checkbox" checked> <span class="check"></span> </label> </div>
                    </form>
                </div>
                <div class="py-3">
                    <h5 class="font-weight-bold">Rating</h5>
                    <form class="rating">
                        <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                        <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                        <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                        <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                        <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                    </form>
                </div>
            </div>
            <div class="content py-md-0 py-3 d-flex">
                <section id="sidebar">
                    <div class="py-3">
                        <h5 class="font-weight-bold  ">Categories</h5>
                        <ul class="list-group"  name="categoryID">
                            <li  value="1" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                                <a style="color:#FFC107;font-size:20px; " href="MainController?action=Category&categoryID=1"> 
                                    Vegetables </a></li>
                            <li value="2" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                                <a style="color:#FFC107;font-size:20px;" href="MainController?action=Category&categoryID=2">Fruits </a> </li>
                        </ul>
                    </div>
                    <div class="py-3">
                        <h5 class="font-weight-bold">Brands</h5>
                        <form class="brand">
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Royal Fields <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Crasmas Fields <input type="checkbox" checked> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Vegetarisma Farm <input type="checkbox" checked> <span class="check"></span> </label> </div>
                        </form>
                    </div>
                    <div class="py-3">
                        <h5 class="font-weight-bold">Rating</h5>
                        <form class="rating">
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                        </form>
                    </div>
                </section> 
                <section id="products">


                    <%
                        List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                        int totalProducts = new UserDAO().getTotalProductsByUser();
                        request.setAttribute("TOTAL_PRODUCT", totalProducts);
                        if (listProduct != null) {
                            if (listProduct.size() > 0) {
                    %>
                    <table>
                        <tbody>
                        <div class="container d-flex flex-wrap">
                            <%    for (ProductDTO product : listProduct) {
                                    if (product.isStatus() == true) {
                                        if (totalProducts != 0) {
                            %>
                            <form action="MainController" method="POST">
                                <div class="col-lg-4 col-md-6 col-sm-12 offset-md-0 offset-sm-1 pt-lg-4 pt-4 ">
                                    <div class="card"> 
                                        <img  class="card-img-top" src="<%=product.getImage()%>">
                                        <input type="hidden" name="productID" value="<%=product.getProductID()%>">
                                        <input type="hidden" name="image" value="<%=product.getImage()%>">
                                        <div class="card-body">
                                            <h6 class="font-weight-bold pt-1" ><%=product.getProductName()%></h6>
                                            <input type="hidden"name="productName" value="<%=product.getProductName()%>">
                                            <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                            <div class="d-flex align-items-center justify-content-between pt-3">
                                                <div class="d-flex flex-column">
                                                    <div class="h6 font-weight-bold" name="price"><%=product.getPrice()%>$</div>
                                                    <input type="hidden"name="price" value="<%=product.getPrice()%>">
                                                    <div class="text-muted rebate" name="quantity" value="<%=totalProducts%>"><%=product.getQuantity()%></div>
                                                    <input type="hidden"name="quantity" value="1">
                                                </div>
                                                <div   >
                                                    <button class="btn btn-primary" type="submit" name="action" value="Add">Buy Now</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%
                                    }
                                }
                            %>
                            <%
                                }
                            %>
                        </div>
                        </tbody>
                    </table>

                    <%             }
                        }
                    %>

                </section>
            </div>

        </div>
                    <%@include file="components/footerComponent.jsp"%>

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
        </script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

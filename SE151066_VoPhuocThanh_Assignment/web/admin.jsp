<%-- 
    Document   : admin
    Created on : Mar 3, 2022, 3:52:59 PM
    Author     : Mr.Thanh
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Manger</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <link rel="stylesheet" href="css/styleAdmin.css">
        <link rel="stylesheet" href="css/styleSearch.css">

    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
            String searchadmin = request.getParameter("search");
            if (searchadmin == null) {
                searchadmin = "";
            }
        %>
    <c:if test="${LOGIN_USER ==NULL || 0 != LOGIN_USER.roleID}">
        <c:redirect url ="MainController?action=Logout"></c:redirect>
    </c:if>
    <div class="container-x1">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title" style="background: #FFCC33;">
                    <div class="row" >
                        <div class="col-sm-3">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-2">
                            <h2 style="color:#0000BB;">Hello:<b> <%= loginUser.getFullName()%></b> </h2>
                        </div>
                        <div class="col-sm-3">
                            <form action="MainController" method="POST">

                                <div class="container">
                                    <div class="search">
                                        <input type="text" name="search" value="<%= searchadmin%>" class="form-control input-sm" maxlength="64" placeholder="Search" />
                                        <button  type="submit" name="action" value="SearchAdmin" class="btn btn-info btn-sm">Search</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="col-sm-2">
                            <a href="login.jsp" class="btn btn-danger" >
                                Logout <i class="material-icons">&#xE15C;</i>
                            </a>
                        </div>
                        <div class="col-sm-2">
                            <a href="createProduct.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i>
                                <span style="margin-top: 0px">New a product</span></a>
                        </div>
                    </div>
                </div>
                <%
                    List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                    if (listProduct
                            != null) {
                        if (listProduct.size() > 0) {

                %>
                <table class="table table-striped table-hover" >
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Full Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>ImportDate</th>
                            <th>UsingDate</th>
                            <th>Action</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                                for (ProductDTO product : listProduct) {
                        %>
                    <form action="MainController" method="POST">
                        <tr>
                            <td> <%=product.getProductID()%></td>
                            <td>
                                <%=product.getProductName()%>
                            </td>
                            <td>
                                <img style=" width: 166px;height: 120px;" src="<%=product.getImage()%>">
                            </td>
                            <td>
                                <%=product.getPrice()%>

                                $</td>
                            <td>
                                <%=product.getQuantity()%>
                            </td>
                            <td><%=product.getImportDate()%></td> 
                            <td><%=product.getUsingDate()%></td>     

                            <td >
                                <a href="LoadProduct?productID=<%=product.getProductID()%>" class="edit" date-toggle="modal" >
                                    <i  style="margin: 5px;" class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a  class="delete"  href="MainController?&productID=<%= product.getProductID()%>&action=Delete&search=<%= searchadmin%>">
                                    <i  class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                            <td>
                                <%=product.isStatus()%> 
                            </td>

                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>

            </div>
        </div>        
    </div>
    <%        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%=error%>
    <%             }
        }
    %>

    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>

</body>
</html>

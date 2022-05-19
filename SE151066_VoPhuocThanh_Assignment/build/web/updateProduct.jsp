<%-- 
    Document   : updateProduct
    Created on : Mar 10, 2022, 1:01:26 PM
    Author     : Mr.Thanh
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <c:if test="${LOGIN_USER ==NULL || 1 != LOGIN_USER.roleID}">
    <c:redirect url ="MainController?action=Logout"></c:redirect>
    </c:if>
        <div class="container">
            <div class="col-lg-12 text-lg-center">
              
            </div>
            <%
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                if (listProduct
                        != null) {
                    if (listProduct.size() > 0) {

            %>
            <div class="col-lg-8 push-lg-4 personal-info">
                <%                                for (ProductDTO product : listProduct) {
                %>
                <form action="MainController" method="POST">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Product Name</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" name="productName" value="<%=product.getProductName()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Image</label>
                        <div class="col-lg-9">
                            <input class="form-control" type="text" name="image" value="<%=product.getImage()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Price</label>
                        <div class="col-lg-9">
                            <input class="form-control" type = "number" name="price" value="<%=product.getPrice()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Quantity</label>
                        <div class="col-lg-9">
                            <input class="form-control"   <input type="number" name="quantity" min="0" value="<%=product.getQuantity()%>"/> 
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">ImportDate</label>
                        <div class="col-lg-9">
                            <input class="form-control"   <input type="date" name="importDate" value="<%=product.getImportDate()%>"/> 
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">UsingDate</label>
                        <div class="col-lg-9">
                            <input class="form-control"   <input type="date" name="usingDate"  value="<%=product.getUsingDate()%>"/> 
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label">Status</label>
                        <div class="col-lg-9">
                            <!--<input  class="form-control" type="text" name="status" value="<%=product.isStatus()%>">-->
                            <select class="form-control" type="text" name="status" > 
                                <option value="True">Active</option>
                                <option value="False">InActive</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label form-control-label"></label>
                        <div class="col-lg-9">
                            <a href="MainController?action=SearchAdmin&search=" type="reset" class="btn btn-secondary"  />Cannel</a>
                            <input type="submit" name="action" value="Update"/>
                            <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                            <input type="hidden" name="search" value="<%= searchadmin%>"/>
                        </div>
                    </div>

                </form>
                <%
                    }
                %>
            </div>

        </div>
        <hr/>
        <%        String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>
        <%             }
            }
        %>
    </body>
</html>

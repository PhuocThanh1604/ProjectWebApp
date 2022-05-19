<%-- 
    Document   : checkOut
    Created on : Mar 15, 2022, 12:23:19 PM
    Author     : phuoc
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sessionmodel.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="PD" scope="request" value="${PRODUCT}"></c:set>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/styleViewCart.css">
            <title>Check Out</title>
        </head>
        <body>

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%@include file="components/headerComponent.jsp"%>
        <%@include file="components/navBarComponent.jsp"%>
        <c:if test="${sessionScope.LOGIN_USER == NULL && 2 !=sessionScope.LOGIN_USER.roleID}">
            <c:redirect url="MainController?action=Logout"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.CARTS == NULL && sessionScope.CARTS.size()==0}">
            <c:redirect url="MainController?action=Logout"></c:redirect>
        </c:if>
        <%=error%>

        <c:choose>
            <c:when test="${sessionScope.CARTS.size()==0 || sessionScope.CARTS == NULL}">
                <div class="column">
                    <h3>Your cart is empty</h3>
                    <a class="btn btn-outline-secondary" href="MainController?action=Search&search=">
                        <i class="icon-arrow-left"></i>&nbsp;By Now</a>
                </div>
            </c:when>
        </c:choose>


        <!--Product-->
        <div class="container padding-bottom-3x mb-1">
            <div class="table-responsive shopping-cart">
                <div class="row"> 
                    <div class="col-md-8" style="border:1px solid #ccc;border-radius: 4px; " >
                        <table class="table">
                            <thead>
                                <tr>    
                                    <th class="text-center">No</th>
                                    <th>image</th>
                                    <th class="text-center">Product Name</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-center">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.CARTS}" var="C" varStatus="counter">
                                    <tr>
                                <input type="hidden" name="productID" value="${C.value.product.productID}"/>
                                <th scope="row">${counter.count}</th>
                                <td>
                                    <div class=" text-xl text-medium">
                                        <img style="width:80px" src="${C.value.product.image}"alt="Product">
                                    </div>
                                </td>
                                <td>
                                    <div class="text-center text-xl text-medium">
                                        <h4 class="product-title">${C.value.product.productName}</h4><span>
                                    </div>
                                </td>
                                <td class="text-center text-xl text-medium "><h4>$${C.value.product.price}</h4></td>
                                <td class="text-center text-xl text-medium"><h4>${C.value.quantity}</h4></td>
                                <td class="text-center text-xl text-medium"><h4>${C.value.quantity * C.value.product.price}</h4></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--Inforamtion user-->
                    <div class="col-md-4 container-fluid">
                        <h3> Information of customer</h3>
                        <div class="row justify-content-center">
                            <div class="card my-4 p-3">
                                <div class="row main">
                                    <div class="col-12"><span>Cart</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>Shipping confirmation</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>Credit card checkout</span></div>
                                </div>
                                <div class="row justify-content-center mrow">
                                    <div class="col-12">
                                        <img src="https://img.icons8.com/color/48/000000/mastercard-logo.png" width="35px" height="35px"/>
                                        <img src="https://img.icons8.com/color/48/000000/visa.png" width="35px" height="35px"/>
                                        <img src="https://img.icons8.com/color/48/000000/paypal.png" width="35px" height="35px"/>
                                    </div>
                                </div>
                                <form class="form-card" action="CheckOutController" method="POST">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <input type="email"  name="email" class="form-control p-0" id="email" required="" value="${sessionScope.LOGIN_USER.email}">
                                                <label class="form-control-placeholder p-0" for="email">Email</label>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <input  type="date" name="orderDate" class="form-control p-0" required="" > 
                                                <label for="orderDate" class="form-control-placeholder p-0" >Order Date</label> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <input type="text" name="fullName" class="form-control p-0" id="fullName" required="" value="${sessionScope.LOGIN_USER.fullName}">
                                                    <label class="form-control-placeholder p-0" for="fullName">FullName</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <input name="phone" type="phone" class="form-control p-0" id="phone" required="" value="${sessionScope.LOGIN_USER.phone}" >
                                                    <label class="form-control-placeholder p-0" for="phone">Phone</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <input name="adress" type="adress" class="form-control p-0" id="adrress" required="" value="${sessionScope.LOGIN_USER.address}">
                                                    <label class="form-control-placeholder p-0" for="adress">Adress</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-12">
                                                <button type="submit" class="btn btn-primary btn-block">Pay</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footerComponent.jsp"%>
    </body>
</html>

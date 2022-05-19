<%-- 
Document   : viewCart
Created on : Mar 11, 2022, 12:03:36 AM
Author     : Mr.Thanh
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
            <title>View Cart</title>
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

        <%=error%>

        <c:choose>
            <c:when test="${sessionScope.CARTS.size()==0 || sessionScope.CARTS == NULL}">
                <div class="column text-center">
                    <h2>Your cart is empty</h2>
                    <a class="btn btn-outline-secondary" href="MainController?action=Search&search=">
                        <i class="icon-arrow-left" ></i>&nbsp;By Now</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="container padding-bottom-3x mb-1">
                    <div class="table-responsive shopping-cart">
                        <table class="table">
                            <thead>
                                <tr>    
                                    <th class="text-center">No</th>
                                    <th>image</th>
                                    <th class="text-center"><h3 style="">Product Name<h3</th>
                                                <th class="text-center"><h3>Price<h3</th>
                                                            <th class="text-center"><h3>Quantity<h3</th>
                                                                        <th class="text-center"><h3>Total<h3</th>
                                                                                    <th class="text-center">Action</th>
                                                                                    </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach items="${sessionScope.CARTS}" var="C" varStatus="couter">
                                                                                        <form action="UpdateQuantityController"  >
                                                                                            <tr>
                                                                                            <input type="hidden" name="productID" value="${C.value.product.productID}"/>
                                                                                            <th scope="row">${couter.count}</th>
                                                                                            <td>
                                                                                                <div class="product-item">
                                                                                                    <a class="product-thumb" ><img src="${C.value.product.image}"alt="Product"></a>
                                                                                                </div>
                                                                                            </td>
                                                                                            <th>
                                                                                                <div class="product-item">
                                                                                                    <div class="product-info">
                                                                                                        <h4 class="product-title text-center" style="padding: 40px;">${C.value.product.productName}</h4><span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </th>
                                                                                            <td class="text-center text-xl text-medium" style="padding: 40px;"><h3>$${C.value.product.price}</h3></td>
                                                                                            <c:if test="${C.value.quantity > C.value.product.quantity}">
                                                                                                <td>
                                                                                                    <input onchange="this.form.submit()" required="" min="1" max="${C.value.product.quantity}" name="quantity" type="number" value="${C.value.product.quantity}"/>
                                                                                                </td>
                                                                                                <td>${C.value.product.quantity * C.value.product.price}</td>
                                                                                            </c:if>
                                                                                            <c:if test="${C.value.quantity <= C.value.product.quantity}">
                                                                                                <td class="text-center">
                                                                                                    <input class="count-input" onchange="this.form.submit()" required="" min="1" max="${C.value.product.quantity}" name="quantity" type="number" value="${C.value.quantity}"/>
                                                                                                </td>
                                                                                                <td class="text-center text-xl text-medium"><h3>${C.value.quantity * C.value.product.price}</h3></td>
                                                                                                    </c:if>
                                                                                            <td style="padding: 1px;" class="text-center">
                                                                                                <a  href="MainController?action=Remove&productID=${C.value.product.productID}"/>
                                                                                                <i class="btn btn-sm btn-outline-danger">Remove</i></a>   
                                                                                            </td>
                                                                                        </form>
                                                                                        </tr>
                                                                                        </form>
                                                                                    </c:forEach>
                                                                                    </tbody>
                                                                                    </table>
                                                                                    </div>
                                                                                    <div class="shopping-cart-footer">
                                                                                        <div class="column">
                                                                                            <form class="coupon-form" method="post">
                                                                                                <input class="form-control form-control-sm" type="text" placeholder="Coupon code" required="">
                                                                                                <button class="btn btn-outline-primary btn-sm" type="submit">Apply Coupon</button>
                                                                                            </form>
                                                                                        </div>
                                                                                        <div class="column text-lg"><h3 style="color: #008000;">Subtotal:</h3> <span class="text-medium"><h2>$${requestScope.TOTAL_MONEY}</h2></span></div>
                                                                                    </div>
                                                                                    <div class="shopping-cart-footer">
                                                                                        <div class="column">
                                                                                            <a class="btn btn-primary" href="#" data-toast="" data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Your cart" data-toast-message="is updated successfully!">Update Cart</a>
                                                                                            <a class="btn btn-success" href="checkOut.jsp">Checkout</a></div>
                                                                                    </div>
                                                                                    </div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <%@include file="components/footerComponent.jsp"%>
                                                                            </body>
                                                                            </html>

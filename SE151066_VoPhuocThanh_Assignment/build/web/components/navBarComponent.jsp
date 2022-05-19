<%-- 
    Document   : navBarComponent
    Created on : 28-02-2022, 22:13:00
    Author     : Mr.Thanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->

<c:if test="${sessionScope.LOGIN_USER != NULL && 2 != sessionScope.LOGIN_USER.roleID}">
    <c:redirect url="MainController?action=Logout"></c:redirect>
</c:if>
<nav class="navbar navbar-expand-lg navbar-light "style="background-color: #90EE90">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand text-white" href="MainController?action=Home">
            <i class="bi bi-shop-window " style="margin-right: 8px;color: black"></i>
            VEGETABLE & FRUIT
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" href="MainController?action=Home">Home</a>
                </li>
            </ul>

            <c:if test="${sessionScope.LOGIN_USER == NULL || sessionScope.LOGIN_USER.roleID == 2}">
                <form action="MainController" method="POST" class="d-flex mx-auto">
                    <div class="input-group input-group-sm  " style="width:100%; ">
                        <input  name="search" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                        <div class="input-group-append">
                            <button type="submit" name="action" value="Search" class="btn btn-danger btn-number" style="position: unset;padding: 10px;">
                                <i class="fa fa-search" ></i>
                            </button>
                        </div>
                    </div>
                </form>
            </c:if>

            <div class="d-flex my-1"> 
                <a class="btn btn-outline-dark" href="MainController?action=Cart">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <c:if test="${sessionScope.CARTS == null}">
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </c:if>
                    <c:if test="${sessionScope.CARTS != null}">
                        <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.CARTS.size()}</span>
                    </c:if>

                </a>
            </div>

            <c:choose>
                <c:when test="${sessionScope.LOGIN_USER == Null}">
                    <a href="login.jsp">
                        <button class="btn btn-outline-dark text-white ms-lg-2">Login</button>  
                    </a>
                </c:when>
                <c:when test="${sessionScope.LOGIN_USER != Null || sessionScope.LOGIN_USER.roleID == 2}">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle ms-2" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            Welcome: ${sessionScope.LOGIN_USER.fullName}
                        </button>
                        <ul class="dropdown-menu " style="text-align: center; width: 100%" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li><a class="dropdown-item" href="MainController?action=Logout">Logout</a></li>
                        </ul>
                    </div>  
                </c:when>
            </c:choose>
        </div>
    </div>
</nav>

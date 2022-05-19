<%-- 
    Document   : footerComponent
    Created on : 28-02-2022, 22:16:28
    Author     : Mr.Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        background-color:#90EE90;
        margin: 0 auto;
        padding: 20px 0px 20px 0px;

    }
    .list-unstyled  a{text-decoration:none;color: white  }
    .text-center a{text-decoration:none;color: white }

</style>
<!-- Footer-->
<footer class="footer">
    <div class="container" >
        <div class="row">
            <div class="col-4 offset-1 col-sm-2">
                <ul class="list-unstyled " >
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Menu</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>   
            </div>
            <div class="col-7 col-sm-5">
                <p id="txt2">Shop system</p>
                <p class="text">
                <li style="color: wheat">Opening hours: 7am - 8pm</li>
                <li style="color: wheat">Consulting hours: 7am - 8pm</li>
                </p>
                <p class="text">Fruits And Vegetables </p>
                <p class="text">Ho Chi Minh City </p>
                <p class="text">Phone: (+84) 0000-1111 </p>
                <p class="text">Fax: (+84) 1111-0068 </p>
            </div>
            <div class="col-12 col-sm-4 align-self-center">
                <div class="text-center ">
                    <a href="http://google.com/+">Google+</a>
                    <a href="http://www.facebook.com/profile.php?id=">Facebook</a>
                    <a href="http://www.linkedin.com/in/">LinkedIn</a>
                    <a href="http://twitter.com/">Twitter</a>
                    <a href="http://youtube.com/">YouTube</a>
                    <a href="mailto:">Mail</a>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-auto">
                <p>© Copyright 2022 PT</p>
            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
</script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
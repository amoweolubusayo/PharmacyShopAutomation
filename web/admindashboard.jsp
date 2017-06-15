<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
 <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />
    <link href="css/design.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">

<style>



</style>
    <script>
        function load_adduser() {
            document.getElementById("content").innerHTML = '<object type="text/html" data="staffpages/addstaff.jsp" ></object>';
        }
    </script>
</head>
<body>

<%--<nav class="navbar navbar-default navbar-fixed-top">--%>

    <%--<div class="navbar-header">--%>
        <%--<h3>Admin Dashboard</h3>--%>
    <%--</div>--%>
<%--</nav>--%>
<div class="col-lg-12" style="background-color: black">

</div>
<div class="wrapper">

    <div class="sidebar" data-color="purple" data-image="../assets/img/sidebar-1.jpg">
        <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

            Tip 2: you can also add an image using data-image tag
        -->

        <div class="logo">
            <a class="simple-text">
               ADMIN
            </a>

        </div>

        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="active">

                    <a data-toggle="collapse" data-target="#staff"> Staff <i class="fa fa-caret-down"></i></a>
                    <ul id="staff" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="" onclick="load_adduser()">Add </a>
                        </li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i><a href="#">Edit</a></li>

                    </ul>
                </li>
                <hr>
                <li class="active">

                    <a data-toggle="collapse" data-target="#drug"> Drug <i class="fa fa-caret-down"></i></a>
                    <ul id="drug" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i><a href="#">Add Category</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i><a href="#">Add</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i><a href="#">Edit</a></li>
                    </ul>
                </li>
                <hr>
                <li class="active">
                    <a data-toggle="collapse" data-target="#stock"> Stock <i class="fa fa-caret-down"></i></a>
                    <ul id="stock" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-eye" style="color: white"></i><a href="#">View</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-book" style="color: white"></i><a href="#">Report</a></li>
                  </ul>
                </li>
                <hr>
                <li class="active">

                    <a> Logout</a>
                </li>
                <hr>
            </ul>
        </div>
    </div>

    <div class="main-panel" id="content">

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-6">

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">

                    </div>

                    <div class="col-md-4">

                    </div>

                    <div class="col-md-4">

                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-12">

                    </div>

                    <div class="col-lg-6 col-md-12">

                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/material.min.js"></script>
<script src="js/material-dashboard.js"></script>
<script src="js/demo.js"></script>

</body>

</html>


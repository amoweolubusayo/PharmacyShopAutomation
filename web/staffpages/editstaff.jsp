<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <link href="../css/design.css" rel="stylesheet">
    <link href="../css/material-dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="../css/demo.css" rel="stylesheet" />
    <link href="../css/font-awesome.css" rel="stylesheet">

    <style>



    </style>
    <script>


    </script>
</head>
<body>


<div class="col-lg-12" style="background-color: black">

</div>
<div class="wrapper">

    <div class="sidebar" data-color="purple">
        <div class="logo">

        </div>


        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="active">

                    <a data-toggle="collapse" data-target="#staff"> Staff <i class="fa fa-caret-down"></i></a>
                    <ul id="staff" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="/staffpages/addstaff.jsp" class="tilliknwwhyunderlinedecorationstillshows">Add </a>
                        </li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i>
                            <a href="/staffpages/editstaff.jsp" class="tilliknwwhyunderlinedecorationstillshows">Edit</a></li>

                    </ul>
                </li>
                <hr>
                <li class="active">

                    <a data-toggle="collapse" data-target="#drug"> Drug <i class="fa fa-caret-down"></i></a>
                    <ul id="drug" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#" class="tilliknwwhyunderlinedecorationstillshows">Add Category</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#" class="tilliknwwhyunderlinedecorationstillshows">Add</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i>
                            <a href="#" class="tilliknwwhyunderlinedecorationstillshows">Edit</a></li>
                    </ul>
                </li>
                <hr>
                <li class="active">
                    <a data-toggle="collapse" data-target="#stock"> Stock <i class="fa fa-caret-down"></i></a>
                    <ul id="stock" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-eye" style="color: white"></i>
                            <a href="#" class="tilliknwwhyunderlinedecorationstillshows">View</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-book" style="color: white"></i>
                            <a href="#" class="tilliknwwhyunderlinedecorationstillshows">Report</a></li>
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


    <div class="main-panel">
        <div class="col-sm-10 col-sm-offset-0" id="editinfo">
            <h2>EDIT STAFF</h2>
            <form id="second">
                <div class="col-lg-6">
                    <input type="text" class="form-control" placeholder="Enter name" name="staffname"/>
                    <select class="form-control">
                        <option value="">Select Gender</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                    </select>
                    <input type="text" class="form-control" placeholder="Enter address" name="address"/>
                    <input type="date" class="form-control" placeholder="Date employed" name="dateemployed"/>
                    <input type="text" class="form-control" placeholder="Enter phonenumber" name="phonenumber"/>
                </div>
                <div class="col-lg-6">
                    <input type="email" class="form-control" placeholder="Enter email" name="email"/>
                    <select class="form-control">
                        <option value="">Select Marital Status</option>
                        <option value="SINGLE">SINGLE</option>
                        <option value="MARRIED">MARRIED</option>
                    </select>
                    <input type="text" class="form-control" placeholder="Assign username" name="username"/>
                    <input type="text" class="form-control" placeholder="Assign password" name="password"/>
                    <select class="form-control">
                        <option value="">Select Position</option>
                        <option value="SUPERVISOR">SUPERVISOR</option>
                        <option value="ATTENDANT">ATTENDANT</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <input type="submit" value="submit" class="btn btn-info"/>
                </div>
            </form>

        </div>
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

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/material.min.js"></script>
<script src="../js/material-dashboard.js"></script>
<script src="../js/demo.js"></script>

</body>

</html>


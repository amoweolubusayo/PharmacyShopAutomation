<%@ page import="java.util.List" %>
<%@ page import="main.java.com.pharmacyshopautomation.utils.GeneralUtil" %>
<%@ page import="main.java.com.pharmacyshopautomation.models.Staff" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <link href="css/design.css" rel="stylesheet">
    <link href="css/material-dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/demo.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet">

<style>



</style>

</head>
<body>
<%
    try
    {
        List result = GeneralUtil.getAllStaffbyId();

%>
<div id="myModalDialog" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="glyphicon glyphicon-remove"></i></button>
                <h4 class="modal-title">SYSTEM RESPONSE</h4>
            </div>
            <div class="modal-body">
                <p id="info">${requestScope["issues"]}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal" style="border-radius: 0px">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="col-lg-12" style="background-color: black">
</div>
<div class="wrapper">

    <div class="sidebar" data-color="purple">
        <div class="logo">
            <span style="margin-left: 40px; font-size: 25px; color: white">DASHBOARD</span>
        </div>



        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="active">

                    <a data-toggle="collapse" data-target="#staff"> Staff <i class="fa fa-caret-down"></i></a>
                    <ul id="staff" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#addinfo" style="text-decoration: none" id="add">Add </a>
                        </li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i>
                            <a href="#editinfo" style="text-decoration: none" id="edit">Edit</a></li>

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

    <div class="main-panel" id="addinfo">
        <div class="col-sm-10 col-sm-offset-0">

            <h2 style="color: #1ab7ea">ADD STAFF</h2>

            <form method="post" action="/AddStaffController">
                <div class="col-lg-4">

                    <input type="text" class="form-control" placeholder="Enter name" name="staffname" required autocomplete="off"/>
                <select class="form-control" name="gender" required autocomplete="off">
                    <option value="">Select Gender</option>
                <option value="MALE">MALE</option>
                <option value="FEMALE">FEMALE</option>
               </select>
                    <input type="text" class="form-control" placeholder="Enter address" name="address" required autocomplete="off"/>
                    <input type="date" class="form-control" placeholder="Date employed" name="dateemployed" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Enter phonenumber" name="phonenumber" required autocomplete="off"/>
                </div>
                <div class="col-lg-4">
                    <input type="email" class="form-control" placeholder="Enter email" name="email" required autocomplete="off"/>
                <select class="form-control" name="maritalstatus" required autocomplete="off">
                    <option value="">Select Marital Status</option>
                    <option value="SINGLE">SINGLE</option>
                    <option value="MARRIED">MARRIED</option>
                </select>

                    <input type="text" class="form-control" placeholder="Assign username" name="username" required autocomplete="off"/>
                    <input type="password" class="form-control" placeholder="Assign password" name="password" required autocomplete="off"/>
                    <%--<input type="password" class="form-control" placeholder="Confirm password" name="confirmpassword"/>--%>
                    <select class="form-control" name="roletype" required autocomplete="off">
                        <option value="">Select Position</option>
                        <option value="SUPERVISOR">SUPERVISOR</option>
                        <option value="ATTENDANT">ATTENDANT</option>
                    </select>
                </div>
                <div class="col-lg-4" style="margin-top: 170px">
                    <span style="font-size: 12px; color: red">username is the staff-id and can be changed</span>
                </div>
                <div class="col-sm-5">
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
    <div class="main-panel" style="display: none" id="editinfo">
        <div class="col-sm-10 col-sm-offset-0">
            <h2 style="color: #1ab7ea">EDIT STAFF</h2>
            <form>
                <div class="col-lg-5">
                    <select class="form-control" name="staffid" id="staffid">
                        <option value="">STAFF ID</option>
                        <%
                            for(int i = 0; i<result.size(); i++){
                        %>
                        <option value="<%=((Staff) result.get(i)).getStaffid()%>"><%=((Staff) result.get(i)).getStaffid()%></option>
                       <%
                        }
                        %>
                    </select>
                    <input type="text" class="form-control" placeholder="Enter name" name="staffname" id="staffname" onblur="toUpperCase(this)"/>
                    <select class="form-control" name="maritalstatus" id="maritalstatus">
                        <option value="">Select Marital Status</option>
                        <option value="SINGLE">SINGLE</option>
                        <option value="MARRIED">MARRIED</option>
                    </select>
                    <input type="text" class="form-control" placeholder="Assign username" id="username" name="username" onblur="toUpperCase(this)" />
                    <input type="text" class="form-control" placeholder="Assign password" id="password" name="password" onblur="toUpperCase(this)"/>
                    <select class="form-control" name="position" id="position">
                        <option value="">Select Position</option>
                        <option value="SUPERVISOR">SUPERVISOR</option>
                        <option value="ATTENDANT">ATTENDANT</option>
                    </select>

                        <input type="submit" value="edit" class="btn btn-info"/>

                </div>

                <div class="col-lg-5">
                    <input type="button" class="btn-block btn btn-lg btn-info" style="border-radius: 0px;" value="Check Details" onclick="searchStaff();"/>
                    <input type="email" class="form-control" placeholder="Enter email" name="email" onblur="toUpperCase(this)" id="email"/>

                    <select class="form-control" name="gender" id="gender">
                        <option value="">Select Gender</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                    </select>
                    <input type="text" class="form-control" placeholder="Enter address" name="address" id="address"  onblur="toUpperCase(this)"/>
                    <input type="date" class="form-control" placeholder="Date employed" name="dateemployed" id="dateemployed"/>
                    <input type="text" class="form-control" placeholder="Enter phonenumber" name="phonenumber" id="phonenumber"/>
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

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/material.min.js"></script>
<script src="js/material-dashboard.js"></script>
<script src="js/demo.js"></script>
<script>
    $(document).ready(function(){
        var issuesPresent = document.getElementById("info").innerHTML;
        if(issuesPresent !="")
            $ ("#myModalDialog").modal('show');

        function toUpperCase(fill) {
            fill.value = fill.value.toUpperCase();
        }

        $("#add").click(function(){
            $("#addinfo").show();
            $("#editinfo").hide();
        });
        $("#edit").click(function(){
            $("#editinfo").show();
            $("#addinfo").hide();
        });
    });
    function searchStaff(){

        var staffid = document.getElementById("staffid").value;
        alert(staffid);
        if(staffid!=""){
            $.getJSON('/ServiceUtilController',{"operation":"2","staffid":staffid}, function (jd) {
                var Name = jd.Name;
                alert(Name);
                var Email = jd.Email;
                alert(Email);
                var MaritalStatus = jd.MaritalStatus;
                var Gender = jd.Gender;
                var Username = jd.Username;
                var Address = jd.Address;
                var Password = jd.Password;
                var Position = jd.Position;
                alert(Position);
                var Date = jd.Date;
                alert(Date);
                 var D = Date.split(' ');
                 alert(D);
                var Phonenumber = jd.Phonenumber;
                document.getElementById("staffname").value =Name;
                document.getElementById("maritalstatus").value =MaritalStatus;
                document.getElementById("username").value =Username;
                document.getElementById("password").value =Password;
                document.getElementById("position").value =Position;
                document.getElementById("email").value =Email;
                document.getElementById("gender").value =Gender;
                document.getElementById("address").value =Address;
                document.getElementById("dateemployed").value =Date;
                document.getElementById("phonenumber").value =Phonenumber;
            });
        }
    }
</script>
<%
    }
catch(Exception ex){
        ex.printStackTrace();
    }
%>
</body>

</html>


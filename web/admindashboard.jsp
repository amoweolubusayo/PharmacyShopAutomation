<%@ page import="java.util.List" %>
<%@ page import="main.java.com.pharmacyshopautomation.utils.GeneralUtil" %>
<%@ page import="main.java.com.pharmacyshopautomation.models.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/design.css" rel="stylesheet">
    <link href="css/material-dashboard.css" rel="stylesheet"/>

    <link href="css/demo.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet">


<style>



</style>

</head>
<body>

<%
    String user_id = "";
    String roleType = "";

    if(session.getAttribute("current_user") !=null)
    {
        User current_user = (User)session.getAttribute("current_user");
        try{
            user_id = current_user.getUsername();
            roleType = current_user.getRoletype();
            System.out.println(roleType);
            if (!roleType.equalsIgnoreCase("SUPERVISOR")){
                response.sendRedirect("/attendantdashboard.jsp");
            }
        }
        catch (Exception e){

        }

    }
    else {
        response.sendRedirect("/index.jsp");
    }
    try
    {
        List result = GeneralUtil.getAllStaffbyId();
        List stock = GeneralUtil.getAllSales();
        List categoryresult = GeneralUtil.getAllDrugCategories();
        List shelflabel = GeneralUtil.getAllShelfLabels();
        List sales = GeneralUtil.getDailySales();
        Integer lastDrugId = GeneralUtil.getLastDrugId().intValue();
        List drugres = GeneralUtil.getAllDrugbyId();

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
            <span style="margin-left: 70px; font-size: 25px; color: white">ALOHA</span>
        </div>
        <hr style="border:0;margin-top: 5px; margin-bottom: 0px">



        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="active">
                    <a href="#" style="text-decoration: none;" id=""><b>HI <%=user_id%></b></a></li>
                </li>
                <hr>
                <li class="active">

                    <a data-toggle="collapse" data-target="#staff"> Staff <i class="fa fa-caret-down"></i></a>
                    <ul id="staff" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#addinfo" style="text-decoration: none" id="add">Add </a>
                        </li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i>
                            <a href="#editinfo" style="text-decoration: none" id="edit">Edit</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-eye" style="color: white"></i>
                            <a href="#viewinfo" style="text-decoration: none" id="view">View All Staff</a></li>

                    </ul>
                </li>
                <hr>
                <li class="active">

                    <a data-toggle="collapse" data-target="#drug"> Drug <i class="fa fa-caret-down"></i></a>
                    <ul id="drug" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#addcategory" style="text-decoration: none" id="addcat">Add Category</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#adddrug" style="text-decoration: none" id="adddrg">Add</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i>
                            <a href="#editdrug" style="text-decoration: none" id="editdrg">Edit</a></li>
                    </ul>
                </li>
                <hr>
                <li class="active">
                    <a data-toggle="collapse" data-target="#shelf"> Shelf <i class="fa fa-caret-down"></i></a>
                    <ul id="shelf" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#addshelf" style="text-decoration: none" id="addshlf">Add</a></li>
                    </ul>
                </li>
                <hr>
                <li class="active">
                    <a data-toggle="collapse" data-target="#stock"> Stock <i class="fa fa-caret-down"></i></a>
                    <ul id="stock" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-eye" style="color: white"></i>
                            <a href="#viewstock" class="tilliknwwhyunderlinedecorationstillshows" id="viewstck">View</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-book" style="color: white"></i>
                            <a href="#viewreport" style="text-decoration: none" id="viewrpt">Report</a></li>
                  </ul>
                </li>
                <hr>
                <li class="active">

                    <a href="/LogoutController"> Logout</a>
                </li>
                <hr>
            </ul>
        </div>
    </div>



    <div class="main-panel" id="dashboard">
        <div class="col-sm-12">

        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="col-lg-3">
                    <img src="img/drugs.jpg" class="image" style="width: 500px; height: 350px">
                    <div class="middle">
                        <div class="text"></div>
                    </div>

                </div>
                <div class="col-lg-3">
                    <div class="middle">
                        <div class="text"></div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <img src="img/shelf2.jpg" class="" style="width: 500px; height: 350px">
                </div>

        </div>

            <h1 style="text-align: center" class="animate">Handle Your Pharmacy with ease</h1>

    </div>
    </div>
    <div class="main-panel" style="display: none" id="addinfo">
        <div class="col-sm-10 col-sm-offset-2">

            <h2 style="color: #1ab7ea;margin-left:10px">ADD STAFF</h2>

            <form method="post" action="/AddStaffController">
                <div class="col-lg-4
">

                    <input type="text" class="form-control" placeholder="Enter name" name="staffname" required autocomplete="off"/>
                <select class="form-control" name="gender" required autocomplete="off">
                    <option value="">Select Gender</option>
                <option value="MALE">MALE</option>
                <option value="FEMALE">FEMALE</option>
               </select>
                    <input type="text" class="form-control" placeholder="Enter address" name="address" required autocomplete="off"/>
                    <input placeholder="Date employed" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="dateemployed" name="dateemployed">
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
                <div class="col-sm-8">
                <input type="submit" value="submit" class="btn btn-info btn-lg btn-block"/>
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
        <div class="col-sm-10 col-sm-offset-1">
            <h2 style="color: #1ab7ea;margin-left: 10px">EDIT STAFF</h2>
            <form action="/EditStaffController" method="post">
                <div class="col-lg-6">
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
                    <select class="form-control" name="roletype" id="position">
                        <option value="">Select Position</option>
                        <option value="SUPERVISOR">SUPERVISOR</option>
                        <option value="ATTENDANT">ATTENDANT</option>
                    </select>



                </div>

                <div class="col-lg-6">
                    <input type="button" class="btn-block btn btn-lg btn-info" style="border-radius: 0px;" value="Check Details" onclick="searchStaff();"/>
                    <input type="email" class="form-control" placeholder="Enter email" name="email" onblur="toUpperCase(this)" id="email"/>

                    <select class="form-control" name="gender" id="gender">
                        <option value="">Select Gender</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                    </select>
                    <input type="text" class="form-control" placeholder="Enter address" name="address" id="address"  onblur="toUpperCase(this)"/>
                    <input type="text" class="form-control" placeholder="Date employed" name="dateemployed" id="dateemploy" readonly/>
                    <input type="text" class="form-control" placeholder="Enter phonenumber" name="phonenumber" id="phonenumber"/>
                </div>
                <div class="col-sm-12">
                    <input type="submit" value="edit" class="btn btn-info btn-lg btn-block"/>
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
    <div class="main-panel" style="display: none" id="viewinfo">
        <div class="col-sm-12">
            <h2 style="color: #1ab7ea;margin-left: 10px">VIEW ALL STAFF</h2>
            <form method="post">
                <div class="col-lg-12">
                    <table class="table table-striped table-hover table-condensed" cellpadding="2" cellspacing="2">
                        <thead class="thead-default">
                    <tr>
                    <th>S/N</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Marital Status</th>
                    <th>Address</th>
                    <th>Phonenumber</th>
                    <th>Position</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(int i = 0; i<result.size(); i++){
                    %>
                    <tr class="bg-info">
                        <td><%=i+1%></td>
                        <td><%=((Staff) result.get(i)).getStaffname()%></td>
                        <td><%=((Staff) result.get(i)).getStaffemail()%></td>
                        <td><%=((Staff) result.get(i)).getGender()%></td>
                        <td><%=((Staff) result.get(i)).getMaritalstatus()%></td>
                        <td><%=((Staff) result.get(i)).getAddress()%></td>
                        <td><%=((Staff) result.get(i)).getPhonenumber()%></td>
                        <td><%=((Staff) result.get(i)).getRole()%></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
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
    <div class="main-panel" style="display: none" id="addcategory">
        <div class="col-sm-10 col-sm-offset-2">
            <h2 style="color: #1ab7ea;margin-left: 10px">ADD DRUG CATEGORY</h2>
            <form action="/AddDrugCategoryController" method="post">
                <div class="col-lg-5">

                    <input type="text" class="form-control" placeholder="Enter Drug Category" name="category" id="category" onblur="toUpperCase(this)"/>
                    <input type="submit" value="ADD CATEGORY" class="btn btn-info btn-lg btn-block"/>
                </div>

                <div class="col-lg-5">
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
    <div class="main-panel" style="display: none" id="adddrug">
        <div class="col-sm-10 col-sm-offset-2">

            <h2 style="color: #1ab7ea;margin-left: 10px">ADD DRUG</h2>

            <form method="post" action="/AddDrugController">
                <div class="col-lg-4">

                    <input type="text" class="form-control" name="drug" required autocomplete="off" id="iddrug" readonly/>
                    <input type="text" class="form-control" placeholder="Drug Name" name="drugname" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Manufacturer" name="manufacturer" required autocomplete="off"/>
                    <select class="form-control" name="drugcategory" required autocomplete="off">
                        <option value="">Select Drug Category</option>
                        <%
                            for(int i = 0; i<categoryresult.size(); i++){
                        %>
                        <option value="<%=((DrugCategory) categoryresult.get(i)).getCategory()%>"><%=((DrugCategory) categoryresult.get(i)).getCategory()%></option>
                        <%
                            }
                        %>

                    </select>
                    <input type="number" class="form-control" placeholder="Drug Price" name="drugprice" required autocomplete="off"/>
                    <select class="form-control" name="druglocation" required autocomplete="off">
                        <option value="">Select Location</option>
                        <%
                            for(int i = 0; i<shelflabel.size(); i++){
                        %>
                        <option value="<%=((Shelf) shelflabel.get(i)).getShelflabel()%>"><%=((Shelf) shelflabel.get(i)).getShelflabel()%></option>
                        <%
                            }
                        %>

                    </select>
                </div>
                <div class="col-lg-4">
                    <input type="number" class="form-control" placeholder="Drug Quantity" name="drugquantity" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Batch Number" name="batchnumber" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Function" name="function" required autocomplete="off"/>
                    <input placeholder="Production date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="productiondate" name="productiondate">
                    <input placeholder="Expiry date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text');checkExpiryDateVsProductionDate()" id="expirydate" name="expirydate">
                    <input placeholder="Registration date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="registrationdate" name="registrationdate">
                </div>

                <div class="col-sm-8">
                    <input type="submit" value="submit" class="btn btn-info btn-lg btn-block"/>
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
    <div class="main-panel" style="display: none" id="editdrug">
        <div class="col-sm-10 col-sm-offset-1">

            <h2 style="color: #1ab7ea;margin-left: 10px">EDIT DRUG</h2>

            <form method="post" action="">
                <div class="col-lg-6">

                    <select class="form-control" name="drugid" id="drugid">
                        <option value="">DRUG ID</option>
                        <%
                            for(int i = 0; i<drugres.size(); i++){
                        %>
                        <option value="<%=((Drug) drugres.get(i)).getDrugid()%>"><%=((Drug) drugres.get(i)).getDrugid()%></option>
                        <%
                            }
                        %>
                    </select>
                    <input type="text" class="form-control" placeholder="Drug Name" name="drugname" id="drugname" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Manufacturer" name="manufacturer" id="manufacturer" required autocomplete="off"/>
                    <select class="form-control" name="drugcategory" id="drugcategory" required autocomplete="off">
                        <option value="">Select Drug Category</option>
                        <%
                            for(int i = 0; i<categoryresult.size(); i++){
                        %>
                        <option value="<%=((DrugCategory) categoryresult.get(i)).getCategory()%>"><%=((DrugCategory) categoryresult.get(i)).getCategory()%></option>
                        <%
                            }
                        %>
                    </select>
                    <input type="text" class="form-control" placeholder="Drug Price" name="drugprice" id="drugprice" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Drug Location" name="druglocation" id="druglocation" required autocomplete="off"/>

                </div>
                <div class="col-lg-6">
                    <input type="button" class="btn-block btn btn-lg btn-info" style="border-radius: 0px;" value="Check Details" onclick="searchDrugs();"/>

                    <input type="text" class="form-control" placeholder="Drug Quantity" name="drugquantity" id="drugquantity" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Batch Number" name="batchnumber" id="batchnumber" required autocomplete="off"/>
                    <input type="text" class="form-control" placeholder="Function" name="function" id="drugfunction"  required autocomplete="off"/>
                    <input placeholder="Production date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="proddate" name="productiondate">
                    <input placeholder="Expiry date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="expdate" name="expirydate">
                </div>
                    <div class="col-sm-12">
                        <input type="submit" value="edit" class="btn btn-info btn-lg btn-block"/>

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
    <div class="main-panel" style="display: none" id="addcategory">
        <div class="col-sm-10 col-sm-offset-2">
            <h2 style="color: #1ab7ea;margin-left: 10px">ADD DRUG CATEGORY</h2>
            <form action="/AddDrugCategoryController" method="post">
                <div class="col-lg-5">

                    <input type="text" class="form-control" placeholder="Enter Drug Category" name="category" id="category" onblur="toUpperCase(this)"/>
                    <input type="submit" value="ADD CATEGORY" class="btn btn-info btn-lg btn-block"/>
                </div>

                <div class="col-lg-5">
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
    <div class="main-panel" style="display: none" id="addshelf">
        <div class="col-sm-10 col-sm-offset-2">
            <h2 style="color: #1ab7ea;margin-left: 10px">ADD SHELF</h2>
            <form action="/AddShelfController" method="post">
                <div class="col-lg-5">

                    <input type="text" class="form-control" placeholder="Enter Shelf Label" name="shelflabel" id="shelflabel" onblur="toUpperCase(this)"/>
                    <input type="submit" value="ADD SHELF" class="btn btn-info btn-lg btn-block"/>
                </div>

                <div class="col-lg-5">
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
    <div class="main-panel" style="display: none" id="viewstock">
        <div class="col-sm-12">
            <h2 style="color: #1ab7ea;margin-left: 10px">VIEW ALL STOCK</h2>
            <form method="post">
                <div class="col-lg-12">
                    <table class="table table-striped table-hover table-condensed" cellpadding="2" cellspacing="2">
                        <thead class="thead-default">
                        <tr>
                            <th>S/N</th>
                            <th>Name</th>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity Available</th>
                            <th>Location</th>
                            <th>Expiry Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(int i = 0; i<stock.size(); i++){
                        %>
                        <tr class="bg-info">
                            <td><%=i+1%></td>
                            <td><%=((Drug) stock.get(i)).getDrugname()%></td>
                            <td><%=((Drug) stock.get(i)).getDrugid()%></td>
                            <td><%=((Drug) stock.get(i)).getCategory()%></td>
                            <td><%=((Drug) stock.get(i)).getPrice()%></td>
                            <td><%=((Drug) stock.get(i)).getQuantity()%></td>
                            <td><%=((Drug) stock.get(i)).getLocation()%></td>
                            <td><%=((Drug) stock.get(i)).getExpdate()%></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
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
    <div class="main-panel" style="display: none" id="viewreport">
        <div class="col-sm-12">
            <h2 style="color: #1ab7ea;margin-left: 10px">GENERATE REPORT</h2>
            <form method="post">
                <div class="col-lg-12">
                    <form>
                        <div class="col-lg-5">

                            <select class="form-control" name="saledate" id="saledate" onchange="searchSale();clearTable();">
                                <option value="">Select Date</option>
                                <%
                                    for(int i = 0; i< sales.size(); i++){
                                %>
                                <option value="<%=((SalesDate) sales.get(i)).getSalesdate()%>"><%=((SalesDate) sales.get(i)).getSalesdate()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <%--<input type="submit" value="ADD CATEGORY" class="btn btn-info btn-lg btn-block"/>--%>
                        </div>
                        <div class="col-lg-5">
                        </div>
                    </form>
                    <table class="table table-striped table-hover table-condensed" cellpadding="2" cellspacing="2">
                        <thead class="thead-default">
                        <tr>
                            <th>Drugname</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>TotalBill</th>
                            <th>Time Of Sale</th>
                            <th>Sold by</th>
                        </tr>
                        </thead>
                        <tbody id="reportTable">



                        </tbody>
                    </table>
                    <p style="color:#1ab7ea" id="totalamt">AMOUNT MADE: =N=<input type="text" style="border:none" id="moneymade"/></p>
                    <button type="button" class="btn btn-lg btn-danger" onclick="window.print();">PRINT REPORT</button>
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
        <%
                        for(int i = 0; i<stock.size(); i++){
          %>
        var drugquantityleft = <%=((Drug) stock.get(i)).getQuantity()%>;

        if(drugquantityleft < 25){
            alert("You need to restock" + <%=((Drug) stock.get(i)).getDrugname()%>);
        }
        else
            alert(" ");
        <%
                            }
                        %>
        var issuesPresent = document.getElementById("info").innerHTML;
        if(issuesPresent !="")
            $ ("#myModalDialog").modal('show');

        function toUpperCase(fill) {
            fill.value = fill.value.toUpperCase();
        }

        $.get('lastDrugId');
       var DrugId = <%=lastDrugId + 1%>;
        if(DrugId >=1 && DrugId <= 9){
            $("#iddrug")[0].value = 'DRUG00'+ DrugId;
        }
        else if(DrugId >=10 && DrugId <= 99){
            $("#iddrug")[0].value = 'DRUG0'+ DrugId;
        }
        else{
            $("#iddrug")[0].value = 'DRUG'+ DrugId;
        }
        $("#add").click(function(){
            $("#addinfo").show();
            $("#editinfo").hide();
            $("#viewinfo").hide();
            $("#addcategory").hide();
            $("#adddrug").hide();
            $("#editdrug").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();
        });
        $("#edit").click(function(){
            $("#editinfo").show();
            $("#addinfo").hide();
            $("#viewinfo").hide();
            $("#addcategory").hide();
            $("#adddrug").hide();
            $("#editdrug").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#dashboard").hide();
        });
        $("#view").click(function(){
            $("#viewinfo").show();
            $("#adddrug").hide();
            $("#addcategory").hide();
            $("#editinfo").hide();
            $("#editdrug").hide();
            $("#addinfo").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();

        });
        $("#addcat").click(function(){
            $("#addcategory").show();
            $("#editinfo").hide();
            $("#addinfo").hide();
            $("#viewinfo").hide();
            $("#adddrug").hide();
            $("#editdrug").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();
        });
        $("#adddrg").click(function(){
            $("#adddrug").show();
            $("#addcategory").hide();
            $("#editinfo").hide();
            $("#addinfo").hide();
            $("#viewinfo").hide();
            $("#editdrug").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();

        });
        $("#editdrg").click(function(){
            $("#editdrug").show();
            $("#adddrug").hide();
            $("#addcategory").hide();
            $("#editinfo").hide();
            $("#viewinfo").hide();
            $("#addinfo").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();

        });
        $("#viewstck").click(function(){
            $("#viewstock").show();
            $("#editdrug").hide();
            $("#adddrug").hide();
            $("#addcategory").hide();
            $("#editinfo").hide();
            $("#viewinfo").hide();
            $("#addinfo").hide();
            $("#viewreport").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();

        });
        $("#viewrpt").click(function(){
            $("#viewreport").show();
            $("#editdrug").hide();
            $("#adddrug").hide();
            $("#addcategory").hide();
            $("#editinfo").hide();
            $("#viewinfo").hide();
            $("#addinfo").hide();
            $("#viewstock").hide();
            $("#addshelf").hide();
            $("#dashboard").hide();
        });
        $("#addshlf").click(function(){
            $("#addshelf").show();
            $("#editdrug").hide();
            $("#adddrug").hide();
            $("#addcategory").hide();
            $("#editinfo").hide();
            $("#viewinfo").hide();
            $("#addinfo").hide();
            $("#viewstock").hide();
            $("#viewreport").hide();
            $("#dashboard").hide();
        });
    });
    function searchStaff(){
        var staffid = document.getElementById("staffid").value;
        if(staffid!=""){
            $.getJSON('/ServiceUtilController',{"operation":"2","staffid":staffid}, function (jd) {
                var Name = jd.Name;
                var Email = jd.Email;
                var MaritalStatus = jd.MaritalStatus;
                var Gender = jd.Gender;
                var Username = jd.Username;
                var Address = jd.Address;
                var Password = jd.Password;
                var Position = jd.Position;
                var Date = jd.DateEmployed;
                var D = Date.split(' ')[0];
                var Phonenumber = jd.Phonenumber;
                document.getElementById("staffname").value =Name;
                document.getElementById("maritalstatus").value =MaritalStatus;
                document.getElementById("username").value =Username;
                document.getElementById("password").value =Password;
                document.getElementById("position").value =Position;
                document.getElementById("email").value =Email;
                document.getElementById("gender").value =Gender;
                document.getElementById("address").value =Address;
                document.getElementById("dateemploy").value =D;
                document.getElementById("phonenumber").value =Phonenumber;
            });
        }
    }
    function checkExpiryDateVsProductionDate(){
        alert('got here');
        var exp = document.getElementById('expirydate');
        var prod = document.getElementById('productiondate');
        alert(Date.parse(exp));
        alert(Date.parse(prod));
        if(exp < prod){
            alert('check the expiry date you are picking, there seems to be a mistake' +
                'production date shouldnt be more than the expiry date');
            document.getElementById('expirydate').value = '';
        }

    }
    function searchSale(){

        var saledate = document.getElementById("saledate").value;
        if(saledate!=""){
            $.getJSON('/ServiceUtilController',{"operation":"7","saledate":saledate}, function (jd) {
                var drugname = jd.Drugname;
                var price = jd.Price;
                var quantity = jd.Quantity;
                var totalBill = jd.TotalBill;
                var time = jd.Time;
                var soldby = jd.Soldby;
                var getTable = $('#reportTable');
                var sum = 0;
                for (i = 0; i < drugname.length; i++) {
                    var drug = drugname[i];
                    var p = price[i];
                    var q = quantity[i];
                    var t = totalBill[i];
                    var tm = time[i];
                    var s = soldby[i];

                    sum+=parseInt(t);

                    getTable.append("<tr class='info'><td>" + drug + "</td>" + "<td>" + p + "</td>" + "<td>" + q + "</td>" + "<td>" + t + "</td>" + "<td>" + tm + "</td> " +  "<td>" + s + "</td> "+" </tr>");
                }

                document.getElementById("moneymade").value = sum;

            });
        }
    }
    function clearTable(){
        $('#reportTable').empty();
    }
    function searchDrugs(){
        var drugid = document.getElementById("drugid").value;
        if(drugid!=""){
            $.getJSON('/ServiceUtilController',{"operation":"3","drugid":drugid}, function (jd) {
                var Name = jd.Name;
                var Quantity = jd.Quantity;
                var Manufacturer = jd.Manufacturer;
                var Batchno = jd.Batchno;
                var Category = jd.Category;
                var DrugFunction = jd.DrugFunction;
                var Price = jd.Price;
                var ProdDate = jd.ProdDate;
                var pd = ProdDate.split(' ')[0]
                var DrugLocation = jd.DrugLocation;
                var ExpDate = jd.ExpDate;
                var ep = ExpDate.split(' ')[0];
                document.getElementById("drugname").value =Name;
                document.getElementById("drugquantity").value =Quantity;
                document.getElementById("manufacturer").value =Manufacturer;
                document.getElementById("batchnumber").value =Batchno;
                document.getElementById("category").value =Category;
                document.getElementById("drugfunction").value =DrugFunction;
                document.getElementById("drugprice").value =Price;
                document.getElementById("proddate").value = pd;
                document.getElementById("druglocation").value =DrugLocation;
                document.getElementById("expdate").value =ep;
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


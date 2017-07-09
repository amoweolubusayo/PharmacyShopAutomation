<%@ page import="java.util.List" %>
<%@ page import="main.java.com.pharmacyshopautomation.utils.GeneralUtil" %>
<%@ page import="main.java.com.pharmacyshopautomation.models.Staff" %>
<%@ page import="main.java.com.pharmacyshopautomation.models.DrugCategory" %>
<%@ page import="main.java.com.pharmacyshopautomation.models.Drug" %>
<%@ page import="main.java.com.pharmacyshopautomation.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <link href="css/design.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">

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
                if (!roleType.equalsIgnoreCase("ATTENDANT")){
                    response.sendRedirect("/admindashboard.jsp");
                }
        }
            catch (Exception e){

            }

    }
        else {
            response.sendRedirect("/attendantdashboard.jsp");
        }
    try
    {
        List result = GeneralUtil.getAllStaffbyId();
        List categoryresult = GeneralUtil.getAllDrugCategories();
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

                    <a data-toggle="collapse" data-target="#drug"> Drug <i class="fa fa-caret-down"></i></a>
                    <ul id="drug" class="collapse">
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#selldrug" style="text-decoration: none" id="selldrug">Sell</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-plus" style="color: white"></i>
                            <a href="#viewdrug" style="text-decoration: none" id="viewdrug">View</a></li>
                        <li class="active nav" style="margin-left: 50px"><i class="fa fa-wrench" style="color: white"></i>
                            <a href="#restockdrug" style="text-decoration: none" id="restockdrug">Restock</a></li>
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

    <div class="main-panel" id="sell">
        <div class="col-sm-10 col-sm-offset-0">
            <%--<input type="text" id="leftover" name="leftover" value=""/>--%>
            <h2 style="color: #1ab7ea;margin-left:10px">SELL DRUG</h2>

            <form method="post" action="/AddSalesController">
                <div class="col-lg-6">
                        <br/>
                    <select class="form-control" name="drugcategory" id="drugcategory" required autocomplete="off" onchange="searchDrugList();clr();">
                        <option value="">Select Drug Category</option>
                        <%
                            for(int i = 0; i<categoryresult.size(); i++){
                        %>
                        <option value="<%=((DrugCategory) categoryresult.get(i)).getCategory()%>"><%=((DrugCategory) categoryresult.get(i)).getCategory()%></option>
                        <%
                            }
                        %>

                    </select>
                    <select class="form-control" name="drugname" id="drugname" onchange="searchDrug();clr();">
                        <option>Select</option>
                    </select>
                    <br/>

                    <p style="color:#1ab7ea" name="drugid">DRUG ID: <input type="text" name="drugid" id="drugid" style="border:none"/></p>
                    <br/>
                    <p style="color:#1ab7ea" name="quantity">AVAIL QUANTITY: <input type="text" name="quantity" id="quantity" style="border:none"/></p>
                    <br/>
                    <p style="color:#1ab7ea" name="price">DRUG PRICE: <input type="text" name="price" id="price" style="border:none"/></p>
                    <br/>
                    <p style="color:#1ab7ea" name="druglocation">DRUG LOCATION: <input type="text" name="druglocation" id="druglocation" style="border:none"/></p>
                    <br/>
                    <p style="color:#1ab7ea" id="expdate">EXPIRY DATE: <input type="text" name="expdate" id="expirydate" style="border:none"/></p>
                    <br/>
                    <input type="number" class="form-control" placeholder="Enter quantity requested" name="quantityrequested" id="quantityrequested" required autocomplete="off" onkeyup="getTotal()"/>
                    <br/>
                    <p style="color:#1ab7ea" id="totalamt">AMOUNT: <input type="text" name="total" id="total" style="border:none"/></p>

                    <table class="table table-hover table-condensed" cellpadding="2" cellspacing="2" id="">
                        <thead class="thead-default">
                        <tr>

                            <th>DRUG</th>
                            <th>CATEGORY</th>
                            <th>QUANT</th>
                            <th>PRICE</th>

                        </tr>
                        </thead>
                        <tbody id="billtable">

                        <tr class="bg-info">
                        </tr>
                        </tbody>
                    </table>

                    <p style="color:#1ab7ea" id=""> BILL:
                        <input type="text" name="totalbill" id="totalbill" style="border:none"/></p>
                    <input type="submit" value="SELL" class="btn btn-info" onclick=""/>
                    <input type="button" value="ADD TO BILL" class="btn btn-warning" onclick="addtobill();"/>


                </div>

                <br/>

                <div class="col-lg-3">
                       <br/>
                    <table class="table table-hover table-condensed" cellpadding="2" cellspacing="2">
                        <thead class="thead-default">
                        <tr>
                            <th>S/N</th>
                            <th>PRICE</th>
                        </tr>
                        </thead>
                        <tbody id="salestable">

                        <%--<tr class="bg-info">--%>
                            <%--<td>1</td>--%>
                            <%--<td>VITAMIN C</td>--%>

                        <%--</tr>--%>
                        <%--<tr class="bg-success">--%>
                            <%--<td>2</td>--%>
                            <%--<td>VITAMIN D</td>--%>
                        <%--</tr>--%>
                        <%--<tr class="bg-warning">--%>
                            <%--<td>3</td>--%>
                            <%--<td>PARACTEMOL</td>--%>
                        <%--</tr>--%>
                        </tbody>
                    </table>

                </div>
                <div class="col-sm-2">
                    <input type="text" name="search" id="search" placeholder="Search for Drug" class="form-control"/>
                    <p style="color:#1ab7ea">AVAILABLE: <input type="text" name="random" id="random" style="border:none"/></p>

                </div>
                <div class="col-sm-1">
                <br/>

                    <button type="button" class="btn btn-info" onclick="availabilityCheck()">

                        <span class="glyphicon glyphicon-search"></span>
                        Search
                    </button>

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
    <div class="main-panel" style="display: none" id="view">
        <div class="col-sm-12">
            <h2 style="color: #1ab7ea;margin-left: 10px">VIEW ALL SALES</h2>
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
                        <%--<%--%>
                            <%--for(int i = 0; i<result.size(); i++){--%>
                        <%--%>--%>
                        <%--<tr class="bg-info">--%>
                            <%--<td><%=i+1%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getStaffname()%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getStaffemail()%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getGender()%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getMaritalstatus()%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getAddress()%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getPhonenumber()%></td>--%>
                            <%--<td><%=((Staff) result.get(i)).getRole()%></td>--%>
                        <%--</tr>--%>
                        <%--<%--%>
                            <%--}--%>
                        <%--%>--%>
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
    <div class="main-panel" style="display: none" id="restock">
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


</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/material.min.js"></script>
<script src="js/material-dashboard.js"></script>
<script src="js/demo.js"></script>

<script>
    $(document).ready(function(){

        var issuesPresent = document.getElementById("info").innerHTML;
        if (issuesPresent != "")
            $("#myModalDialog").modal('show');

        function toUpperCase(fill) {
            fill.value = fill.value.toUpperCase();
        }

        $("#selldrug").click(function(){
            $("#sell").show();
            $("#view").hide();
            $("#restock").hide();
        });
        $("#viewdrug").click(function(){
            $("#view").show();
            $("#sell").hide();
            $("#restock").hide();
        });
        $("#restockdrug").click(function(){
            $("#restock").show();
            $("#view").hide();
            $("#sell").hide();
        });
    });
    function availabilityCheck(){
        var drugname =  document.getElementById("search").value;
      drugname.toUpperCase();
        if(drugname!=""){
            $.getJSON('/ServiceUtilController',{"operation":"5","drugname":drugname}, function (jd) {
                var Quantity = jd.Quantity;
                alert(Quantity);
                if(Quantity <= 50) {
                    document.getElementById('random').value = "YES, but 5 left";
                }
                else if(Quantity < 1){
                    document.getElementById('random').value = "NO";

                }
                else{
                    document.getElementById('random').value = "NO";

                }

            });
        }
    }
    function addtobill() {
            var getTable = $('#billtable');
            var drugname = document.getElementById("drugname").value;
            var drugcategory = document.getElementById("drugcategory").value;
            var total = document.getElementById("total").value;
            var quantity = document.getElementById("quantityrequested").value;
            var quant=document.getElementById("quantity").value;
            var leftover = quant - quantity;
        getTable.append("<tr><td><input type='text' class='form-control drug_name' value='"+drugname+"' readonly/></td>"+"<td><input type='text' class='form-control drug_category' value='"+drugcategory+"' readonly/></td>"+"<td><input type='text' class='form-control q_requested' value='"+quantity+"' readonly/></td>"+"<td><input type='text' class='form-control drug_price' value='"+total+"' readonly/></td>"+"<td><input type='hidden' class='form-control left_over' value='"+leftover+"' readonly/></td>"+"</tr>");
        var tArray = [];
        for(var i =0; i< ($('.drug_name').length); i++){
            $('.drug_name').eq(i).attr("id","dgname"+ i);
            $('.drug_name').eq(i).attr("name","dgname"+ i);
            $('.drug_category').eq(i).attr("id","dcategory"+ i);
            $('.drug_category').eq(i).attr("name","dcategory"+ i);
            $('.drug_price').eq(i).attr("id","dgprice"+ i);
            $('.drug_price').eq(i).attr("name","dgprice"+ i);
            $('.q_requested').eq(i).attr("id","qrequested"+ i);
            $('.q_requested').eq(i).attr("name","qrequested"+ i);
            $('.left_over').eq(i).attr("id","leftover"+ i);
            $('.left_over').eq(i).attr("name","leftover"+ i);
            $('.sn').eq(i).attr("value",i+1);
            $('.sn').eq(i).attr("id","snumber");

            var t = document.getElementById('dgprice' + i).value;
            tArray.push(t);
        }
        var sum = 0;
        for(var j = 0; j< tArray.length; j++){
            sum+= parseInt(tArray[j]);
        }
        document.getElementById("totalbill").value= sum;
    }
    function sell(){
        var dgid = document.getElementById("drugid").value;
        var quant=document.getElementById("quantity").value;
        var prc=document.getElementById("price").value;
        var dglocation =document.getElementById("druglocation").value;
        var expirydt =document.getElementById("expirydate").value;
        var quantrequested =document.getElementById("quantityrequested").value;
        var totall=document.getElementById("total").value;
        if (dgid!="" && quant!="" && prc!="" && dglocation!="" && expirydt!="" && quantrequested!="" && totall!="") {
            var getTable = $('#salestable');
            var bill = document.getElementById("totalbill").value;
            getTable.append("<tr class='bg-info'><td></td>" + "<td>" + bill + "</td></tr>");
            clr();
            document.getElementById("totalbill").value = "";
            $('#billtable').empty();
            var x = document.getElementsByTagName('form');
            x[0].submit();
            alert('submitted');
            return true;
        }
//        else if(dgid=="" && quant=="" && prc=="" && dglocation=="" && expirydt=="" && quantrequested=="" && totall==""){
//            alert('You need to select what you will sell');
//        }
    else {
            alert('You need to select what you will sell');
        }
    }
    function getTotal(){
        var price = document.getElementById("price").value;
        var quantityrequested = document.getElementById("quantityrequested").value;
        var total = price * quantityrequested;
        document.getElementById("total").value = total;

    }
    function clr() {
        document.getElementById("drugid").value = "";
        document.getElementById("quantity").value = "";
        document.getElementById("price").value = "";
        document.getElementById("druglocation").value = "";
        document.getElementById("expirydate").value = "";
        document.getElementById("quantityrequested").value = "";
        document.getElementById("total").value = "";
    }




    function addtosaleslist(){

    }
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
    function searchDrug(){

        var drugname = document.getElementById("drugname").value;

        if(drugname!=""){
            $.getJSON('/ServiceUtilController',{"operation":"5","drugname":drugname}, function (jd) {
                var Name = jd.Name;
                var Id = jd.Id;
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

                document.getElementById("drugid").value =Id;
                document.getElementById("quantity").value =Quantity;
                document.getElementById("price").value =Price;
                document.getElementById("druglocation").value =DrugLocation;
                document.getElementById("expirydate").value =ep;
            });
        }
    }
    function searchDrugList(){

        var drugcategory = document.getElementById('drugcategory').value;
        if(drugcategory!=null){
            $.getJSON('/ServiceUtilController',{"operation":"4","drugcategory":drugcategory}, function (jd) {

                var drugname = jd.drugList;
                var getBody = $('#drugname');
                getBody.html('');
                getBody.append("<option>Select</option>");
                for (i = 0; i < drugname.length; i++) {
                    var name = drugname[i];

                    getBody.append("<option value='" + name + "'>" + name + "</option>");

                }
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



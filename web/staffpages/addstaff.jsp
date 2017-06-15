<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddStaff</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/design.css">
    <script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>

<form>
    <h3 style="text-align: center; color: blue"> ADD EMPLOYEE</h3>
    <div class="form-group row">
        <label class="col-sm-2 form-control-label">EMPLOYEE ID</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="EmployeeId" name="EmployeeId" minlength="2" required>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 form-control-label">FIRST NAME</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="FirstName " name="FirstName"  minlength="2" required >
        </div>
    </div>
    <div class="form-group row">
        <label for="lastname" class="col-sm-2 form-control-label">LAST NAME</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="LastName" name="LastName"  minlength="2" required>
        </div>
    </div>
    <div class="form-group row">
        <label for="email" class="col-sm-2 form-control-label">EMAIL</label>
        <div class="col-sm-6">
            <input type="email" class="form-control" id="Email" name="Email" />
        </div>
    </div>

</form>


</body>
</html>

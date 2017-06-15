<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>HomePage:</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/design.css">
    <script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
      <script>
          $(document).ready(function(){
              var issuesPresent = document.getElementById("info").innerHTML;
              if(issuesPresent !="")
                  $ ("#myModalDialog").modal('show');
          });
      function toUpperCase(fill) {
      fill.value = fill.value.toUpperCase();
      }
      </script>
  </head>
  <body class="bdy">
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
                  <button type="button" class="btn bn" data-dismiss="modal">Close</button>
              </div>
          </div>
      </div>
  </div>
  <h1 style="text-align: center" class="animate">Aloha Pharmacy Automation System</h1>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-info bd">
          <div class="panel-heading">
            <h3>  Login </h3>
          </div>
          <div class="panel-body">
            <form autocomplete="off" method="post" action="/LoginController" role="form">
              <div class="form-group">
                <label for="username" class="sr-only">Username</label>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i> </span>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="" required onblur="toUpperCase(this)">
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="sr-only">Password</label>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i> </span>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="" required onblur="toUpperCase(this)">
                </div>
              </div>
                <p class="text-danger notice">

              </p>

              <div class="form-group">
                <button type="submit" class="btn btn-info">Login</button>
              </div>
            </form>
          </div>
        </div>
      </div>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" import="login.utility.CaptchaServlet"%>
 <%
  boolean showGoodResult;
  boolean showBadResult;
  if ("POST".equals(request.getMethod())) {
    String sessionToken = CaptchaServlet.getToken(session);
    String requestToken = request.getParameter("captcha");
    showGoodResult = sessionToken != null && sessionToken.equals(requestToken);
    showBadResult = !showGoodResult;
  } else {
    showGoodResult = showBadResult = false;
  }

  CaptchaServlet.generateToken(session);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="/js/script.js"></script>
<!-- password -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
        <script>
            var myApp = angular.module("myapp", []);
            myApp.controller("PasswordController", function($scope) {

                var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
                var mediumRegex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})");

                $scope.passwordStrength = {
                    "float": "left",
                    "width": "100px",
                    "height": "25px",
                    "margin-left": "5px"
                };

                $scope.analyze = function(value) {
                    if(strongRegex.test(value)) {
                        $scope.passwordStrength["background-color"] = "green";
                    } else if(mediumRegex.test(value)) {
                        $scope.passwordStrength["background-color"] = "orange";
                    } else {
                        $scope.passwordStrength["background-color"] = "red";
                    }
                };

            });
            
            $(".password").click(function () {

                if ($("input[type=password").filter(function () {
                    return this.value.match("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
                })) {
                    $("div").text("pass");
                } else {
                    $("div").text("fail");
                }

            });
        </script>
        
</head>
<body>
 <div align="center">
  <h1>Employee Login Form</h1>
  	<%  if (showGoodResult) {%>
  		<h1 style="color: green;">Your kung fu is good!</h1>
	<%  } else if (showBadResult) {%>
  		<h1 style="color: red;">This is not right. Try again!</h1>
	<%  } %>
  <form action="<%=request.getContextPath()%>/login" method="post">
   <table style="with: 100%">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" class="password"/>
		<p id="msg"></p>
		<p id="error"></p>
     </td>
    </tr>
   </table>
   <input type="submit" value="Login" onsubmit="passwordValidation()"/>
  <!--  <p>Type in the word seen on the picture</p>
   <input name="captcha" type="text" autocomplete="off" />
   <input type="submit" value="Login" />
   <img alt="captcha image" src="captcha" /> -->
  </form>
 	<a href="login/employeeregister.jsp">Registration</a><br>
 </div>
</body>
</html>
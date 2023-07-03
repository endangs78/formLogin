<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Hobbinity-Admin</title>
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="/hobbinity-admin/assets/css/app.css">
	
	<!-- jQuery -->
	<script src="/hobbinity-admin/assets/js/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="/hobbinity-admin/assets/js/vendor/jquery.min.js"><\/script>')</script>

</head>

<script src="/hobbinity-admin/script/common.js"></script>
<script src="<%=request.getContextPath()%>/script/md5.js"></script>
<script src="/src/webapp/js/script.js"></script>

<body class="section-register">
	<div class="md-layout">
		<div class="columns small-12 box-body">
			<form action="userRegistrationAdd.action">
				<div class="row collapse">
					<div class="columns small-12 text-left">
						<i class="hobb-lg-ico user"></i>
					</div>
					<div class="columns small-12 text-center">
					</div>
					<div class="columns small-12">
						</div>
					<div class="columns small-12">
					</div>
					<div class="columns small-12">
						<input id="dob" type="text" placeholder="Date of Birth" class="fdatepicker" value="<s:date name='userRegistration.birthDate' format='dd/MM/yyyy'/>" >
					</div>
					<div class="columns small-12">
						<!-- <input type="radio" name="is_private" value="Public" id="public"
							required><label for="public">Male</label> <input
							type="radio" name="is_private" value="Private" id="private"><label
							for="private">Female</label> -->
					</div>
					<div class="columns small-12">
					</div>
					<div class="columns small-12">
					</div>
					<div class="columns small-12">
						<input id="password" type="password" placeholder="Password" maxlength="64">
					</div>
					<div class="columns small-12">
						<input id="retypePassword" type="password" placeholder="Re-type Password" maxlength="64">
					</div>
					<div class="columns small-12">
						<input type="button" value="Create Account"
							class="button expanded small turquoise" 
							onclick="javascript: createAccount();">
					</div>
					<div class="columns small-12 goto-login">
						<a href="#" class="button expanded small clear" onclick="window.location='login.action'">Already
							have an account</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/app.js"></script>
</body>
</html>
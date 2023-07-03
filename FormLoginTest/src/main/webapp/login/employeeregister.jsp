<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="/src/webapp/js/script.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>Employee Register Form</h1>
<form action="<%=request.getContextPath()%>/register" method="post">
			<table style="with: 50%">
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>phone</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>email</td>
					<td><input type="text" name="email" /></td>
				</tr>
					<tr>
					<td>Password</td>
					<td><input type="password" name="password" /></td>
				</tr>
				</table>
			<input type="submit" value="Submit" /></form>
</body>
</html>
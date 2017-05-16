<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist","root","monika123"); 


HttpSession sess = request.getSession(false); //use false to use the existing session
String a1 = (String)sess.getAttribute("a1");//this will return username anytime in the session

		String newtext= request.getParameter("to_do_msz");
		String newd=request.getParameter("creationdate");
		String newc=request.getParameter("duedate");
		String newst=request.getParameter("typeofstud1");

String updateTableSQL = "UPDATE todo SET text = ? , duedate=?,createddate=?, Status=? WHERE text = ?";
PreparedStatement preparedStatement = cn.prepareStatement(updateTableSQL);
preparedStatement.setString(1, newtext);
preparedStatement.setString(2, newd);
preparedStatement.setString(3, newc);
preparedStatement.setString(4, newst);

preparedStatement.setString(5, a1);
%>
<script type="text/javascript">

alert("Edited Sucessfuly");

</script><% 
// execute insert SQL stetem
preparedStatement .executeUpdate();
%>
</body>
</html>
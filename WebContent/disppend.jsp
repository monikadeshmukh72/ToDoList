<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%@ page import="java.sql.*" %>
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
 table-layout: fixed;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
}
th, td {
    padding: 15px;
    text-align: right;
}
tr:hover{background-color:#f5f5f5}
</style>
</head>
<body>
<table style="width: 90%" border="1">
		<tr bordercolor="black" bgcolor="grey">
			<td>Message</td>
			<td>Creation Date</td>
			<td>Due Date</td>
			<td>Status</td>
			
		</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist","root","monika123"); 

		try {
			
			Statement s=cn.createStatement();
			int flag=0;
			
			ResultSet rs=s.executeQuery("select * from todo where Status = 'pending'");
			while(rs.next())
			{
			
	String a1=rs.getString(1);
				
				String a2 = rs.getString(2);				
				String a3 = rs.getString(3);
				String a4 = rs.getString(4);

				
				%>
	<table style="width: 90%" border="1">
		<tr>
			<td><%=a1%></td>
		
			<td><%=a3 %></td>
			<td><%=a2 %></td>
			<td><%=a4 %></td>
		
			
		</tr>
	</table>



	<%
		if (rs.isLast())
					break;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
</body>
</html>
</html>
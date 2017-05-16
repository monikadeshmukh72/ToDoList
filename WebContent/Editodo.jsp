<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=">

	<title>To Do List</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-labels-on-top.css">


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

tr:hover {
	background-color: #f5f5f5
}
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
String s= request.getParameter("mid");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist","root","monika123"); 

		try {
			
			Statement sq=cn.createStatement();
			int flag=0;
			
			ResultSet rs=sq.executeQuery("select * from todo where text = '"+s+"'");
			if(!rs.next())
				{%>
		<script type="text/javascript">

alert("No Text Found");
 
</script>
		<% }
				else
				{
					rs.previous();
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
		</table>
		
		
		<%
		HttpSession sess = request.getSession(); 
		sess.setAttribute("a1", a1);
		
		%>
	


  <div class="main-content">

        <!-- You only need this form and the form-labels-on-top.css -->

        <form class="form-labels-on-top" method="post" action="Edit.jsp">

            <div class="form-title-row">
                <h1>To Do List</h1>
            </div>
	    <div class="form-row">
                <label>
                    <span>New To Do Message</span>
                    <input type="text" name="to_do_msz" id="to_do_msz">
                </label>
            </div>
<div class="form-row">
                <label>
                    <span>New Creation Date</span>
                    <input type="date"  id="creationdate" name="creationdate">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>New Due Date</span>
                    <input type="date" id="duedate" name="duedate">
				</label>
            </div>

            
            
            <div class="form-row">
                <label>
                    <span>New Status</span>
                    <select name="typeofstud1" id="selects">
         
                        <option value="pending" >Pending</option>
                        <option value="completed" >Completed</option>
                        
                    </select>
                </label>
            </div>
            
	   
        <div class="form-row">
                <button ttype="submit" value="Submit">Submit Form</button>
            </div>

        </form>

    </div>
		<%
		if (rs.isLast())
					break;
			}
				}
			%>  
			
		 <%} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
	
</body>
</html>
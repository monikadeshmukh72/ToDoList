<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
button{
    border-radius: 5px;
    background-color:  #470619;
    color: #ffffff;
    font-weight: bold;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 14px 35px;
    border: 0-;
    margin-top: 15px;
}
button1{
    border-radius: 5px;
    background-color:  #123456;
    color: #ffffff;
    font-weight: bold;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 14px 35px;
    border: 0-;
    margin-top: 25px;
}
nav {
    line-height:30px;
    background-color:#eeeeee;
    height:1000px;
    width:150px;
    float:left;
    padding:50px;	      
}
</style>
<script>
function loadFrame (elm){
    var frame1 = document.getElementById('iframe2');

    frame1.src = elm.dataset.src;
}
</script>
<title>To Do List</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.ui.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.tabs.setup.js"></script>
</head>
<body>


<nav>
    <button id="b1" data-src="InsertToDo.html" onClick="loadFrame(this)">Create To Do List</button><br><br>
   <button id="b9" data-src="Searchdetails.html" onClick="loadFrame(this)">Display based on Text</button><br>
      <button id="b8" data-src="dueinnextndays.html" onClick="loadFrame(this)">Display To Do Due in next N Days</button><br>
    <button id="b3" data-src="dispsortdue.jsp" onClick="loadFrame(this)">Display To Do Sorted by Duedate</button><br>
   <button id="b7" data-src="dispsortcr.jsp" onClick="loadFrame(this)">Display To Do Sorted by Creation Date</button><br><br>
       <button id="b10" data-src="editdetails.html" onClick="loadFrame(this)">Edit To Do Item</button><br>
    <button id="b2" data-src="deletedetails.html" onClick="loadFrame(this)">Delete To Do Item</button><br><br>
    <button id="b4" data-src="display.jsp" onClick="loadFrame(this)">Display all To Do</button>
     <button1 id="b5" data-src="dispcomp.jsp" onClick="loadFrame(this)">Completed</button1>
     <button1 id="b6" data-src="disppend.jsp" onClick="loadFrame(this)">Pending</button1>
    
  </nav>
 
 
  <p align="center">
<iframe id="iframe2" scrolling="yes" width="500" height="700" align="middle" frameborder="0"></iframe>
    </p>

  

</body>



</html>
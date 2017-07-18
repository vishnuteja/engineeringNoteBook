<%@page import="java.io.*,java.sql.*,com.mysql.jdbc.Connection,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpServletRequest,javax.servlet.*,java.util.*,javax.servlet.ServletException,javax.servlet.http.HttpServlet ,javax.servlet.annotation.WebServlet"  session = "true"%>

<%
		
		if (session.isNew())
		{
			session.invalidate();
			//System.out.println("Redirecting........");
		    response.sendRedirect("index3.jsp");
		}
		
		else
		{
%>

<html>
<head>
<title>Today's ENB</title>

<style type="text/css">
.auto-style1 {
	text-align: center;
}


.UPDATE
{
width: 10%;
cursor: pointer;
background: none repeat scroll 0% 0% rgb(61, 157, 179);
padding: 12px 10px;
font-family: 'Verdana','Arial Narrow',Arial,sans-serif;
color: rgb(255, 255, 255);
font-size: 15px;
border: 1px solid rgb(28, 108, 122);
margin-bottom: 10px;
text-shadow: 0px 1px 1px rgba(0, 0, 0, 0.5);
border-radius: 3px 3px 3px 3px;
box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset, 0px 0px 0px 3px rgb(254, 254, 254), 0px 5px 3px 3px rgb(210, 210, 210);
-moz-transition: all 0.2s linear 0s;
}
</style>
<link rel="stylesheet" type="text/css" href="./css/ENB.css" />
<link rel="stylesheet" type="text/css" href="./css/demo.css" />

<script type='text/javascript' src="./js/rows.js"></script>
<script src="scripts/wysiwyg.js"></script>
<script src="scripts/wysiwyg-settings.js"></script>
<script src="js/rows.js"></script>
<script>	WYSIWYG.attach('textarea2'); </script>
<style type="text/css">
.auto-style1 {
	text-align: center;
}

</style>

</head>

<body style="width: 1334px; height: 1177px">

<div class="container">

            <header>
                <h1>Engineering Note Book <span>Online</span></h1>
                
                <h2>Today's ENB</h2>
            </header>
<center>

<table width="1300" border="0">
  <tr align="right">
    <td><a href=<%=request.getHeader("referer")%>><img src="./images/back.png" width="53" height="53" title="Back"/></a></td>
    <td><a href="home.jsp"><img src="./images/home.png" width="53" height="53" title="Home"/></a></td>
    <td valign="middle" align="right">Hi, <%=session.getAttribute("name") %><a href="logout.jsp"><img src="./images/signout.png" width="53" height="53" title="Sign Out"/></a></td>
  </tr>
</table>

</center>
</div>
<ul id="tabs">
    <li><a href="#" title="tab1">Engineering Note Book</a></li>
</ul>


<div id="content"> 
   
<!-- ----------------------------------------------------------------------------------------------- -->
   
<div id="tab1">

			<% 
			
			String id=session.getAttribute("id").toString();
			
		try
	  	{
			java.util.Date d = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(d.getTime());

			ResultSet rs = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root", "");
			Statement stmt = con.createStatement();
			boolean flag = false;
			rs=stmt.executeQuery("select date from enb_details where userid='"+id+"' and date='"+sqlDate+"'");
			
			if(rs.next() == false)
			{
				response.sendRedirect("createENB.jsp");
			}
			
			else
			{
			%>
			<form name="exampleForm" action="UpdateCurrentENB" method="post">
			<table border="4" width="1100">
				<tr align="center">
					<td>Employee ID : <b><%=id %></b></td>
					<td>Name : <b><%=session.getAttribute("name") %></b></td>
					<td>Date of ENB : <b><%=sqlDate %></b></td>
				</tr>
			</table>
			
			
			<%
			rs=stmt.executeQuery("select notes from notes where userid='"+id+"' and date = '"+sqlDate+"'");
			%>
			
			<br>
			<h1>Notes</h1>
			<br>
			
			<%        if(rs.next() == true){     %>
			
	         <textarea id="textarea2" name="notes" style="width:80%;height:200px;"> <%=rs.getString(1)%> </textarea>
	        
	        <%
			}
			
			else
			{%>
				<textarea id="textarea2" name="notes" style="width:80%;height:200px;"> </textarea>
			<%}
	        rs.close();
	        stmt.close();
	        
			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from deliverables where userid='"+id+"' and date = '"+sqlDate+"'");
			%>
			<br>
			<h1>Deliverable status</h1>
			<br>
			<INPUT type=button value="Add Deliverable" onclick=addRow2('dataTable') />
			<TABLE id=dataTable border=4 >
					<TR>
						<TD>Deliverable</TD>
						<TD>What did you plan to accomplish</TD>
						<TD>What did you actually accomplish</TD>
						<TD>size</TD>
						<TD>Effort</TD>
					</TR>

			<%
			
	        while(rs.next())
	        {
		         %>
		         
		         
		         <tr>
		         	<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
		         	<td><%=rs.getString(5)%></td>
		         	<td><%=rs.getString(6)%></td>
		         	<td><%=rs.getString(7)%></td>
		         </tr>
		        
		         <%
	        }
			%>
			
			<%
			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from lessons where userid='"+id+"' and date = '"+sqlDate+"'");

			%>
			 </table>
			 
			 
			 
			<br>
			<h1>Lessons Learned</h1>
			<br>
			
			<INPUT type=button value="Add Lesson" onclick=addRow3('dataTable1') />
			<TABLE id=dataTable1  border=4>
					<TR>
						<TD>Context (e.g. The gap between plan and actual)</TD>
						<TD>Lesson</TD>
					</TR>
			
			<%
			
	        while(rs.next())
	        {
		         %>
		        
		         <tr>
		         	<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
		         </tr>
		         
		         <%
	        }

			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from plan where userid='"+id+"' and date = '"+sqlDate+"'");

			%>
			</table>
			<br>
			<h1>Plan for next day</h1>
			<br>
			
			<INPUT type=button value="Add Plan" onclick=addRow4('dataTable3') />
			<TABLE id=dataTable3  border=4>
					<TR>
						<TD>Deliverable</TD>
						<TD>What do you intend to accomplish and why</TD>
					</TR>
			
			<%
			
	        while(rs.next())
	        {
		         %>
		        
		         <tr>
		         	<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
		         </tr>
		        
		         <%

	        }
			}
	  	}
	  	
	  	catch(Exception e)
	  	{
	  		System.out.println(e);
	  	}
		
		%>
<br>
</table>
<br><br>
<input class="UPDATE" type=submit value="Update ENB" />
</form>
	</div>
</div>


</body>
</html>
<%}%>
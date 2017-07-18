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
<title>View ENB</title>

<style type="text/css">
.auto-style1 {
	text-align: center;
}
</style>
<link rel="stylesheet" type="text/css" href="./css/ENB.css" />
<link rel="stylesheet" type="text/css" href="./css/demo.css" />

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
                
                <h2>View ENB</h2>
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
			
			String id=request.getParameter("id");
			String date=request.getParameter("date");
			
		try
	  	{
			ResultSet rs = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root", "");
			Statement stmt = con.createStatement();
			
			rs=stmt.executeQuery("select name from user where userid='"+id+"'");
			rs.next();
			
			%>
			
			<table border="4" width="1100">
				<tr align="center">
					<td>Employee ID : <b><%=id %></b></td>
					<td>Name : <b><%=rs.getString(1) %></b></td>
					<td>Date of ENB : <b><%=date %></b></td>
					
				</tr>
			</table>
			
			<%
			rs=stmt.executeQuery("select notes from notes where userid='"+id+"' and date = '"+date+"'");

			%>
			<br>
			<h1>Notes</h1>
			<br>
			<table border="4">
			<%

			
	        while(rs.next())
	        {
	         %>
	         
	         	<tr><td><%=rs.getString(1)%></td></tr>
	         </table>
	         <%
	        }
			
	        rs.close();
	        stmt.close();
	        
			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from deliverables where userid='"+id+"' and date = '"+date+"'");
			%>
			<br>
			<h1>Deliverable status</h1>
			<br>
			
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
			
			stmt = con.createStatement();
			rs=stmt.executeQuery("select * from lessons where userid='"+id+"' and date = '"+date+"'");

			%>
			 </table>
			<br>
			<h1>Lessons Learned</h1>
			<br>
			
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
			rs=stmt.executeQuery("select * from plan where userid='"+id+"' and date = '"+date+"'");

			%>
			</table>
			<br>
			<h1>Plan for next day</h1>
			<br>
			
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
	  	
	  	catch(Exception e)
	  	{
	  		System.out.println(e);
	  	}
		
		%>
<br>
</table>
	</div>
</div>


</body>
</html>
<%}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="true" import="java.sql.*"%>
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
<title>Preview ENB's</title>

<link rel="stylesheet" type="text/css" href="./css/ENB.css" />
<link rel="stylesheet" type="text/css" href="./css/demo.css" />

<style type="text/css">
.auto-style1 {
	text-align: center;
}
select {
border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 30px;
	padding: 9px;
	display:block;
	font-size:16px;
	width:10%;
	background: 
		-webkit-gradient(
			linear,
			left top,
			left 25,
			from(#FFFFFF),
			color-stop(4%, #EEEEEE),
			to(#FFFFFF)
		);
	background: 
		-moz-linear-gradient(
			top,
			#FFFFFF,
			#EEEEEE 1px,
			#FFFFFF 25px
			);
	-moz-box-shadow: 0px 0px 8px #f0f0f0;
	-webkit-box-shadow: 0px 0px 8px #f0f0f0;
	box-shadow: 0px 0px 8px #f0f0f0;

}
a
{
font-size:large;
cursor: auto
}
a:link {color:blue;}
a:visited {color: #FFFFF;}
a:hover {text-decoration: underline; color: #ff9900; font-weight:italic;cursor:pointer;}
a:active {color: #ff0000;text-decoration: none}
</style>
<script language="javascript" type="text/javascript">  
		      var xmlHttp  
		      var xmlHttp
		      function showState(str){
			      if (typeof XMLHttpRequest != "undefined"){
			      		xmlHttp= new XMLHttpRequest();
			      }
			      else if (window.ActiveXObject){
			      		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      if (xmlHttp==null){
				      alert("Browser does not support XMLHTTP Request")
				      return;
			      } 
			      var url="getProjects.jsp";
			      url +="?ID=" +str;
			      xmlHttp.onreadystatechange = stateChange;
			      xmlHttp.open("GET", url, true);
			      xmlHttp.send(null);
		      }
		
		      function stateChange(){   
			      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
			      		document.getElementById("projects").innerHTML=xmlHttp.responseText   
		      	  }   
		      }
		      
		      function showENB(str){
			      if (typeof XMLHttpRequest != "undefined"){
			      		xmlHttp= new XMLHttpRequest();
			      }
			      else if (window.ActiveXObject){
			      		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      if (xmlHttp==null){
				      alert("Browser does not support XMLHTTP Request")
				      return;
			      } 
			      var url="getOthersENBTitles.jsp";
			      url +="?project=" +str;
			      xmlHttp.onreadystatechange = projectChange;
			      xmlHttp.open("GET", url, true);
			      xmlHttp.send(null);
		      }
		      function projectChange(){   
			      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
			      		document.getElementById("ENBs").innerHTML=xmlHttp.responseText   
		      	  }   
		      }

      </script>  
</head>

<body style="width: 1334px; height: 1177px">
<center>
<div class="container">

            <header>
                <h1>Engineering Note Book <span>Online</span></h1>
                <h2>Preview ENB's Page</h2>
            </header>
</div>

<%
	HttpSession s = request.getSession(true);
%>

<table width="1300" border="0">
  <tr align="right">
    <td><a href=<%=request.getHeader("referer")%>><img src="./images/back.png" width="53" height="53" title="Back"/></a></td>
    <td><a href="home.jsp"><img src="./images/home.png" width="53" height="53" title="Home"/></a></td>
    <td valign="middle" align="right">Hi, <%=session.getAttribute("name") %><a href="logout.jsp"><img src="./images/signout.png" width="53" height="53" title="Sign Out"/></a></td>
  </tr>
</table>
						
						<br>
						<div>
							<label>Select Employee ID</label>
							<select name='empid' onchange="showState(this.value)">  
	       						<option value="none">Select</option>
	       						<%
									 Class.forName("com.mysql.jdbc.Driver").newInstance();  
									 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root","");  
									 Statement stmt = con.createStatement();  
									 ResultSet rs = stmt.executeQuery("Select distinct(userid) from enb_details where userid != '"+s.getAttribute("id")+"'");
									 while(rs.next()){
							     %>
							     <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>  
	      						<%
	 								}
									 stmt.close();
									 rs.close();
									 con.close();
	     						%>
      						</select>
						</div>

<div id="projects">

</div>
<br><br>
<div id="ENBs">

</div>

</center>
</body>
</html>
<%}%>
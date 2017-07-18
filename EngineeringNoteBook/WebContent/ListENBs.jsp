<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="true" import="java.sql.*" session="true"%>
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
<title>List of ENB's</title>
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
			      var url="getENBTitles.jsp";
			      url +="?project=" +str;
			      xmlHttp.onreadystatechange = stateChange;
			      xmlHttp.open("GET", url, true);
			      xmlHttp.send(null);
		      }
		
		      function stateChange(){   
			      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
			      		document.getElementById("titles").innerHTML=xmlHttp.responseText   
		      	  }   
		      }
		</script>

<link rel="stylesheet" type="text/css" href="./css/demo.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/styl.css" />
<link rel="stylesheet" type="text/css" href="./css/style_common.css" />  
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

</head>

<body>
<center>
 <div class="container">
            <header>
                <h1>Engineering Note Book <span>Online</span></h1>
                <h2>List of ENB's</h2>
            </header>
</div>

<table width="1300" border="0">
  <tr align="right">
    <td><a href=<%=request.getHeader("referer")%>><img src="./images/back.png" width="53" height="53" title="Back"/></a></td>
    <td><a href="home.jsp"><img src="./images/home.png" width="53" height="53" title="Home"/></a></td>
    <td valign="middle" align="right">Hi, <%=session.getAttribute("name") %><a href="logout.jsp"><img src="./images/signout.png" width="53" height="53" title="Sign Out"/></a></td>
  </tr>
</table>
						<h3>Select Project to get list of ENBs</h3>
						<br>
						<div>
							
							<select name='prjts' onchange="showState(this.value)">  
	       						<option value="none">Select</option>
	       						<%
	       						java.util.Date d = new java.util.Date();
	       						java.sql.Date sqlDate = new java.sql.Date(d.getTime());
									 Class.forName("com.mysql.jdbc.Driver").newInstance();  
									 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root","");  
									 Statement stmt = con.createStatement();  
									 ResultSet rs = stmt.executeQuery("Select distinct(projectname) from enb_details where userid='"+session.getAttribute("id")+"' AND date!='"+sqlDate+"'");
									 while(rs.next()){
							     %>
							     <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>  
	      						<%
	 								}
	     						%>
      						</select>
						</div>
<br><br>
<div id="titles">
						
</div>

</center>
</body>
</html>
<%}%>
<!DOCTYPE html>

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
<title>Home Page</title>

<link rel="stylesheet" type="text/css" href="./css/ENB.css" />
<link rel="stylesheet" type="text/css" href="./css/demo.css" />

<style type="text/css">
.auto-style1 {
	text-align: center;	
}

input
{
width: 20%;
cursor: pointer;
background: none repeat scroll 0% 0% rgb(61, 157, 179);
padding: 12px 10px;
font-family: 'Verdana','Arial Narrow',Arial,sans-serif;
color: rgb(255, 255, 255);
font-size: 24px;
border: 1px solid rgb(28, 108, 122);
margin-bottom: 10px;
text-shadow: 0px 1px 1px rgba(0, 0, 0, 0.5);
border-radius: 3px 3px 3px 3px;
box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset, 0px 0px 0px 3px rgb(254, 254, 254), 0px 5px 3px 3px rgb(210, 210, 210);
-moz-transition: all 0.2s linear 0s;
}

</style>

</head>

<body style="width: 1334px;">

 <div class="container">

            <header>
                <h1>Engineering Note Book <span>Online</span></h1>
                <h2>Home Page</h2>
            </header>
</div>

<table width="1300" border="0">
  <tr align="right">
    <td><a href=<%=request.getHeader("referer")%>><img src="./images/back.png" width="53" height="53" title="Back"/></a></td>
    <td><a href="home.jsp"><img src="./images/home.png" width="53" height="53" title="Home"/></a></td>
    <td valign="middle" align="right">Hi, <%=session.getAttribute("name") %><a href="logout.jsp"><img src="./images/signout.png" width="53" height="53" title="Sign Out"/></a></td>
  </tr>
</table>

   <br><br><br><br>
  <center>
		You can't create more than 1 ENB on a day
  </center>

</body>
</html>
<%}%>
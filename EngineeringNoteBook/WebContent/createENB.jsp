<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Create ENB</title>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        
    </head>
    <body>

 <div class="container">

            <header>
                <h1>Engineering Note Book <span>Online</span></h1>
                
                <h2>Create ENB</h2>
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
</div>                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">

<form class="forgot_password active" action="CreateENB" method="post">
						<h1>Create an ENB</h1>
						<div>
							<label>Project Name:</label>
							<input type="text" name = "project"/>

                         </div>
                         <div>
							<label>ENB Title:</label>
							<input type="text" name = "title"/>
                         </div>
						<div class="bottom">
						        <p class="login button"> 
                                    <input type="submit" value="Create" /> 
								</p>
						</div>
					</form>
					</div>
				 </div>
				 </div>  
            </section>
		</div>

		<!-- The JavaScript -->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		
    </body>
</html>
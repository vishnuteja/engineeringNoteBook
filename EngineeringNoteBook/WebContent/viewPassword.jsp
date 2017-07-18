<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Forgot Password</title>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        
    </head>
    <body>

        <div class="container">

            <header>
                <h1>Engineering Note Book <span>Online</span></h1>
               	
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
						<form class="forgot_password active" action="forgotPswd" method="post">
						<p>Your Password</p>
						
						<p><%=session.getAttribute("Password")%></p>
                         <%session.removeAttribute("Password"); %>
						        <p class="login button"> 
                                    <a href="index3.jsp"><input type="button" value="Login" /></a> 
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
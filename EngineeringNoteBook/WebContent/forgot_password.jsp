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
						<h1>Recover Password</h1>
						<div>
							<label>Employee ID:</label>
							<input type="text" name = "EmpID"/>

                         </div>
                         <div>
							<label>Email:</label>
							<input type="text" name = "email"/>
                         </div>
						<div class="bottom">
						        <p class="login button"> 
                                    <input type="submit" value="See" /> 
								</p>
						
							
                                <p class="change_link">
									
									<a href="index3.jsp" class="to_register">Join us</a>
									
									<a href="index3.jsp" class="to_register">Login</a>
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
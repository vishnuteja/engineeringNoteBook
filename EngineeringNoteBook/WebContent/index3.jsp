<%@ page session = "true" %>
<!DOCTYPE html>
<%
if(session!=null) {
session.invalidate();
}
%>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Engineering Notebook</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
		
		<script type='text/javascript' src="./js/validations.js"></script>
		
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
                            <form  name="Login" method="POST" action="Login" autocomplete="on" onsubmit = "return login_validate()"> 
                                <h1>SIGN IN</h1> 
                                <p> 
                                    <label for="EmpID" class="uname" data-icon="u" > Your Employee ID </label>
                                    <input id="EmpID" name="EmpID" required="required" type="text"/>
                                </p>
                                <p>
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="password" required="required" type="password"/> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
									Forgot
									<a href="forgot_password.jsp" class="to_register">Password ?</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  name="Register" action="Register" method="POST" autocomplete="off" onsubmit = "return register_validate()" > 
                                <h1> NEW USER REGISTRATION </h1> 
                                <p> 
                                    <label for="EmpIDsignup" class="uname" data-icon="u">Your Employee ID</label>
                                    <input id="EmpIDsignup" name="EmpIDsignup" required="required" type="text"/>
                                </p>
                                
                                <p> 
                                    <label for="fullname" class="fullname" data-icon="u">Full Name</label>
                                    <input id="fullname" name="fullname" required="required" type="text"/>
                                </p>
                                
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email"/> 
                                </p>
                                
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password"/>
                                </p>
                                
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>
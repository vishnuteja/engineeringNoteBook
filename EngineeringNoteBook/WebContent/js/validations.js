function Notes_validate()
{
	//deliverable status
	var deliverable=document.getelmentbyid();
	var What_did_you_plan
	var what_did_u_accomplish
	
	if(length_check4(deliverable,5,200) && alphanumericspecial2(deliverable))
		{
		if(length_check5(What_did_you_plan,5,300) && alphanumericspecial3(What_did_you_plan))
			{
			if(length_check6(What_did_u_accomplish,5,300) && alphanumericspecial4(What_did_u_accomplish))
				return true
			}
			
		
		}
	return false;
	
	//Leasons Learnt
	
	//Plan for next day
}





function forgot_pass_validate()
{
var empID = document.forgot_password.EmpID;
var mail = document.forgot_password.email;
if(length_check1(empID,5,20) && alphanumericspecial1(empID))
{
	if(ValidateEmail(mail))
	{
	return true;
	}
	
}
return false;
}

function login_validate()
{

//alert("first alert");
var empID = document.Login.EmpID;
var pwd = document.Login.password;

if(length_check1(empID,5,20) && alphanumericspecial1(empID))
{
			if(length_check2(pwd,5,10) && alphanumeric1(pwd))
			{
				return true;
			}
return false;
}

}

function register_validate()
{

//alert("first alert");
var empID = document.Register.EmpIDsignup;
var fullname = document.Register.fullname;
var mail = document.Register.emailsignup;
var pwd = document.Register.passwordsignup;

if(length_check1(empID,5,20) && alphanumericspecial1(empID))
{
	if(length_check3(fullname,5,20) && onlyAlpha1(fullname))
	{
		if(ValidateEmail(mail))
		{
			if(length_check2(pwd,5,10) && alphanumeric1(pwd))
			{
				return true;
			}
		}
	}
}
return false;
}

function length_check1(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 )
	{
		alert("Employee id should not be empty ");
		uid.focus();
		return false;
	}
	if(uid_len >= my || uid_len < mx)
	{
		uid.focus();
		alert(" Employee id length should be between "+mx+" to "+my);
		return false;
	}
	
	return true;
}


function length_check2(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 )
	{
		alert("Password should not be empty");
		uid.focus();
		return false;
	}
	if(uid_len >= my || uid_len < mx)
		{
	uid.focus();
	alert(" Password length should be between "+mx+" to "+my);
	return false;
		}
	
	return true;
}

function length_check3(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("Full Name should not be empty");
		uid.focus();
		return false;
	}
	
	if(uid_len >= my || uid_len < mx)
	{
		uid.focus();
		alert(" Full Name length be between "+mx+" to "+my);
		return false;
	}
	
	return true;
}

function length_check4(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("Deliverable should not be empty");
		uid.focus();
		return false;
	}
	
	if(uid_len >= my || uid_len < mx)
	{
		uid.focus();
		alert(" Deliverable length be between "+mx+" to "+my);
		return false;
	}
	
	return true;
}

function length_check5(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("'What_did_you_plan' field should not be empty");
		uid.focus();
		return false;
	}
	
	if(uid_len >= my || uid_len < mx)
	{
		uid.focus();
		alert(" 'What_did_you_plan' length be between "+mx+" to "+my);
		return false;
	}
	
	return true;
}

function length_check6(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("'What_did_u_accomplish' field should not be empty");
		uid.focus();
		return false;
	}
	
	if(uid_len >= my || uid_len < mx)
	{
		uid.focus();
		alert(" 'What_did_u_accomplish' length be between "+mx+" to "+my);
		return false;
	}
	
	return true;
}


/*function alphanumeric1(input)
{ 
	var letters = /^[0-9a-zA-Z]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Only alphanumeric characters are allowed in password');
		input.focus();
		return false;
	}
}
*/
function onlyAlpha1(input)
{ 
	var letters = /^[a-zA-Z]+$/;

	if(input.value.match(letters))
	{
		return true;
	}
	
	else
	{
		if(input==document.Register.fullname)
		alert('Enter a valid First Name');
		
		else if(input==document.Register.lastname)
		alert('Enter a valid Last Name');

		input.focus();
		return false;
	}
}

/*function alphanumericspecial1(input)
{ 
	var letters = /^[0-9a-zA-Z.@$_]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Alpha Numeric charcters and . @ $ _  are allowed in employee id');
		input.focus();
		return false;
	}
}*/

function ValidateEmail(uemail)
{
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if(uemail.value.match(mailformat))
	{
		return true;
	}
	
	else
	{
		alert("You have entered an invalid email address! eg:abcd@gmail.com");
		uemail.focus();
		return false;
	}
}

function login_validate()
{

//alert("first alert");
var empID = document.Login.EmpID;
var pwd = document.Login.password;

if(length_check1(empID,5,20) && alphanumericspecial1(empID))
{
			if(length_check2(pwd,5,10) && alphanumeric1(pwd))
			{
				return true;
			}
return false;
}

}

function register_validate()
{

//alert("first alert");
var empID = document.Register.EmpIDsignup;
var fullname = document.Register.fullname;
var mail = document.Register.emailsignup;
var pwd = document.Register.passwordsignup;

if(length_check1(empID,5,20) && alphanumericspecial1(empID))
{
	if(length_check3(fullname,5,20) && onlyAlpha1(fullname))
	{
		if(ValidateEmail(mail))
		{
			if(length_check2(pwd,5,10) && alphanumeric1(pwd))
			{
				return true;
			}
		}
	}
}
return false;
}
/*
function length_check1(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("Employee id should not be empty  "+mx+" to "+my);
		uid.focus();
		return false;
	}
	
	return true;
}


function length_check2(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("full name should not be empty / length be between "+mx+" to "+my);
		uid.focus();
		return false;
	}
	
	return true;
}

function length_check3(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("Password should not be empty / length be between "+mx+" to "+my);
		uid.focus();
		return false;
	}
	
	return true;
}*/
function alphanumeric1(input)
{ 
	var letters = /^[0-9a-zA-Z]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Only alphanumeric characters are allowed in password');
		input.focus();
		return false;
	}
}

function onlyAlpha1(input)
{ 
	var letters = /^[a-zA-Z]+$/;

	if(input.value.match(letters))
	{
		return true;
	}
	
	else
	{
		if(input==document.Register.fullname)
		alert('Enter a valid First Name');
		
		else if(input==document.Register.lastname)
		alert('Enter a valid Last Name');

		input.focus();
		return false;
	}
}

function alphanumericspecial1(input)
{ 
	var letters = /^[0-9a-zA-Z.@$_]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Alpha Numeric charcters and . @ $ _  are allowed in employee id');
		input.focus();
		return false;
	}
}

function alphanumericspecial2(input)
{ 
	var letters = /^[0-9a-zA-Z.@$_]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Alpha Numeric charcters and . @ $ _  are allowed in deliverable');
		input.focus();
		return false;
	}
}


function alphanumericspecial3(input)
{ 
	var letters = /^[0-9a-zA-Z.@$_]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Alpha Numeric charcters and . @ $ _  are allowed in "What_did_you_plan" field');
		input.focus();
		return false;
	}
}

function alphanumericspecial4(input)
{ 
	var letters = /^[0-9a-zA-Z.@$_]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Alpha Numeric charcters and . @ $ _  are allowed in "What_did_u_accomplish" field');
		input.focus();
		return false;
	}
}

function ValidateEmail(uemail)
{
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if(uemail.value.match(mailformat))
	{
		return true;
	}
	
	else
	{
		alert("You have entered an invalid email address! eg:abcd@gmail.com");
		uemail.focus();
		return false;
	}
}
function login_validate()
{
var empID = document.Login.EmpID;
var pwd = document.Login.password;

if(length_check(empID,5,20) && alphanumericspecial(empID))
{
			if(length_check(pwd,5,10) && alphanumeric(pwd))
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

if(length_check(empID,5,20) && alphanumericspecial(empID))
{
	if(length_check(fullname,5,20) && onlyAlpha(fullname))
	{
		if(ValidateEmail(mail))
		{
			if(length_check(pwd,5,10) && alphanumeric(pwd))
			{
				return true;
			}
		}
	}
}
return false;
}

function length_check(uid,mx,my)
{
	var uid_len = uid.value.length;
	
	if (uid_len == 0 || uid_len >= my || uid_len < mx)
	{
		alert("It should not be empty / length be between "+mx+" to "+my);
		uid.focus();
		return false;
	}
	
	return true;
}

function alphanumeric(input)
{ 
	var letters = /^[0-9a-zA-Z]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Please input alphanumeric characters only');
		input.focus();
		return false;
	}
}

function onlyAlpha(input)
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

function alphanumericspecial(input)
{ 
	var letters = /^[0-9a-zA-Z.@$_]+$/;
	if(input.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Alpha Numeric charcters and . @ $ _  are allowed');
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
		alert("You have entered an invalid email address!");
		uemail.focus();
		return false;
	}
}
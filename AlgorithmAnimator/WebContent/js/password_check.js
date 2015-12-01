function passwordCheck()
{
var pwd = document.getElementById("pwd").value;
var cpwd=document.getElementById("cpwd").value;

if(pwd!=cpwd)
	{
		document.getElementById("cpwd").setCustomValidity('Password Mismatch');
	}
else
	{
	document.getElementById("cpwd").setCustomValidity('');
	
	}

}

function patternMismatch()
{
	if(document.getElementById('phone').validity.patternMismatch)
		{
		document.getElementById("phone").setCustomValidity('Phone number should be 10 digit long');
		}
	else
	{
	document.getElementById("phone").setCustomValidity('');
	
	}
}

function rangeCheck()
{

	if(document.getElementById('pwd').value.length<6)
		{
		document.getElementById("pwd").setCustomValidity('Password should be min 6 characters');
		}
	else
		{
		
		document.getElementById("pwd").setCustomValidity('');
		
		}
	
}
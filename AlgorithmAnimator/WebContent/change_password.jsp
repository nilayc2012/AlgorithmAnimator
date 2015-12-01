<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style.css">

    
    
    
  </head>

  <body>

    <div class="form">
      
      <h1>Change Password</h1>
      
      <div class="tab-content">

          
          <form id ="myform" action="ChangePasswordServlet" method="post">
          
         <div class="field-wrap">
            <label>
              Current Password<span class="req">*</span>
            </label>
            <input type="password" name="current" id="current" required autocomplete="off"/>
          </div>
          <div class="field-wrap">
            <label>
              New Password<span class="req">*</span>
            </label>
            <input type="password" name="pwd" id="pwd" onchange ="rangeCheck();" required autocomplete="off"/>
          </div>
          <div class="field-wrap">
            <label>
              Confirm Password<span class="req">*</span>
            </label>
            <input type="password" name="cpwd" id="cpwd" onchange ="passwordCheck();" required autocomplete="off"/>
          </div>
          
            
          <button type="submit" id="mybutton" class="button button-block">Change Password</button>
          
          </form>



       
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
        <script src="js/password_check.js"></script>

    <% String status =(String) request.getAttribute("status");
    if(status!=null)
    {
    if(status.equals("success"))
    {
    	%><script type="text/javascript">
    	window.alert("Password Changed");
    	document.getElementById("current").disabled=true;
    	document.getElementById("pwd").disabled=true;
    	document.getElementById("cpwd").disabled=true;
    	document.getElementById("myform").action="learner_home.jsp";
    	document.getElementById("mybutton").innerHTML="Back";
    	</script>
    	
    	<%request.setAttribute("status", null);
    }
    else if(status.equals("failure"))
    {
    	%><script type="text/javascript">
    	window.alert("Wrong Current Password Entered");
    	</script>
    	<%
    	request.setAttribute("status", null);
    }
    
    }%>
    
    
  </body>
</html>

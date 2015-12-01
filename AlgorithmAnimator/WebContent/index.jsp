<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Sign-Up/Login Form</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style.css">

    
    
    
  </head>

  <body>

    <div class="form">
      
      <h1>Algorithm Animator</h1>
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          
          <form action="RegServlet" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="fname" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="lname" required autocomplete="off"/>
            </div>
          </div>
          <div class="field-wrap">
              <label>
                User Name<span class="req">*</span>
              </label>
              <input type="text" name="uname" required autocomplete="off"/>
            </div>

            <div class="field-wrap">
            <label>
              Enter Password<span class="req">*</span>
            </label>
            <input type="password" name="pwd" id="pwd" onchange ="rangeCheck();" required autocomplete="off"/>
          </div>
          <div class="field-wrap">
            <label>
              Confirm Password<span class="req">*</span>
            </label>
            <input type="password" name="cpwd" id="cpwd" onchange ="passwordCheck();" required autocomplete="off"/>
          </div>
          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Phone Number<span class="req">*</span>
            </label>
            <input type='tel' pattern='\d{10}' name="phone" id="phone" onchange = "patternMismatch();"required autocomplete="off"/>
          </div>
            
          <button type="submit" class="button button-block">Get Started</button>
          
          </form>

        </div>

        <div id="login">   
          
          <form action="LoginServlet" method="post">
          
            <div class="field-wrap">
            <label>
              username<span class="req">*</span>
            </label>
            <input type="text" name="uname" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required name="pwd" autocomplete="off"/>
          </div>
          
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
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
    	window.alert("User Registered");
    	</script>
    	
    	<%request.setAttribute("status", null);
    }
    else if(status.equals("exists"))
    {
    	%><script type="text/javascript">
    	window.alert("Username already exists");
    	</script>
    	<%
    	request.setAttribute("status", null);
    }
    else if(status.equals("password mismatch"))
    {
    	%><script type="text/javascript">
    	window.alert("Password mismatch");
    	</script>
    	<%
    	request.setAttribute("status", null);
    }
    else if(status.equals("login failure"))
    {
    	%><script type="text/javascript">
    	window.alert("Usename or password doesn't exist");
    	</script>
    	<%
    	request.setAttribute("status", null);
    }
    }%>
    
    
  </body>
</html>

<!DOCTYPE html>
<%@page import="com.models.UserDetails"%>
<%@page import="java.util.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Learner Home Page</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style1.css">

    <%UserDetails user=(UserDetails)session.getAttribute("user"); 
    %>
    
<script type="text/javascript">
function frequentOperation()
{
	document.getElementById('myForm').action = 'frequent.jsp';
	document.getElementById('freq-div').innerHTML="<label>Enter the frequent word<span class='req'>*</span></label><input type='text' id='freq-inp' name='k-word' required autocomplete='off'/>";	
}

</script>
    
  </head>

  <body>

    <div class="form">
      
      <h1>Welcome <%=user.getFirstName() %></h1>
      <p class="forgot"><a id="logout" href='LogOutServlet' onclick="invalidateSession();">Log Out</a></p>
      <p class="forgot1"><a href='change_password.jsp'>Change Password</a></p>
        <div id="signup">   
          
          <form id="myForm" action="animation.jsp" method="post">
          
          
            <div class="field-wrap">
              <label>
                Enter the Stream<span class="req">*</span>
              </label>
              <textarea name="data-stream" rows="10" cols="50" required></textarea>
            </div>
        
           <div class="field-wrap" >
              <label>
                Enter the minimum frequency<span class="req">*</span>
              </label>
              <input type="number" id="k-div" name="k-value" required autocomplete="off"/>
            </div>
   			
   			<div class="field-wrap" id="freq-div">
            </div>
   			
             <div class="field-wrap">
              <label>
                Choose one operation<span class="req">*</span>
                </label>
            </div>
            <div class="radios">
				Majority Check<input type="radio" name="option" value="majority" onchange="document.getElementById('myForm').action = 'majority.jsp'; document.getElementById('k-div').disabled=true;document.getElementById('freq-inp').disabled=true;">
				View Animation<input type="radio" name="option" value="anim" onchange="document.getElementById('myForm').action = 'animation.jsp';document.getElementById('k-div').disabled=false;document.getElementById('freq-inp').disabled=true;" checked>
				Frequent Word Check<input type="radio" name="option" value="freq" onchange="frequentOperation();document.getElementById('k-div').disabled=false;"/>              
            </div>
          <button type="submit" class="button button-block">Start Simulation</button>
          
          </form>

        </div>
        
		
        
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
	
  </body>
</html>

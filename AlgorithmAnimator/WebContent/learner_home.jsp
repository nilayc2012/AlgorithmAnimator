<!DOCTYPE html>
<%@page import="com.models.UserDetails"%>
<%@page import="java.util.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Learner Home Page</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style.css">

    <%UserDetails user=(UserDetails)session.getAttribute("user"); 
    %>
    

    
  </head>

  <body>

    <div class="form">
      
      <h1>Welcome <%=user.getFirstName() %></h1>
        <div id="signup">   
          
          <form action="animation.jsp" method="post">
          
          
            <div class="field-wrap">
              <label>
                Enter the Stream<span class="req">*</span>
              </label>
              <textarea name="data-stream" rows="10" cols="50" required></textarea>
            </div>
        
           <div class="field-wrap">
              <label>
                Enter the minimum frequency<span class="req">*</span>
              </label>
              <input type="number" name="k-value" required autocomplete="off"/>
            </div>
   
          
            
          <button type="submit" class="button button-block">Start Simulation</button>
          
          </form>

        </div>
        
		
        
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
   
  </body>
</html>

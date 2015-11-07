<!DOCTYPE html>
<%@page import="com.models.UserDetails"%>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Learner Home Page</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style.css">

    <%UserDetails user=(UserDetails)request.getAttribute("user"); 
    
    
    %>
<script type="text/javascript" src="js/anim.js"></script>
  </head>

  <body>

    <div class="form">
      
      <h1>Welcome <%=user.getFirstName() %></h1>

      
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
    
  </body>
</html>

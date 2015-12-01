<!DOCTYPE html>
<%@page import="java.util.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Algorithm Animator</title>
    
    
    <link rel="stylesheet" href="css/normalize2.css">

    
        <link rel="stylesheet" href="css/style2.css">

    
        <script src="js/angular.js"></script>
<script src="js/angular-animate.js"></script> 
    <script src="js/majority.js"></script>
  </head>

  <body>
  <% String stream = request.getParameter("data-stream");
		
		stream=stream.replaceAll("[^a-zA-Z]+"," ");
		stream=stream.replaceAll("\\s+", " ");
	String[] streamArray =stream.split(" ");
	int freq=streamArray.length/2;
	int k =streamArray.length/freq;
	int i=0;
%>
<div>
	<div class="stream" id="stream">
	<%for(String str : streamArray)
	{%><span id="strings" class="stream-string" >
	<%=str%>
	</span>
	<%i++;}%></div>
	<br/>
    <div class="loader">
    <div id="final-display"></div>
    
    <div id="state">
    	<div class="asso" style="color: #0AF71E">First Pass</div>
    	<div>
    		<div class="asso">Associative Array</div>
    		<%for(int j=0;j<=k-2;j++){ 
    				if(j==5)
    				{
    					%><br/><br/><%
    				}
    			%>
		  		<div class="loader-block" id="array<%=j%>"></div>
			<%} %>	  
	</div>
	
	<div>
		<div class="counter">Counter</div>
		<%for(int h=0;h<=k-2;h++){ 
			  if(h==5)
			    {
			    	%><br/><br/><%
			    }
		
		%>
		<div class="loader-block1" id="counter<%=h%>"></div>
	  	<%} %>	
	</div>
	</div>
	<div><div id="final-output"></div>
	<div class="button-class"><div id="new-button"></div></div><button type="submit" class="button-block" id="mybutton" onclick="runMajority('<%=stream%>','<%=freq%>');">Check Majority</button>        
	</div>
	</div>
</div>
    

    
    
    
  </body>
</html>

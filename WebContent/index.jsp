

    <html data-ng-app="indexApp" >
    <head>
      <!-- SPELLS -->
      <!-- load angular and angular route via CDN -->
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular-route.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" data-integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" data-crossorigin="anonymous"></script>
     
      <script src="${pageContext.servletContext.contextPath}/scripts/index.js"></script>
      <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/scripts/jquery.leanModal.min.js"></script>
      <!-- SCROLLS -->
      <!-- load bootstrap and fontawesome via CDN -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" data-integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" data-crossorigin="anonymous">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" data-integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" data-crossorigin="anonymous">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-filestyle/1.2.1/bootstrap-filestyle.js"></script>
    
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/header.css">
      <link rel="stylesheet" type="text/css" media="all" href="${pageContext.servletContext.contextPath}/css/style.css">
	  
    </head>
    <body style="min-height: 570px;" >

        <!-- HEADER AND NAVBAR -->
        <header style="height: 30px;">
            <nav class="navbar navbar-default navbar-fixed-top">
	            <div class="container">
	                <div class="navbar-header">
	                    <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/index.jsp" style="color: #1C6F79; font-size: xx-large; ">ClicTest</a>
	                </div>
					
	                <ul class="nav navbar-nav navbar-right">
	                	 <li><a href="#loginmodal"  id="modaltrigger"> <i class="fa fa-user">  </i> Login</a></li>
	                    <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
	                    <li><a href="#about"><i class="fa fa-shield"></i> About</a></li>
	                    <li><a href="#contact"><i class="fa fa-comment"></i> Contact</a></li>
	                   <!--  <li><a href="#login"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign-In</a></li>
	                    <li><a href="#register"><i class="fa fa-user-plus" ></i>Register</a></li> -->
	                   
	                </ul>
	              	<div id="loginmodal" style="display: none;">
					    <h1 class="text-center" style="font-size: 30px; font-family: initial;font-weight: 900;  margin-bottom: 10px;">User Login</h1>
					    <form id="loginform"  data-ng-controller="loginController" data-ng-submit="submitLogin()">
					    	<fieldset>
					      <label for="username">Username:</label>
					      <input type="text"  value="infotree"  class="txtfield" tabindex="1" data-ng-model="username">
					      </fieldset>
					      <fieldset>
					      <label for="password">Password:</label>
					      <input type="password" value="infotree"  class="txtfield" tabindex="2" data-ng-model="password">
					      </fieldset>
					      <input type="submit"  class="flatbtn-blu hidemodal" value="Log-In" tabindex="3">
					      
					    </form>
				 	</div>
				</div>
            </nav>
            
            
        </header>
		<div id= "view" class="jumbotron text-center" data-ng-view  style="min-height: inherit;  max-height: inherit; max-width:100%; padding: 0px; margin: 0px;">
		
		 
		</div>
	
    </body>
    <script type="text/javascript">
		$(function(){
		  $('#loginform').submit(function(e){
		    return false;
		  });
		  
		  $('#modaltrigger').leanModal({  top: 150, overlay: 0.45, closeButton: ".hidemodal" });
		});
		
		
	</script>
   
    </html>
  <!DOCTYPE html>
    <html ng-app="mainApp">
    <head>
      <!-- SPELLS -->
      <!-- load angular and angular route via CDN -->
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular-route.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-sanitize.min.js"></script>
   
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script src="${pageContext.servletContext.contextPath}/scripts/script.js"></script>
      
      <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/common.js"></script>
     <%--  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/jquery-loading.js"></script> --%>
     <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/loading.js"></script>
      <!-- SCROLLS -->
      <!-- load bootstrap and fontawesome via CDN -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-filestyle/1.2.1/bootstrap-filestyle.js"></script>
       <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/header.css">
     
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/sidenav.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/loader.css">
	 
	  <link rel="stylesheet" type="text/css" media="all" href="${pageContext.servletContext.contextPath}/css/style.css">
	  <link rel="stylesheet" type="text/css" media="all" href="${pageContext.servletContext.contextPath}/css/dev_rj.css">
	
	 <%--  <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/scripts/jquery.leanModal.min.js"></script> --%>
	 
	
      
      
    </head>
    <body style="min-height: 570px;">
    	 <!-- HEADER AND NAVBAR -->
        <header style="height: 30px;">
            <nav class="navbar navbar-default navbar-fixed-top" >
            <div class="headcontainer">
                <div class="navbar-header"> 
                
                    <a class="navbar-brand"  href="${pageContext.servletContext.contextPath}/index.jsp" style="color: #1C6F79; font-size: xx-large; "><span>ClicTest</span></a>
                </div>
                <div > 
				    <ul class="nav navbar-nav navbar-right">
	                	 <li> <a href="#loginmodal"  id="modaltrigger"> <i class="fa fa-user">  </i> User</a></li>
	                </ul>
                 </div>
               </div>
            </nav>
        </header>
		
        <!-- MAIN CONTENT AND INJECTED VIEWS -->
        <div id="main" style="min-height: inherit;  max-height: inherit;">
        	
	
			<!-- {{ message }} -->
            <!-- angular templating -->
            <!-- this is where content will be injected -->
			<div id= "view" class="jumbotron text-center"  ng-view style="min-height: inherit;  max-height: inherit; max-width:100%; padding: 0px; margin: 0px;">
			
			
			</div>
        </div> 
        
    </body>
   
    
    </html>
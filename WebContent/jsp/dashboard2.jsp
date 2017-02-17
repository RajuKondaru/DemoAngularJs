  <!DOCTYPE html>
    <html ng-app="mainApp">
    <head>
      <!-- SPELLS -->
      <!-- load angular and angular route via CDN -->
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular-route.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-sanitize.min.js"></script>
   
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
      <script src="${pageContext.servletContext.contextPath}/scripts/script.js"></script>
      
      <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/common.js"></script>
       <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/jquery-loading.js"></script>
     <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/loading.js"></script>
      <!-- SCROLLS -->
      <!-- load bootstrap and fontawesome via CDN -->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/header.css">
     
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/sidenav.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/loader.css">
	 
	  <link rel="stylesheet" type="text/css" media="all" href="${pageContext.servletContext.contextPath}/css/style.css">
	
	  <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/scripts/jquery.leanModal.min.js"></script>
	 
	
      
      
    </head>
    <body >
    	 <!-- HEADER AND NAVBAR -->
        <header style="height: 30px;">
            <nav class="navbar navbar-default" style="z-index: inherit;">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/index.jsp" style="color: #1C6F79; font-size: xx-large; ">ClicTest</a>
                </div>
               
			    <ul class="nav navbar-nav navbar-right">
                	 <li> <a href="#loginmodal"  id="modaltrigger"> <i class="fa fa-user">  </i> User</a></li>
                </ul>
               </div>
            </nav>
        </header>
		<div class="menubar " >
			
			    <div class="dropdown" style="width: 50px; height: inherit;" onclick="openNav()"> 
			      <div id="slide" class="dropbtn" >
			      	<img alt="submenulist"  style="width: 50px; height: inherit;"  src="${pageContext.servletContext.contextPath}/img/menu-icon.png">
			      </div>   
			     </div>
			    
				<div class="dropdown" style=" height: inherit;" >
					  <div class="dropbtn">Mobile Manual</div>
					  <div class="dropdown-content">
					    <a href="#Web">Web</a>
					    <a href="#App">App</a>
					    
					  </div>
				</div>	
			    <div class="dropdown" style=" height: inherit;" >
					  <div class="dropbtn" >Mobile Automation</div>
					  <div class="dropdown-content">
					    <a href="#Web">Web</a>
					    <a href="#App">App</a>
					    <a href="#Hybrid">Hybrid</a>
					  </div>
				</div>
				
	    	
		</div>
		
        <!-- MAIN CONTENT AND INJECTED VIEWS -->
        <div id="main" style="min-height: inherit;  max-height: inherit;">
        	<div id="WebSidenav" class="sidenav" >
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><font style="text-align: center;">X</font></a>
			  <a href="#AddWebConfig" >Configurations</a>
			  <a href="#Devices" >Devices</a>
			  <!-- data-ng-click="getAllDevices();" -->
			  <a href="#RecordingMobileView">Recording</a>
			  <a href="#TestSuitePrepare">Test Suite Prepare</a>
			  <a href="#Execution">Execution</a>
			   <a href="#Reports">Reports</a>
			</div>
			<div id="ApkSidenav" class="sidenav" >
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><font style="text-align: center;">X</font></a>
			  <a href="#AddApkConfig">Configurations</a>
			  <a href="#Devices">Devices</a>
			  <a href="#ManualTest">Launch Device</a>
			  <a href="#">Execution</a>
			  <a href="#">Reports</a>
			</div>
	
			<!-- {{ message }} -->
            <!-- angular templating -->
            <!-- this is where content will be injected -->
			<div id= "view" class="jumbotron text-center"  ng-view style="min-height: inherit;  max-height: inherit; max-width:100%; padding: 0px; margin: 0px;">
			
			
			</div>
        </div> 
        
    </body>
   
    
    </html>
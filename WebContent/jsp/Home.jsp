  <!DOCTYPE html>
    <html data-ng-app="ClicApp">
    <head>
    
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular-route.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-sanitize.min.js"></script>
  
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.servletContext.contextPath}/css/rj.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>   

        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/common.js"></script>
      <!--  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/jquery-loading.js"></script>
         <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/scripts/jquery.leanModal.min.js"></script> -->
          <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
   
     <script type="text/javascript" src="${pageContext.servletContext.contextPath}/scripts/loading.js"></script>
      <!-- SCROLLS -->
     
	  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/modernizr.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.12/jquery.mousewheel.min.js"></script>
	   <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/scripts/jquery.leanModal.min.js"></script> 
	  <link data-require="bootstrap-css@*" data-semver="3.3.1" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
     
   <!--  <script src="${pageContext.servletContext.contextPath}/js/script.js"></script> -->
	
    <!--  <script src="${pageContext.servletContext.contextPath}/scripts/script.js"></script> -->
      
        <link rel="stylesheet" type="text/css" media="all" href="${pageContext.servletContext.contextPath}/testcss/default-blue-white.css">
	
      <!-- load bootstrap and fontawesome via CDN -->
      
      <!-- <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" /> -->
	 
	  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/loader.css">
	 
	  <link rel="stylesheet" type="text/css" media="all" href="${pageContext.servletContext.contextPath}/css/style.css">
	  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/angular/app.js">
		
		</script>
	 
	

  
	   
    </head>
    <body>
    <div class="dev-page dev-page-loaded dev-page-sidebar-minimized">
            
            <!-- page header -->    
            <div class="dev-page-header">
                
                <div class="dph-logo">
                    <a href="#">ClicTest</a>
                    <a class="dev-page-sidebar-collapse">
                        <div class="dev-page-sidebar-collapse-icon">
                            <span class="line-one"></span>
                            <span class="line-two"></span>
                            <span class="line-three"></span>
                        </div>
                    </a>
                </div>

                <ul class="dph-buttons pull-right">                    
                    <li class="dph-button-stuck">
                        <a href="#" class="dev-page-search-toggle">
                            <div class="dev-page-search-toggle-icon">
                                <span class="circle"></span>
                                <span class="line"></span>
                            </div>
                        </a>
                    </li>                    
                    <li class="dph-button-stuck">
                        <a href="#" class="dev-page-rightbar-toggle">
                            <div class="dev-page-rightbar-toggle-icon">
                                <span class="line-one"></span>
                                <span class="line-two"></span>
                            </div>
                        </a>
                    </li>
                </ul>                                                
                
            </div>
            <!-- ./page header -->
            
            <!-- page container -->
            <div class="dev-page-container">

                <!-- page sidebar -->
                <div class="dev-page-sidebar mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar mCS_disabled" style="height: 1696px;"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">                    
                    
                    <div class="profile profile-transparent">
                        <div class="profile-image">
                            <img src="${pageContext.servletContext.contextPath}/img/user_1.jpg" class="mCS_img_loaded">
                            <div class="profile-badges">
                                <a href="#" class="profile-badges-left"><i class="fa fa-mobile" style="font-size:30px;"></i> 243</a>
                                <a href="#" class="profile-badges-right"><i class="fa fa-pencil-square-o" style="font-size:24px"></i> 1,971</a>
                            </div>
                            <div class="profile-status online"></div>
                        </div>
                        <div class="profile-info">
                            <h4>Devin Stephens</h4>
                            <span>Test Engineer</span>
                        </div>                        
                    </div>
                    
                    <ul class="dev-page-navigation">
                        <li class="title">Navigation</li>
                        <li class="">
                            <a href="#"><i class="fa fa-desktop"></i> <span>Dashboard</span></a>
                        </li>                        
                        <li class="has-child">
                            <a href="#"><i class="fa fa-cog"></i> <span>New Test</span></a>
                            <ul>
                                <li class="has-child">
                                    <a href="#">Manual</a>
                                    <ul>
                                        <li><a href="#">Android</a>
		                                   <!--  <ul>
		                                        <li><a href="pages-email-inbox.html">Web App</a></li>
		                                        <li><a href="pages-email-compose.html">Native App</a></li>
		                                    </ul> -->
	                                    </li>
	                                    <li><a href="#">IOS</a>
		                                   <!--  <ul>
		                                        <li><a href="pages-email-inbox.html">Web App</a></li>
		                                        <li><a href="pages-email-compose.html">Native App</a></li>
		                                    </ul> -->
		                                </li>
                                    </ul>
                                </li>
                                <li class="has-child">
                                    <a href="#">Automation</a>
                                    <ul>
                                        <li><a href="#">Clic API</a>
		                                   <!--  <ul>
		                                        <li><a href="pages-email-inbox.html">Web App</a></li>
		                                        <li><a href="pages-email-compose.html">Native App</a></li>
		                                    </ul> -->
	                                    </li>
                                        <li><a href="#">Appium</a>
		                                   <!--  <ul>
		                                        <li><a href="pages-email-inbox.html">Web App</a></li>
		                                        <li><a href="pages-email-compose.html">Native App</a></li>
		                                    </ul> -->
		                                </li>
		                                <li><a href="#">Robotium</a>
		                                    <!-- <ul>
		                                        <li><a href="pages-email-inbox.html">Web App</a></li>
		                                        <li><a href="pages-email-compose.html">Native App</a></li>
		                                    </ul> -->
		                                </li>
                                    </ul>
                                </li>
                               <!--  <li class="has-child">
                                    <a href="#">Registration Forms</a>
                                    <ul>
                                        <li><a href="pages-registration.html" target="_blank">Registration</a></li>
                                        <li><a href="pages-registration-lite.html" target="_blank">Registration Lite</a></li>
                                    </ul>
                                </li>                                
                                <li><a href="pages-lock-screen.html">Lock Screen</a></li>                                
                                <li><a href="pages-session-timeout.html">Session Timeout</a></li>
                                <li><a href="pages-edit-profile.html">Edit Profile</a></li>
                                <li><a href="pages-profile.html">Profile</a></li>
                                <li><a href="pages-faq.html">FAQ</a></li>
                                <li><a href="pages-gallery.html">Gallery</a></li>
                                <li><a href="pages-tocify.html">Tocify</a></li>
                                <li><a href="pages-invoice.html">Invoice</a></li>
                                <li><a href="pages-error-404.html">Error 404</a></li>                                
                                <li><a href="pages-contacts.html">Contacts</a></li> -->
                            </ul>
                        </li>
                        <li>
                            <a href="features.html"><i class="fa fa-file-o"></i> <span>Reports</span></a>
                        </li>                        
                        <li >
                            <a href="#"><i class="fa fa-cube"></i> <span>Device Lab</span> </a>
                            
                        </li>       
                        
                        
                        
                        <li class="title">Components</li>
                        <li class="has-child">
                            <a href="#"><i class="fa fa-globe"></i> <span>UI Kits</span>  <span class="label label-danger">+1</span></a>
                            <ul>                                
                                <li><a href="ui-elements.html">UI Elements</a></li>
                                <li><a href="ui-widgets.html">Widgets <span class="label label-danger">New</span></a></li>
                                <li><a href="ui-buttons.html">Buttons</a></li>
                                <li><a href="ui-modals.html">Modals &amp; Popups</a></li>
                                <li><a href="ui-panels.html">Panels</a></li>
                                <li><a href="ui-typography.html">Typography</a></li>
                                <li><a href="ui-icons.html">Icons</a></li>
                                <li><a href="ui-tour.html">Tour</a></li>
                                <li><a href="ui-slide-menu.html">Sliding Menu</a></li>
                                <li><a href="ui-sliders.html">Sliders</a></li>
                                <li><a href="ui-nestable.html">Nestable List</a></li>
                                <li><a href="ui-tree-view.html">Tree View</a></li>
                                <li><a href="ui-language.html">Change Language</a></li>
                                <li class="has-child">
                                    <a href="#">Timeline</a>
                                    <ul>
                                        <li><a href="ui-timeline-simple.html">Simple Timeline</a></li>
                                        <li><a href="ui-timeline.html">Timeline</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="has-child">
                            <a href="#"><i class="fa fa-pencil"></i> <span>Forms</span> <span class="label label-danger">+1</span></a>
                            <ul>
                                <li><a href="form-elements.html">Form Elements</a></li>
                                <li><a href="form-layouts.html">Form Layouts</a></li>
                                <li><a href="form-wizard.html">Form Wizard</a></li>
                                <li><a href="form-validation.html">Form Validation &amp; Helpers</a></li>
                                <li><a href="form-editors.html">WYSIWYG Editors</a></li>
                                <li><a href="form-file-handling.html">File handling <span class="label label-danger">New</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="charts.html"><i class="fa fa-line-chart"></i> <span>Charts</span></a>
                        </li>
                        <li>
                            <a href="maps.html"><i class="fa fa-bug"></i> <span>Bug Report</span></a>
                             <ul>
                                <li><a href="tables-static.html"><i class="fa fa-random" aria-hidden="true"></i><span style="padding-left: 10px;">Jira</span></a></li>
                                <li><a href="tables-sortable.html">Bigzilla</a></li>
                               
                            </ul>
                        </li>
                        <li class="has-child">
                            <a href="#"><i class="fa fa-life-ring"></i> <span>Support</span></a>
                            <ul>
                                <li><a href="tables-static.html"><i class="fa fa-at" aria-hidden="true"></i><span style="padding-left: 10px;">Mail</span></a></li>
                                <li><a href="tables-sortable.html"><i class="fa fa-weixin" aria-hidden="true"></i><span style="padding-left: 10px;">Chat</span></a></li>
                                <li><a href="tables-other.html"><i class="fa fa-phone" aria-hidden="true"></i><span style="padding-left: 10px;">Call Us</span></a></li>
                            </ul>
                        </li>                        
                        <li class="has-child">
                            <a href="#"><i class="fa fa-code-fork"></i> <span>Multi-Level Navigation</span></a>
                            <ul>
                                <li><a href="#">Second Level</a></li>
                                <li class="has-child">
                                    <a href="#">Second Level</a>
                                    <ul>
                                        <li><a href="#">Third Level</a></li>
                                        <li><a href="#">Third Level</a></li>
                                        <li><a href="#">Third Level</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Second Level</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                </div>
                <div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 0px; max-height: 588px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
                <!-- ./page sidebar -->
                
                <!-- page content -->
                <div id="page-view" data-ng-view class="dev-page-content" >  
                 
                </div>
            	<!-- ./page container -->
            
            <!-- right bar -->
            <div class="dev-page-rightbar">
                <div class="rightbar-chat">

                    <div class="rightbar-chat-frame-contacts scroll mCustomScrollbar _mCS_2 mCS-autoHide mCS_no_scrollbar"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                        <div class="rightbar-title">
                            <h3>Messages</h3>
                            <a href="#" class="btn btn-default btn-rounded rightbar-close pull-right"><span class="fa fa-times"></span></a>
                        </div>
                        <ul class="contacts">
                            <li class="title">online</li>
                            <li>
                                <a href="#" class="status online">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_1.jpg" title="Aqvatarius" class="mCS_img_loaded"> John Doe                                            
                                </a>
                            </li>                                    
                            <li>
                                <a href="#" class="status online">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_2.jpg" title="Aqvatarius" class="mCS_img_loaded"> Shannon Freeman                                            
                                </a>
                            </li>
                            <li>
                                <a href="#" class="status away">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_3.jpg" title="Aqvatarius" class="mCS_img_loaded"> Devin Stephens                                            
                                </a>
                            </li>                                    
                            <li>
                                <a href="#" class="status away">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_4.jpg" title="Aqvatarius" class="mCS_img_loaded"> Marissa George                                           
                                </a>
                            </li>
                            <li>
                                <a href="#" class="status dont">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_5.jpg" title="Aqvatarius" class="mCS_img_loaded"> Sydney Reeves                                           
                                </a>
                            </li>
                            <li class="title">offline</li>
                            <li>
                                <a href="#" class="status">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_6.jpg" title="Aqvatarius" class="mCS_img_loaded"> Kaitlynn Bowen                                           
                                </a>
                            </li>
                            <li>
                                <a href="#" class="status">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_7.jpg" title="Aqvatarius" class="mCS_img_loaded"> Karen Spencer                                            
                                </a>
                            </li>
                            <li>
                                <a href="#" class="status">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_8.jpg" title="Aqvatarius" class="mCS_img_loaded"> Darrell Wolfe                                            
                                </a>
                            </li>                                    
                        </ul>
                    </div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>

                    <div class="rightbar-chat-frame-chat">
                        <div class="user">
                            <div class="user-panel">
                                <a href="#" class="btn btn-default btn-rounded rightbar-chat-close"><span class="fa fa-angle-left"></span></a>
                                <a href="#" class="btn btn-default btn-rounded pull-right"><span class="fa fa-user"></span></a>
                            </div>
                            <div class="user-info">
                                <div class="user-info-image status online">
                                    <img src="${pageContext.servletContext.contextPath}/img/user_1.jpg">
                                </div>
                                <h5>Devin Stephens</h5>
                                <span>UI/UX Designer</span>
                            </div>
                        </div>
                        <div class="chat-wrapper scroll mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar"><div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0"><div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                            <ul class="chat" id="rightbar_chat">
                                <li class="inbox">
                                    Hi, you have a second? Need to ask you something.
                                    <span>about 1h ago</span>
                                </li>                                    
                                <li class="sent">
                                    Sure i have...
                                    <span>59min ago</span>
                                </li>
                                <li class="inbox">
                                    It's about latest design you did...
                                    <span>14min ago</span>
                                </li>
                                <li class="sent">
                                    I will do my best to help you
                                    <span>2min ago</span>
                                </li>
                            </ul>
                        </div><div id="mCSB_3_scrollbar_vertical" class="mCSB_scrollTools mCSB_3_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_3_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>

                        <form class="form" action="#" method="post" id="rightbar_chat_form">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default"><i class="fa fa-paperclip"></i></button>
                                    </div>
                                    <input type="text" class="form-control" name="message">
                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default">Send</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
            <!-- ./right bar -->
            
            <!-- page footer -->    
            <div class="dev-page-footer dev-page-footer-fixed dev-page-footer-effect"> <!-- dev-page-footer-closed dev-page-footer-fixed -->
                <ul class="dev-page-footer-controls">
                    <li><a class="tip" title="" data-original-title="Settings"><i class="fa fa-cogs"></i></a></li>
                    <li><a class="tip" title="" data-original-title="Support"><i class="fa fa-life-ring"></i></a></li>
                    <li><a class="tip" title="" data-original-title="Logoff"><i class="fa fa-power-off"></i></a></li>
                   
                    <li class="pull-right">
                        <a class="dev-page-sidebar-minimize tip" title="" data-original-title="Toggle navigation" aria-describedby="tooltip570683"><i class="fa fa-indent"></i></a>
                       
                    </li>
                </ul>
                
                <!-- page footer buttons -->
                <ul class="dev-page-footer-buttons dev-page-footer-buttons-effect" style="width: 140px; margin-left: -70px;">                    
                    <li><a href="#footer_content_1" class="dev-page-footer-container-open"><i class="fa fa-database"></i></a></li>                    
                    <li><a href="#footer_content_2" class="dev-page-footer-container-open"><i class="fa fa-bar-chart"></i></a></li>
                    <li><a href="#footer_content_3" class="dev-page-footer-container-open"><i class="fa fa-server"></i></a></li>
                </ul>
                <!-- ./page footer buttons -->
                <!-- page footer container -->
                <div class="dev-page-footer-container">
                    
                    <!-- loader and close button -->
                    <div class="dev-page-footer-container-layer">
                        <a href="#" class="dev-page-footer-container-layer-button"></a>
                    </div>
                    <!-- ./loader and close button -->                    
                    
                    <!-- informers -->
                    <div class="dev-page-footer-container-content mCustomScrollbar _mCS_4 mCS-autoHide" id="footer_content_1" style="width: 1366px;"><div id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_horizontal mCSB_inside" tabindex="0"><div id="mCSB_4_container" class="mCSB_container" style="position: relative; top: 0px; left: -1px; width: 1px;" dir="ltr">                        
                        <div class="dev-list-informers">                            
                            <div class="dev-list-informers-item">
                                <div class="chart">
                                    <div style="display:inline;width:100px;height:200px;"><canvas width="100" height="200"></canvas><input class="knob" data-width="100" data-max="100" data-fgcolor="#E74E40" value="33" data-anglearc="250" data-angleoffset="-125" data-thickness=".1" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; background: none; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(231, 78, 64); padding: 0px; -webkit-appearance: none;"></div>
                                </div>
                                <div class="info">
                                    <h5>Disk Usage</h5>
                                    <p>Server #1 - <strong>235,4Gb / 500Gb</strong></p>
                                    <p>Server #2 - <strong>114,2Gb / 500Gb</strong></p>
                                    <p class="text-higlight">33% - Total disk usage</p>
                                </div>
                            </div>
                            
                            <div class="dev-list-informers-item">
                                <div class="chart">
                                    <div style="display:inline;width:100px;height:200px;"><canvas width="100" height="200"></canvas><input class="knob" data-width="100" data-max="100" data-fgcolor="#85d6de" value="75" data-thickness=".1" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; background: none; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(133, 214, 222); padding: 0px; -webkit-appearance: none;"></div>
                                </div>
                                <div class="info">
                                    <h5>Database Usage</h5>
                                    <p>Disk Space - <strong>64,3Gb / 100Gb</strong></p>
                                    <p>Accounts - <strong>12 / 30</strong></p>
                                    <p class="text-higlight">75% - Features usage</p>
                                </div>
                            </div>
                            
                            <div class="dev-list-informers-item">
                                <div class="chart">
                                    <div style="display:inline;width:100px;height:200px;"><canvas width="100" height="200"></canvas><input class="knob" data-width="100" data-max="100" data-fgcolor="#82b440" value="62" data-thickness=".1" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; background: none; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(130, 180, 64); padding: 0px; -webkit-appearance: none;"></div>
                                </div>
                                <div class="info">
                                    <h5>Memory Usage</h5>
                                    <p>Total - <strong>2048Mb</strong></p>
                                    <p>Cached - <strong>1291Mb</strong></p>
                                    <p>Available - <strong>757Mb</strong></p>
                                </div>
                            </div>                            
                        </div>                        
                    </div><div id="mCSB_4_scrollbar_horizontal" class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_horizontal" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_4_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 30px; width: 0px; left: 0px; display: block;" oncontextmenu="return false;"><div class="mCSB_dragger_bar"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
                    <!-- ./informers -->
                    
                    <!-- informers -->
                    <div class="dev-page-footer-container-content mCustomScrollbar _mCS_5 mCS-autoHide" id="footer_content_2" style="width: 1366px;"><div id="mCSB_5" class="mCustomScrollBox mCS-light mCSB_horizontal mCSB_inside" tabindex="0"><div id="mCSB_5_container" class="mCSB_container" style="position: relative; top: 0px; left: -1px; width: 1px;" dir="ltr">                        
                        <div class="dev-list-informers">                            
                            <div class="dev-list-informers-item dev-list-informers-item-extended">
                                <div class="chart">
                                    <span class="sparkline" sparktype="bar" sparkbarcolor="#82b440" sparkwidth="150" sparkheight="100" sparkbarwidth="15"><canvas width="191" height="100" style="display: inline-block; width: 191px; height: 100px; vertical-align: top;"></canvas></span>
                                </div>
                                <div class="info">
                                    <h5>Visitors</h5>
                                    <p>New - <strong>722</strong></p>
                                    <p>Returned - <strong>230</strong></p>
                                    <p class="text-higlight">Total - <strong>952</strong></p>
                                </div>
                            </div>                            
                            
                            <div class="dev-list-informers-item dev-list-informers-item-extended">
                                <div class="chart">
                                    <span class="sparkline" sparkfillcolor="#85d6de" sparklinewidth="2" sparklinecolor="#85d6de" sparkwidth="200" sparkheight="100"><canvas width="200" height="100" style="display: inline-block; width: 200px; height: 100px; vertical-align: top;"></canvas></span>
                                </div>
                                <div class="info">
                                    <h5>Sales</h5>
                                    <p>Total Sales - 35</p>
                                    <p>Rate - 25</p>
                                    <p class="text-higlight">Ratio - <strong>75%</strong></p>
                                </div>
                            </div>
                            
                            <div class="dev-list-informers-item">
                                <div class="chart">
                                    <span class="sparkline" data-sparktype="pie" sparkwidth="100" sparkheight="100"><canvas width="100" height="100" style="display: inline-block; width: 100px; height: 100px; vertical-align: top;"></canvas></span>
                                </div>
                                <div class="info">
                                    <h5>User Stats</h5>
                                    <p>Registrated - 1,522</p>
                                    <p>Not active - 316</p>
                                    <p class="text-higlight">Total - <strong>1,838</strong></p>
                                </div>
                            </div>                            
                        </div>                        
                    </div><div id="mCSB_5_scrollbar_horizontal" class="mCSB_scrollTools mCSB_5_scrollbar mCS-light mCSB_scrollTools_horizontal" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_5_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 30px; width: 0px; left: 0px; display: block;" oncontextmenu="return false;"><div class="mCSB_dragger_bar"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
                    <!-- ./informers -->
                    
                    <!-- projects -->
                    <div class="dev-page-footer-container-content mCustomScrollbar _mCS_6 mCS-autoHide" id="footer_content_3" style="width: 1366px;"><div id="mCSB_6" class="mCustomScrollBox mCS-light mCSB_horizontal mCSB_inside" tabindex="0"><div id="mCSB_6_container" class="mCSB_container" style="position: relative; top: 0px; left: -1px; width: 1px;" dir="ltr">                        
                        <ul class="dev-list-projects">
                            <li><a href="#" class="active">Intuitive</a></li>
                            <li><a href="#">Atlant</a></li>
                            <li><a href="#">Gemini</a></li>
                            <li><a href="#">Taurus</a></li>
                            <li><a href="#">Leo</a></li>
                            <li><a href="#">Aries</a></li>
                            <li><a href="#">Virgo</a></li>
                            <li><a href="#">Aquarius</a></li>
                            <li><a href="#" class="dev-list-projects-add"><i class="fa fa-plus"></i></a></li>
                        </ul>                        
                    </div><div id="mCSB_6_scrollbar_horizontal" class="mCSB_scrollTools mCSB_6_scrollbar mCS-light mCSB_scrollTools_horizontal" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_6_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 30px; display: block; width: 0px; max-width: 1356px; left: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
                    <!-- ./projects -->
                </div>
                <!-- ./page footer container -->
                
                <ul class="dev-page-footer-controls dev-page-footer-controls-auto pull-right">
                    <li><a class="dev-page-footer-fix tip" title="" data-original-title="Fixed footer"><i class="fa fa-thumb-tack"></i></a></li>
                    <li><a class="dev-page-footer-collapse dev-page-footer-control-stuck"><i class="fa fa-dot-circle-o"></i></a></li>
                </ul>
            </div>
            <!-- ./page footer -->
            
            <!-- page search -->
            <div class="dev-search">
                <div class="dev-search-container">
                    <div class="dev-search-form">
                    <form action="index.html" method="post">
                        <div class="dev-search-field">
                            <input type="text" placeholder="Search..." value="Nature">
                        </div>                        
                    </form>
                    </div>
                    <div class="dev-search-results"></div>
                </div>
            </div>
            <!-- page search -->            
        </div>
        <!-- javascript -->
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>       
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
        
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.mCustomScrollbar.min.js"></script>        
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/moment.js"></script>
        
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.knob.min.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.sparkline.min.js"></script>
        
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/bootstrap-select.js"></script>
        
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/d3.min.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/nv.d3.min.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/stream_layers.js"></script>
        
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/waypoints.min.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.counterup.min.js"></script>        

        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/dev-loaders.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/dev-layout-default.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/demo.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/dev-app.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/demo-dashboard.js"></script>
        <!-- ./javascript -->
    
    
	<div class="nvtooltip xy-tooltip nv-pointer-events-none" id="nvtooltip-8517" style="top: 0px; left: 0px; opacity: 0; transform: translate(487px, 320px) !important;">
			<table>
				<thead>
					<tr>
						<td colspan="3"><strong class="x-value">63</strong></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="legend-color-guide">
							<div style="background-color: rgb(52, 73, 94);"></div>
						</td>
						<td class="key">Returns</td>
						<td class="value">3.1</td>
					</tr>
				</tbody>
		</table>
	</div>
	</div>
</body>
 <script type="text/javascript">
 
 $('a').tooltip();

 
 </script>
</html>

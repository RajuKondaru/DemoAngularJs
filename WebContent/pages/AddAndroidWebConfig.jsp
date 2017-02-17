<!-- AddWebPage.jsp -->
 <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/table.css">
	<div  id= "container" style=" height: inherit; ">
    			
				<div  style="margin: 20px auto auto auto; padding: 20px; width: 80%; height: 20%; ">
					<P align="left" style="margin: 20px 0px 30px 0px !important; ">Register Mobile Website</P>	
					 <div  style="padding: 20px; height: 180px; border-radius: 10px;  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" >		
					  
						<form style="padding: 10px;" name="saveWebConfigData"  data-ng-controller="addWebConfigController" data-ng-submit="submitForm()">
						<div  style=" float: left;">
							<fieldset  style="float: left; padding: 10px !important;">
								<legend> Web URL </legend>
								<input type="text" value="http://www.clictest.com" class="form-control" data-ng-model="web.url">
							</fieldset>
							<fieldset style="float: left; padding: 10px !important;">
								<legend>Name</legend>
								<input type="text" value="Clictest" class="form-control" data-ng-model="web.name">
							</fieldset>
							<fieldset style="float: left; padding: 10px !important;">
								<legend>Version</legend>
								<input type="text" value="1.0" class="form-control" data-ng-model="web.version">
							</fieldset>
							
							
						</div>
						
						<div  style="padding-top: 40px;">
							<input class= "dropbtn"  name="Register" value="Register" type="submit" style="padding: 10px; text-decoration: none; line-height: normal;" ></input>
						</div>
					</form>
					</div>	
				</div>
   				<br>
				<!-- <hr style="height: 10px; border: 0;	box-shadow: 0 10px 10px -10px #8c8b8b inset; "> -->
				<hr style=" border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); ">
				<div  style="margin: 10px auto;  width: 90%; height: inherit; ">
					
					
						<div class="container" >
							<div class="row">
								<h4 style="padding-left: 20px; float: left;">List of all registered mobile websites </h4>
						        <div class="form-group" >
						            <div class="col-sm-12 col-md-12 col-lg-12">
						            
						                <input  class="form-control" id="search" type = "text" ng-model = "webname" placeholder="Search Configuration">
						            </div>
						        </div>
						    </div>
						    <div class="row"  style="margin-top: 30px;">
						        <div class="form-group">
						            <div class="searchable-container">
						                <div  class="items col-xs-5 col-sm-5 col-md-3 col-lg-3 " data-ng-repeat="webConfig in webConfigs | filter: webname" >
											
											<div class="info-block block-info clearfix" style="float:left; width:100%;"> 
												<div class="square-box pull-left">
													<span class="glyphicon glyphicon-tags glyphicon-lg"></span>
												</div> 
												<div data-toggle="buttons" class="btn-group bizmoduleselect"> 
													<label class="btn btn-default">
														<div class="bizcontent" style="overflow: hidden;">
															<input type="checkbox" name="var_id[]" autocomplete="off" value="{{webConfig.webname}}">
															<span class="glyphicon glyphicon-ok glyphicon-lg">
															</span>
															
															<div>
																<i>{{webConfig.webname}}</i><br>
																<i>{{webConfig.weburl}}</i><br>
																<i>{{webConfig.webversion}}</i>
																
																
															</div>
															
														</div>
													</label>
												</div>
											</div>
											
								
						                </div>
						        
						            </div>
						        </div>
							</div>
						</div>
					
					
					
						
					
					<div style="  margin-top:20px; margin-bottom:50px; ">
					 	<a href="#Devices" >
						<input  class="dropbtn" name="next" value="Next" type="submit" style="padding:10px; width:100px; text-decoration: none; line-height: normal;" ></input>
						</a>
					</div>
				</div>
				
		

    </div>

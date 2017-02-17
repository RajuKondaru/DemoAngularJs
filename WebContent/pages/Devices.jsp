<!-- Web.jsp -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div  id= "devices" style=" height: 100%; margin-left: 150px; margin-right: 150px; overflow: hidden; ">
		<h3>Devices</h3> 
		<span style="float: left; padding-left: 100px; padding-top: 10px;">Andriod ::  </span>
		
		<div style=" text-align:left; padding-top: 25px; max-width: 100%; padding-left: 210px; font-size: 18px; font-weight: 300;">
		<form role="form" style="line-height: normal;"  >
			<label  class="radio-inline"  >
				<a href="#Devices" style="color: black; background: none; text-decoration: none;"><input type="radio" style="display: none;" name="optradio" ng-model="selectedOs" value="Android"/> All </a> </input>
				<!-- <span ></span> -->
			</label>
			<label  class="radio-inline" data-ng-repeat="device in devices |orderBy : 'deviceOsVersion'" for="{{device.deviceOsVersion}}">
				<input type="radio" id="{{device.deviceName}}"  name="optradio" ng-model="$parent.selectedVersion" ng-value="device.deviceOsVersion" > {{device.deviceOsVersion}} </input>
			</label>
			
			</form>
		</div>	
		<hr style=" border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); ">
		
		<div class="container" >
			<div class="row">
				<h4 style="padding-left: 20px;">List of all devices in ClicMobile Data Center </h4>
		        <div class="form-group" >
		            <div class="col-sm-12 col-md-12 col-lg-12">
		            <!-- type="search" -->
		                <input  class="form-control" id="search" type = "text" ng-model = "deviceName" placeholder="Search Sevice">
		            </div>
		        </div>
		    </div>
		    <div class="row"  style="margin-top: 30px;">
		        <div class="form-group">
		            <div class="searchable-container">
		                <div  class="items col-xs-5 col-sm-5 col-md-3 col-lg-3 "  id= "{{device.deviceName}}" data-ng-controller="deviceController" data-ng-click="getDataFromServer($event);" data-ng-repeat="device in devices | orderBy : 'deviceOsVersion' | filter: deviceName ">
							
							<div class="info-block block-info clearfix" style="float:left; width:100%;"> 
								<div class="square-box pull-left">
									<span class="glyphicon glyphicon-tags glyphicon-lg"></span>
								</div> 
								<div data-toggle="buttons" class="btn-group bizmoduleselect"> 
									<label class="btn btn-default">
										<div class="bizcontent" style="overflow: hidden;">
											<input type="checkbox" name="var_id[]" autocomplete="off" value="{{device.deviceName}}">
											<span class="glyphicon glyphicon-ok glyphicon-lg">
											</span>
											<!-- <a href="#GetDevice" style="text-decoration: none;">  -->
											<div style="padding-top: 20px;">
												<img id= "{{device.deviceName}}" name= "{{device.deviceName}}"   width="75" height="140" alt="{{device.deviceName}}" ng-src="${pageContext.servletContext.contextPath}/img/{{device.deviceName}}.png" > 
											</div>
											<div>
												<i>{{device.deviceName}}</i><br>
												<i>{{device.deviceOsVersion}}</i><br>
												<i>{{device.deviceStatus}}</i>
												
												
											</div>
											<!-- </a> -->
										</div>
									</label>
								</div>
							</div>
							
				
		                </div>
		        
		            </div>
		        </div>
			</div>
		</div>
		
		
		
		
	</div>
	
	
	
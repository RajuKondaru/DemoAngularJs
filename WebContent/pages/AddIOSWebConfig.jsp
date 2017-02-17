<!-- AddWebPage.jsp -->
 <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/table.css">
	<div  id= "container" style=" height: inherit;  ">
    			<h2 align="center">Configure New Web URL </h2>
				<div style="margin: 10px auto auto auto;  width: 60%; height: 50%; ">
				<form name="saveWebConfigData"  data-ng-controller="addWebConfigController" data-ng-submit="submitForm()">
					<div >
						<fieldset style="float: left;">
							<legend> Web URL </legend>
							<input type="text" value="http://www.clictest.com" class="form-control" data-ng-model="web.url">
						</fieldset>
						<fieldset style="float: left;">
							<legend>Name</legend>
							<input type="text" value="Clictest" class="form-control" data-ng-model="web.name">
						</fieldset>
						<fieldset>
							<legend>Version</legend>
							<input type="text" value="1.0" class="form-control" data-ng-model="web.version">
						</fieldset>
						
						
					</div>
					
					<div align="center" style="  margin-top:20px;  ">
						<input class= "dropbtn"  name="Register" value="Register" type="submit" style="padding: 18px; text-decoration: none; line-height: normal;" ></input>
					</div>
				</form>
				</div>
   			
				<!-- <hr style="height: 10px; border: 0;	box-shadow: 0 10px 10px -10px #8c8b8b inset; "> -->
				<hr style=" border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); ">
				<div  style="margin: 10px auto;  width: 80%; height: inherit; ">
					<h2 align="center">Url Configurations </h2>
					<div>
						<table >
						  <thead>
						    <tr>
						      <th></th>
						      <th>Version</th>
						      <th>Name</th>
						      <th>Url Description</th>
						    </tr>
						  </thead>
						  <tbody >
						    <tr data-ng-repeat="webConfig in webConfigs track by $index"  >
						     <td><input type="radio" onselect="" ></td>
						      <td>{{webConfig.webversion}}</td>
						      <td>{{webConfig.webname}}</td>
						      <td>{{webConfig.weburl}}</td>
						    </tr>
						    
						  </tbody>
						</table>
					
					</div>
					<div align="right" style="  margin-top:20px; margin-right:150px; ">
					 <a href="#Devices" >
						<input  class="dropbtn" name="Next" value="next" type="submit" style="width:100px; text-decoration: none; line-height: normal;" ></input>
					</a>
					</div>
				</div>
				
		

    </div>

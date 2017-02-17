<!-- Web.jsp -->
	<div>
		<h1 style="padding-top: 50px; margin-top: 0px;">TestSuite Page</h1>
		<p>{{ message }}</p>
	</div>	
	<div style="border: solid;">
		<h2 align="center">Create New TestSuite </h2>
				<div style="margin: 10px auto auto auto;  width: 60%; height: 50%; ">
				<form name="saveWebConfigData"  data-ng-controller="addWebConfigController" data-ng-submit="submitForm()">
					<div >
						<fieldset style="float: left; padding: 18px;">
							<label> TestSuite Name </label>
							<input type="text" class="form-control" data-ng-model="web.url">
						</fieldset>
						<fieldset style="float: left; padding: 18px;">
							<label>Add TestCases</label>
							<select  name="testcases" class="form-control" multiple="multiple">
								<option value="volvo">Volvo</option>
								<option value="saab">Saab</option>
								<option value="mercedes">Mercedes</option>
								<option value="audi">Audi</option>
							</select>
						</fieldset>
						<fieldset style="float: left; padding: 18px;">
						<input class= "dropbtn"  name="create_testsuite" value="Create" type="submit" style=" width: 100px; margin-top: 50px; text-decoration: none; line-height: normal;" ></input>
						</fieldset>
						
					</div>
					
				</form>
				</div>
				
	
	</div>
	<div></div>

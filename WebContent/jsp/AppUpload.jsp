

				 <div class="container"  style="max-width: inherit;max-height: inherit;padding-top: 50px;padding-right: 50px;padding-left: 50px; " >  
				   <div  id="tabs" class="widget-tabbed" style="height: 350px;">
	                                    <ul class="widget-tabs widget-tabs-three">
	                                        <li  id="Web" class="active"  onMouseOver="this.style.cursor='hand';" onMouseOut="this.style.cursor='pointer';"><a > <span style="font-size: 18px;">Web</span></a></li>                                        
	                                        <li  id="App" onMouseOver="this.style.cursor='hand';" onMouseOut="this.style.cursor='pointer';"><a ><span style="font-size: 18px;">Apk/Ipa</span></a></li>                                        
	                                    </ul>  
	                                                                      
	                                    <div class="widget-tab active" id="web" style="height: inherit;">
	                                                                           
	                                        <div class="container" style="padding: 25px 250px;">
	                                        	<form class="form-horizontal">
												    <div class="form-group">
												      <label class="control-label col-sm-2" for="email">Web Name:</label>
												      <div class="col-sm-10">
												        <input type="text" class="form-control" id="webname" data-ng-model="webname"placeholder="Enter Web Name">
												      </div>
												    </div>
												    <div class="form-group">
												      <label class="control-label col-sm-2" for="pwd">URL:</label>
												      <div class="col-sm-10">          
												         <input class="form-control " id="webname" type="text" data-ng-model="weburl" placeholder="Enter Test Url">
												      </div>
												    </div>
												    <div class="form-group">
												      <label class="control-label col-sm-2" for="pwd">Version:</label>
												      <div class="col-sm-10">          
												        <input type="text" class="form-control" id="version" data-ng-model="webversion" placeholder="Enter Web version">
												      </div>
												    </div>
												   
												    <div class="form-group">        
												      <div class="col-sm-offset-2 col-sm-10">
												        <span class="btn btn-primary btn-file" style="float: right;" ng-click="submitForm()" ng-controller='addWebConfigController'>Save</span>
												      </div>
												    </div>
												  </form>
												
											 </div>
											
	                                    </div>
	                           			
										<div class=" widget-tab " id="app" style="height: inherit;">
											
											
										    <div class="container" style="padding: 25px 250px;">
										    	<form class="form-horizontal">
												    <div class="form-group">
												      <label class="control-label col-sm-2" for="email">App Name:</label>
												      <div class="col-sm-10">
												        <input type="text" class="form-control" id="appname" data-ng-model="appname"placeholder="Enter App Name">
												      </div>
												    </div>
												    
												    <div class="form-group">
												      <label class="control-label col-sm-2" for="pwd">Version:</label>
												      <div class="col-sm-10">          
												        <input type="text" class="form-control" id="appversion" data-ng-model="appversion" placeholder="Enter App version">
												      </div>
												    </div>
												   
												    <div class="form-group">        
												      <div class="col-sm-offset-2 col-sm-10">
												        <div class="fileupload fileupload-new" data-provides="fileupload" >
															    <input id='appfile' type="file" class="filestyle" name="file" data-buttonName="btn-primary">
															    
															    
															  </div>
												      </div>
												    </div>
												  </form>
												
											    <div class="row" >
						                            <div class="col-md-12">
							                            <div id="kv-error-2" style="margin-top:10px;display:none"></div>
							
														<div id="kv-success-2" class="alert alert-success fade in" style="margin-top:10px;display:none"></div>
							                            
							                            <div id="message" style="margin: 10px;"></div>
							                            <div class="progress" style="display: none; width: 50%; margin: auto;">
															<div id='progressbar' class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:10%"></div>
															</div>
														    <div  id="appview" "></div>
						                            </div>
						                       </div>
											 </div>
										 
										</div>
 										
                                   
									</div>
			</div>
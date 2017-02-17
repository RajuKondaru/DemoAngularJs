
	<div align="center"  >
		<div  style="float: left; width:33%;height: inherit; " ><p>{{device.deviceName}}</p></div>
	  	
		<div  style="float: left; width:34%; height: inherit;" >
				<div  id="deviceView" onload="myFunction();" class="colors"  style="border: 2px solid black; overflow: hidden; margin-top:35px; max-width: 274px;  height: 510px;">
					<div id ="msg" style="top: 45%; position: relative; ">
						<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><br>
						<span id="loading" class="sr-only" style=" position: relative; " >Loading...</span>
						<span id="preparing" class="sr-only" style=" position: relative; display: none;" >Preparing Device</span>
						<span id="waiting" class="sr-only" style=" position: relative;display: none; " >Please wait a moment</span>
						
					</div>
					
					<iframe id="deviceFrame" scrolling="no" ng-src="{{trustSrc(device.deviceUrl)}}" style="border: 0px none; height: 672px; z-index:1000; margin-top: -30px; width: 270px; display: none;" onload="loadFrame(this);">
					
					</iframe>
					
				</div>
				<p>{{device.deviceName}}</p>
		</div>
	    <div  style=" float: left; width:33%; margin-top:20px; height: inherit; ">
					 <a href="#TestSuitePrepare" >
						<input  class="dropbtn" name="stop_recording" value="Stop" type="submit" style="width:100px; text-decoration: none; line-height: normal;" ></input>
					</a>
					
		</div>
	    
	</div>
	 
	 

	
	

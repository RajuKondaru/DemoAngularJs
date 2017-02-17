"use strict";
angular.module("clientApp").directive("devicePickerNew",function(){
	return{
		templateUrl:"/views/devices/device-picker-new.html",
		restrict:"E",
		scope:{
			app:"=",
			planType:"@",
			automationType:"@",
			onlyViewable:"=",
			globalDescriptorsUsed:"=",
			control:"=",
			selectedDevices:"=",
			multiSelection:"=",
			openable:"@",
			openableWithLink:"@",
			openDeviceCallback:"=",
			clickable:"=",
			runnable:"=",
			finishCallback:"=",
			toggleDeviceCallback:"=",
			updateDeviceMinuteStatsCallback:"=",
			stickyBarHidden:"@",
			appiumSupportIndicated:"@",
			infiniteScrollContainer:"@",
			deviceLimitReached:"=",
			realDeviceLabelHidden:"=",
			privateDevicesExcluded:"="
				},
		controller:["$controller","$scope","$routeParams","$q","$timeout","$interval","$modal","DeviceDescriptor","DevicePool","App","Payment","Mixpanel",function(e,i,t,n,o,r,l,c,a,s,d,u){
			function f(e){
				e&&(Ci.app(),Pi.app.resolve(e))
				}
			function v(e){
				if(e&&e.length){
					Ci.selectedDevices();
					var i=angular.copy(e);
					Pi.selectedDeviceDescriptorIds.resolve(i)
					}
				}
			function p(e){
				_.each(Ti.all,function(i){
					i.$disabled=i.$accessDenied||i.$appiumWebAppTestingUnsupported||i.$apiLevelUnsupported||e,i.$disabledMessageType=V(i,e)
					})
					}
			function D(e){
				var t,n,o,l;
				ki||(t=e.app.platform,n=e.app.minSdkLevel,o=!e.bonusMinutesRemaining,l=e.flatRatePurchased),ui(o,l),g(e.deviceDescriptors,e.freeDeviceDescriptorIds,t,n,o,l),T(Ti.all,e.popularityRegions),fi(),Mi&&(y(Ti.all),bi=r(function(){
					y(Ti.all)},_i)),i.platform=t
					}
			function h(){
				n.all(Ui).then(D)
				}
			function g(e,t,n,o,r,l){
				var c=$(e,n),a=R(c),s=M(a,t,n,o,r,l),d=I(s);
				Ti.all=d,b(),ni(Ti.all,[]),i.deviceCount=Ti.all.length,Pi.selectedDeviceDescriptorIds.promise.then(function(e){
					ti(e,Ti.all),fi()
					})
					}
			function m(){
				i.searchText&&i.searchText.length||i.filters.activeCount||!i.filters.region.all?C():b()
						}
			function b(){
				Ti.filtered=Ti.all,A(Si)
				}
			function C(){
				var e=k(Ti.all);Ti.filtered=I(e),A(Si)
				}
			function S(){
				if(Ti.loaded&&Ti.filtered){
					if(Ti.loaded.length===Ti.filtered.length)
						return void(i.allDevicesLoaded=!0);
					i.allDevicesLoaded=!1,i.devicesLoading=!0,o(function(){
						A(Ti.loaded.length+Si),i.devicesLoading=!1
						},0)
						}
				}
			function $(e,t){
				if(ki||"WEB"===t&&"WEBDRIVER"===Ii)
					return i.allPlatformsSupported=!0,e;
				i.allPlatformsSupported=!1;
				var n=t;
				"WEB"===t&&"MANUAL"===Ai&&(n="ANDROID");
				var o=_.filter(e,function(e){
					return e.os===n
					});
				return o
				}
			function R(e){
				if(!yi)return e;
				var i=_.filter(e,function(e){
					return-1===e.id.indexOf("_citrix")&&-1===e.id.indexOf("_gsys")
					});
				return i
				}
			function k(e){
				var i=_.filter(e,function(e){
					return J(e)
					});
				return i
				}
			function A(e){
				Ti.loaded=_.first(Ti.filtered,e),Di(),i.devices=Ti.loaded
				}
			function I(e){
				var i=_.chain(e).sortBy(function(e){
					return e.name
					}).sortBy(function(e){
						return"IOS"!==e.os
						}).sortBy(function(e){
							return!e.$freeOfCharge
							}).sortBy(function(e){
								return!e.isPrivate
								}).value();
				return i
				}
			function M(e,t,n,o,r,l){
				var c=_.each(e,function(e){
					e.$freeOfCharge=_.contains(t,e.id),e.$apiLevelUnsupported=o&&e.apiLevel<o,e.$bonusExhausted=r,e.$excludedFromPlan=!l&&!e.$freeOfCharge,e.$accessDenied=e.$excludedFromPlan&&e.$bonusExhausted,e.$appiumWebAppTestingUnsupported=Vi&&"WEB"===n&&!e.supportsAppiumWebAppTesting,e.$disabled=e.$accessDenied||e.$appiumWebAppTestingUnsupported||e.$apiLevelUnsupported||i.deviceLimitReached,e.$disabledMessageType=V(e,i.deviceLimitReached)
					});
				return c
				}
			function V(e,i){
				return i?"TOO_MANY_SESSIONS":e.$accessDenied?"ACCESS_DENIED":e.$appiumWebAppTestingUnsupported?"APPIUM_WEB_APP_TESTING_UNSUPPORTED":e.$apiLevelUnsupported?"API_LEVEL_UNSUPPORTED":void 0
						}
			function E(e){
				e.$disabled||e.$inUse||i.openDeviceCallback&&i.openDeviceCallback(e.id)
				}
			function y(e){
				c.readAvailableForManualTesting().then(function(i){
					var t=_.filter(e,function(e){
						return!_.contains(i,e.id)
						}),n=_.pluck(t,"id");_.each(e,function(e){
							e.$inUse=_.contains(n,e.id)
							})
							})
							}
			function P(){
				m()}
			function U(){
					i.searchText="",m()
					}
			function T(e,t){
						i.popularityRegions=x(e,t),i.androidVersions=w(e,"osVersion","ANDROID"),i.iosVersions=w(e,"osVersion","IOS"),i.screenResolutions=O(e),i.screenDpis=L(e,"dpi"),i.screenSizes=L(e,"screenSize"),i.manufacturers=B(e),i.filters.os={activeCount:0,all:!0,android:!1,ios:!1},i.filters.androidVersion=N(i.androidVersions),i.filters.iosVersion=N(i.iosVersions),i.filters.manufacturer=N(i.manufacturers),i.filters.cpu={activeCount:0,all:!0,arm:!1,intel:!1},i.filters.form={activeCount:0,all:!0,phone:!1,tablet:!1},i.filters.rootAccess={activeCount:0,all:!0,rooted:!1,unrooted:!1},i.filters.resolution=N(i.screenResolutions),i.filters.dpi=N(i.screenDpis),i.filters.screenSize=N(i.screenSizes),i.filters.region=q(i.popularityRegions)
						}
			function x(e,i){
				var t=_.filter(i,function(i){
					return _.some(e,function(e){
						return _.contains(i.deviceDescriptorIds,e.id)
						})
						});
				return t
				}
			function L(e,i){
				var t=_.pluck(e,i),n=_.uniq(t),o=_.sortBy(n,function(e){
					return e
					});
				return o
				}
			function w(e,i,t){
				var n=_.filter(e,function(e){
					return e.os===t
					}),o=L(n,i);
				return o
				}
			function B(e){
				var i=L(e,"manufacturer"),t=_.flatten(i);
				return _.uniq(t)
				}
			function O(e){
				var i=_.sortBy(e,function(e){
					return e.resolutionWidth
					}),t=_.map(i,function(e){
						return W(e.resolutionWidth,e.resolutionHeight)
						}),n=_.uniq(t);
				return n
				}
			function W(e,i){
				return e+" x "+i
				}
			function N(e){
				var i={	activeCount:0,all:!0};
				return _.each(e,function(e){
					i[e]=!1}),i
					}
			function q(e){
				var i={all:!0};
				return _.each(e,function(e){
					i[e.name]=!1
					}),i
					}
			function z(e,t,n){
				mi(t),_.each(e,function(i,n){
					e[n]=n===t?!0:!1
							}),i.activeRegion=_.find(n,function(e){
								return e.name===t
								}),m()
								}
			function F(e,i){
				var t=!0;e.activeCount=0;
				for(var n in e){
					var o="all"===n,r=e[n]===!0;!o&&r&&(t=!1,e.activeCount++)
					}
				e.all=t,Y(i),j(i),m()
				}
			function H(e,i){
				e.activeCount=0;
				for(var t in e)
					e[t]=!1;e.all=!0,Y(i),j(i),m()
				}
			function G(e){
				e.activeCount=0,_.each(e,function(i,t){
					"region"!==t&&"activeCount"!==t&&H(i,e)
					})}
			function Y(e){
				e.androidVersion.disabled=!e.os.all&&!e.os.android||(e.os.all||e.os.ios)&&!e.iosVersion.all,e.iosVersion.disabled=!e.os.all&&!e.os.ios||(e.os.all||e.os.android)&&!e.androidVersion.all,e.androidVersion.disabled&&e.iosVersion.disabled&&(e.androidVersion.disabled=!1)
				}
			function j(e){
				e.activeCount=_.reduce(e,function(e,i){
					return!i.activeCount||i.disabled?e:e+i.activeCount
							},0)
							}
			function J(e){
				if(!K(e))
					return!1;
				if(!i.filters)
					return!0;
				if(!i.filters.cpu.all){
					if(!i.filters.cpu.arm&&e.isArm)
						return!1;
					if(!i.filters.cpu.intel&&!e.isArm)
						return!1
						}
				if(!i.filters.form.all){
					if(!i.filters.form.phone&&!e.isTablet)
						return!1;
					if(!i.filters.form.tablet&&e.isTablet)
						return!1
						}
				if(!i.filters.rootAccess.all){
					if(!i.filters.rootAccess.rooted&&e.isRooted)
						return!1;
					if(!i.filters.rootAccess.unrooted&&!e.isRooted)
						return!1
					}
				return i.filters.os.all||i.filters.os[e.os.toLowerCase()]?i.filters.androidVersion.disabled&&"ANDROID"==e.os?!1:i.filters.androidVersion.all||i.filters.androidVersion[e.osVersion]?i.filters.iosVersion.disabled&&"IOS"==e.os?!1:(i.filters.iosVersion.all||i.filters.iosVersion.disabled||i.filters.iosVersion[e.osVersion])&&(i.filters.manufacturer.all||Q(e.manufacturer))&&(i.filters.resolution.all||i.filters.resolution[W(e.resolutionWidth,e.resolutionHeight)])&&(i.filters.dpi.all||i.filters.dpi[e.dpi])&&(i.filters.screenSize.all||i.filters.screenSize[e.screenSize])&&(i.filters.region.all||X(i.filters.region,e.id,i.popularityRegions))?!0:!1:!1:!1
						}
			function K(e){
				if(void 0===e)
					return!1;
				var t=new RegExp(i.searchText,"i"),n=t.test(e.id),o=t.test(e.name);
				return!i.searchText||n||o
				}
			function Q(e){
				var t=!1;
				return _.each(e,function(e){
					i.filters.manufacturer[e]&&(t=!0)
					}),t
					}
			function X(e,i,t){
				var n=_.some(e,function(e,n){
					if(!e)
						return!1;
					var o=_.find(t,function(e){
						return e.name===n
						});
					return o?_.contains(o.deviceDescriptorIds,i):!1});
				return n
				}
			function Z(e){
				e.$disabled||(ri(e),fi())
				}
			
			function ei(){
				var e=di(Ti.filtered);e?ci(Ti.filtered):li(Ti.filtered),fi()
						}
			function ii(){
				function e(e){
					Ti.all=e.deviceDescriptors,m(),fi()
					}
				var i=l.open({controller:"SelectedDevicesModalCtrl",templateUrl:"views/devices/selected-devices-modal.html",windowClass:"modal-full-height selected-devices-modal",resolve:{modalParams:function(){
					return{
						deviceDescriptors:angular.copy(Ti.all)
						}
					}
				}
				});
				i.result.then(e)
				}
			function ti(e,t){
				if(t&&e){
					var n=angular.copy(e);
					_.each(t,function(e){
						e.$apiLevelUnsupported&&(n=_.without(n,e.id))
						}),ni(t,n),i.selectedDeviceDescriptorIds=n
						}
				}
			function ni(e,t){
				_.each(e,function(e){
					e.$selected=_.contains(t,e.id)
					}),i.toggleDeviceCallback&&i.toggleDeviceCallback(null,e)
					}
			function oi(e){
				if(e){
					var t=_.filter(e,function(e){
						return e.$selected
						}),n=_.map(t,function(e){
							return e.id
							});i.selectedDeviceDescriptorIds=n
							}
				}
			function ri(e){
				i.multiSelection===!1?(ci(Ti.all),ai(e)):e.$selected?si(e):ai(e),i.toggleDeviceCallback&&i.toggleDeviceCallback(e,i.devices)
						}
			function li(e){
				_.each(e,function(e){
					e.$disabled||ai(e)}),i.toggleDeviceCallback&&i.toggleDeviceCallback(null,i.devices)
					}
			function ci(e){
				_.each(e,function(e){
					si(e)
					}),i.toggleDeviceCallback&&i.toggleDeviceCallback(null,i.devices)
					}
			function ai(e){
				e.$selected=!0
				}
			function si(e){
				e.$selected=!1
				}
			function di(e){
				var i=_.some(e,function(e){
					return J(e)&&e.$selected
					});
				return i
				}
			function ui(e,t){
				ki?(i.deviceMinuteStats.bonusExhausted=!0,i.deviceMinuteStats.flatRatePurchased=!1,i.deviceMinuteStats.counted=!1,i.paidDevicesBlocked=!1):(i.deviceMinuteStats.bonusExhausted=e,i.deviceMinuteStats.flatRatePurchased=t,i.deviceMinuteStats.counted=!e&&!t,i.paidDevicesBlocked=e&&!t)
						}
			function fi(){
				oi(Ti.all),vi(Ti.all,i.deviceMinuteStats),Di()
				}
			function vi(e,i){
				var t=_.filter(e,function(e){
					return e.$selected&&!e.$freeOfCharge
					});
				i.paidDevicesSelected=!!t.length;
				var n=t.length*$i,o=i.remainingCount;pi(n,o,i),i.counted&&d.getUsage().then(function(e){
					var t=Math.ceil(e.deviceSecondsRemaining/60);pi(n,t,i)
					})
					}
			function pi(e,t,n){n.requiredCount=e,n.remainingCount=t,n.insufficient=e>t?!0:!1,n.runAllowed=!i.selectedDeviceDescriptorIds||!i.selectedDeviceDescriptorIds.length||i.paidDevicesBlocked&&n.paidDevicesSelected&&n.insufficient?!1:!0,i.selectedDeviceDescriptorIds&&(n.selectedDevicesCount=i.selectedDeviceDescriptorIds.length),i.updateDeviceMinuteStatsCallback&&i.updateDeviceMinuteStatsCallback(i.deviceMinuteStats)
					}
			function Di(){
				var e=Ti.loaded.length,t=_.reduce(Ti.loaded,function(e,i){
					return i.$selected?e+1:e},0);i.checkboxState.all=t&&t===e,i.checkboxState.some=t&&e>t,i.checkboxState.none=!t
					}
			function hi(){
				l.open({controller:"DeviceRequestModalCtrl",templateUrl:"views/devices/device-request-modal.html",windowClass:"device-request-modal"})
					}
				function gi(e){
					i.finishCallback&&i.finishCallback(angular.copy(e))
					}
				function mi(e){
				var i={region:e};
				u.track("filter devices",i)}e("RootCtrl",{$scope:i}),i.homeUrl=void 0,i.devices=void 0,i.selectedDeviceDescriptorIds=void 0,i.deviceCount=void 0,i.allDevicesLoaded=!1,i.paidDevicesBlocked=void 0,i.allPlatformsSupported=void 0,i.deviceMinuteStats={MINUTES_PER_DEVICE:void 0,counted:!1,requiredCount:0,remainingCount:0,insufficient:!0,bonusExhausted:!0,flatRatePurchased:!1,paidDevicesSelected:!1,runAllowed:!1,selectedDevicesCount:0},i.checkboxState={all:!1,some:!1,none:!0},i.androidVersions=void 0,i.screenResolutions=void 0,i.screenDpis=void 0,i.screenSizes=void 0,i.manufacturers=void 0,i.popularityRegions=void 0,i.filters={activeCount:0,os:void 0,androidVersion:void 0,iosVersion:void 0,manufacturer:void 0,cpu:void 0,form:void 0,rootAccess:void 0,resolution:void 0,dpi:void 0,screenSize:void 0,region:void 0},i.loadMoreDevices=S,i.filterByRegion=z,i.updateFilter=F,i.clearFilter=H,i.clearAllFilters=G,i.openSelectedDevicesModal=ii,i.finish=gi,i.showDeviceRequestModal=hi,i.changeSearch=P,i.clearSearch=U,i.toggleDevice=Z,i.toggleAll=ei,i.openDevice=E;
			var bi,Ci={app:i.$watch("app",f),selectedDevices:i.$watch("selectedDevices",v),deviceLimitReached:i.$watch("deviceLimitReached",p)},_i=2e3,Si=12,$i=3,Ri=t.user,ki=i.onlyViewable,Ai=i.planType,Ii=i.automationType,Mi=i.openable,Vi=i.appiumSupportIndicated,Ei=i.globalDescriptorsUsed,yi=i.privateDevicesExcluded,Pi={app:n.defer(),selectedDeviceDescriptorIds:n.defer()},Ui={deviceDescriptors:void 0,freeDeviceDescriptorIds:d.readFreeDeviceDescriptorIds(),popularityRegions:c.readPopularityRegions(),app:void 0,bonusMinutesRemaining:void 0,flatRatePurchased:void 0},Ti={all:void 0,filtered:void 0,loaded:void 0};i.homeUrl=Ri,i.deviceMinuteStats.MINUTES_PER_DEVICE=$i,i.control&&(i.control.setOpenSelectedDevicesModalCallback(function(){
				i.openSelectedDevicesModal(Ti.all)}),i.control.setFinishCallback(function(){
				i.finish(i.selectedDeviceDescriptorIds)}),i.control.setRefreshAppCallback&&i.control.setRefreshAppCallback(function(e){
				Pi.app=n.defer(),Pi.app.resolve(e),h()
				})),Ui.deviceDescriptors=Ei?a.readAllDeviceDescriptors():c.readAll(),ki||(Ui.app=Pi.app.promise,Ui.bonusMinutesRemaining=d.readBonusMinutesRemaining(),Ui.flatRatePurchased=d.readFlatRatePurchased(Ai)),h(),i.$on("$destroy",function(){
				r.cancel(bi)
				})
				}]
				}
	});
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/styles/jcarousel.basic.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
<!-- JQuery -->

<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<style>
	  #info_window .row .col-sm-3{
		font-size:1.5em;
		font-weight:bolder;
		text-align:right;
		
	  }
	  #left-panel{
	  	position: absolute;
        top: 8%;
        left:1%;
        z-index: 5;
        
	  }
	  #info_window .row .col-sm-9{
	  	font-size:1.5em;
	  }
	  #iw-url{
	  	margin-top:10px;
	  }
	  #iw-rating{
	  	color:red;
	  }
	  
 	  #right-panel {
       
        border: 1px solid #999;
        text-align: left;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        overflow-y:scroll;
        overflow-x:hidden;
	  	width:350px;
	  	background-color:white;
	  	height:650px;
       
      }
      #bottomPlanBox-panel{
      	position: absolute;
        top: 5%;
        left:90%;
        z-index: 5;
        padding: 5px;
      }
      #rightBottom-panel{
        position: absolute;
        top: 90%;
        left: 80%;
        z-index: 5;
        padding: 5px;
      }
      #callSpot-panel{
      	position: absolute;
        top: 78%;
        left: 4%;
        z-index: 5;
        padding: 5px;
      }
      #watchNowPlan{
        position: absolute;
        top: 90%;
        left: 35%;
        width:25%;
        z-index: 5;
        padding: 5px;
      }
      #loadingImg{
      	position: absolute;
      	top:30%;
      	left:40%;
      	display:none;
      }
      
      #autocomplete_box{
      	position: absolute;
        top: 80%;
        left: 35%;
        z-index: 5;
        padding: 5px;
        width:"300px";
      }

	  #attractionBtn {
        position: absolute;
        top: 10px;
        left: 30%;
        z-index: 5;
        padding: 5px;
      }
       #foodBtn {
        position: absolute;
        top: 10px;
        left: 55%;
        z-index: 5;
        padding: 5px;
      }
      #map {
        height: 800px;
        width: 100%;
      }
      table {
        font-size: 12px;
      }
      .panel {
        height: 100%;
        overflow: auto;
      }
      
      
      #iw-icon i{
       
      }
      #sp-origin,#sp-destination{
      	 height: 30px;
         color:black;
         font-size:20px;
         font-weight:border;
         font-height:30px;
      }
      #sp-waypoints{
      	 height: 500px;
         color:black;
         font-size:20px;
         font-weight:border;
         font-height:30px;
      }
     
      
      #distance h4{
      	color:black;
      }
      #hotelIcon{
      	height:50px;
      	width:50px
      }
      #buttons-show,#buttons-plan,#buttons-total,#logo{
      	width:100%;
      	height:100%;
      	border:red solid 1px;
      	border-radius: 6px;
      	
      }
      #distance{
      	text-align: center;
      }
      #md-review{
      	overflow:scroll;
      	height:360px;
      	
      }
      #review{
      	margin-left:300px;
      
      }
      
     
.myButton {
	box-shadow:inset 0px 1px 0px 0px #efdcfb;
	background:linear-gradient(to bottom, #dfbdfa 5%, #bc80ea 100%);
	background-color:#dfbdfa;
	border-radius:6px;
	border:1px solid #c584f3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #9752cc;
}
.myButton:hover {
	background:linear-gradient(to bottom, #bc80ea 5%, #dfbdfa 100%);
	background-color:#bc80ea;
}
.myButton:active {
	position:relative;
	top:1px;
}
.planview{
  background:#1AAB8A;
  color:#fff;
  border:none;
  height:55px;
  width:100%;
  text-align:center;
  line-height:55px;
  font-size:0.9em;
  cursor:pointer;
  transition:800ms ease all;
  border-radius:6px;
  outline:none;
  margin:5px;
}
.planview:hover{
  background:#fff;
  color:rgba(0, 188, 212, 0.3);
}
.planview:before,.planview:after{
  content:'';
  top:0;
  right:0;
  height:2px;
  width:0;
  background: rgba(0, 188, 212, 0.3);
  transition:400ms ease all;
}
.planview:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.planview:hover:before,.planview:hover:after{
  width:100%;
  transition:800ms ease all;
}
.btn, .btn-two {
	margin: 9px;
}
/* Colors for .btn and .btn-two */
.btn.red, .btn-two.red       {background-color: #fa5a5a;}
.btn.cyan, .btn-two.cyan     {background-color: #7fccde;}
.btn.green, .btn-two.green   {background-color: #9abf7f;}
.btn.purple, .btn-two.purple {background-color: #cb99c5;}
.btn.yellow, .btn-two.yellow {background-color: #f0d264;}
.rounded {
  border-radius: 10px;
}


/* color classes for .btn */
.btn.red {box-shadow:0px 4px 0px #E04342;}
.btn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}
.btn.purple {box-shadow:0px 4px 0px #AD83A8;}
.btn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}
.btn.cyan {box-shadow:0px 4px 0px #73B9C9;}
.btn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}
.btn.green {box-shadow: 0px 4px 0px #87a86f;}
.btn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}
.btn.yellow {box-shadow:0px 4px 0px #D1B757;}
.btn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}
/* Button two - I have no creativity for names */
.btn-two {
	color: white;	
	padding: 15px 25px;
	display: inline-block;
	cursor:pointer;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
				      0 2px 0 -1px rgba(0,0,0,0.13), 
				      0 3px 0 -1px rgba(0,0,0,0.08), 
				      0 3px 13px -1px rgba(0,0,0,0.21);
}
.btn-two:active {
	top: 1px;
	border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
	box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
	position: relative;
}
@import url(https://fonts.googleapis.com/css?family=BenchNine:700);
.snip1535 {
  background-color: #aa66cc;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 20px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #F781D8;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #F781D8;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #aa66cc;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}
.scrollbar {
margin-left: 30px;
float: right;
height: 300px;
width: 65px;
background: #fff;
overflow-y: scroll;
margin-bottom: 25px;

}
.force-overflow {
min-height: 450px;
}

.scrollbar-primary::-webkit-scrollbar {
width: 12px;
background-color: #F5F5F5; }

.scrollbar-primary::-webkit-scrollbar-thumb {
border-radius: 10px;
-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
background-color: #4285F4; }

.scrollbar-primary {
scrollbar-color: #4285F4 #F5F5F5;
}
    </style>

	<!-- Search -->

	

<script>
//변수 선언
//맵과 윈도우인포와 서비스 선언


var map,infoWindow,servicePlace;
//마커 선언
var markers=[];
//잘 모름
var hostnameRegexp = new RegExp('^https?://.+?/');
//주변검색 타입,키워드 선언
var nearSearchType='attractions';
var keyword='attractions';
//출발지 선언
var origin='${hotel.hotel_latlng}';
var hotelname='${hotel.hotel_name}'

//도착지 선언
var destination=origin;
//선택된 장소 넣는 배열 선언
var spots=[];
//최적거리 찾아주는 서비스 선언
var directionsService;
//총 거리 계산  서비스 선언
var directionsRenderer;
//장소 상세정보 이미지,이름,리뷰 선언
var md_image;	
var md_name;
var md_review;
//장소 이미지 넣을 태그 객체 선언
var li;
var img;
var span;
//일차마다 선택된 호텔과 장소들 담는 JSON 선언
var hotelInfo={}
var spotInfo={}
var spotsForSave={city_name:'${origin}',planner_no:'${planner_no}',cities_no:'${cities_no}'};
//선택된 일차 선언
var day=1;
//몇일치 일지 정하는 수 선언(넘어오는 값) 지금은 5일차
var plans=5;
//짜여진 계획 저장하는 JSON 선언
var dayplans={};

var sv;
var panorama;
var markerPanoID;

var streetFlag=false;
var walkDrive='DRIVING'

function initMap() {
	
	 infoWindow = new google.maps.InfoWindow({
        content: document.getElementById('info-content')
      });
	 //맵에 주는 스타일
	 var styledMapType = new google.maps.StyledMapType(
	            [
	              {elementType: 'geometry', stylers: [{color: '#ebe3cd'}]},
	              {elementType: 'labels.text.fill', stylers: [{color: '#523735'}]},
	              {elementType: 'labels.text.stroke', stylers: [{color: '#f5f1e6'}]},
	              {
	                featureType: 'administrative',
	                elementType: 'geometry.stroke',
	                stylers: [{color: '#c9b2a6'}]
	              },
	              {
	                featureType: 'administrative.land_parcel',
	                elementType: 'geometry.stroke',
	                stylers: [{color: '#dcd2be'}]
	              },
	              {
	                featureType: 'administrative.land_parcel',
	                elementType: 'labels.text.fill',
	                stylers: [{color: '#ae9e90'}]
	              },
	              {
	                featureType: 'landscape.natural',
	                elementType: 'geometry',
	                stylers: [{color: '#dfd2ae'}]
	              },
	              {
	                featureType: 'poi',
	                elementType: 'geometry',
	                stylers: [{color: '#dfd2ae'}]
	              },
	              {
	                featureType: 'poi',
	                elementType: 'labels.text.fill',
	                stylers: [{color: '#93817c'}]
	              },
	              {
	                featureType: 'poi.park',
	                elementType: 'geometry.fill',
	                stylers: [{color: '#a5b076'}]
	              },
	              {
	                featureType: 'poi.park',
	                elementType: 'labels.text.fill',
	                stylers: [{color: '#447530'}]
	              },
	              {
	                featureType: 'road',
	                elementType: 'geometry',
	                stylers: [{color: '#f5f1e6'}]
	              },
	              {
	                featureType: 'road.arterial',
	                elementType: 'geometry',
	                stylers: [{color: '#fdfcf8'}]
	              },
	              {
	                featureType: 'road.highway',
	                elementType: 'geometry',
	                stylers: [{color: '#f8c967'}]
	              },
	              {
	                featureType: 'road.highway',
	                elementType: 'geometry.stroke',
	                stylers: [{color: '#e9bc62'}]
	              },
	              {
	                featureType: 'road.highway.controlled_access',
	                elementType: 'geometry',
	                stylers: [{color: '#e98d58'}]
	              },
	              {
	                featureType: 'road.highway.controlled_access',
	                elementType: 'geometry.stroke',
	                stylers: [{color: '#db8555'}]
	              },
	              {
	                featureType: 'road.local',
	                elementType: 'labels.text.fill',
	                stylers: [{color: '#806b63'}]
	              },
	              {
	                featureType: 'transit.line',
	                elementType: 'geometry',
	                stylers: [{color: '#dfd2ae'}]
	              },
	              {
	                featureType: 'transit.line',
	                elementType: 'labels.text.fill',
	                stylers: [{color: '#8f7d77'}]
	              },
	              {
	                featureType: 'transit.line',
	                elementType: 'labels.text.stroke',
	                stylers: [{color: '#ebe3cd'}]
	              },
	              {
	                featureType: 'transit.station',
	                elementType: 'geometry',
	                stylers: [{color: '#dfd2ae'}]
	              },
	              {
	                featureType: 'water',
	                elementType: 'geometry.fill',
	                stylers: [{color: '#b9d3c2'}]
	              },
	              {
	                featureType: 'water',
	                elementType: 'labels.text.fill',
	                stylers: [{color: '#92998d'}]
	              }
	            ],
	            {name: 'Main Map'});
	 
	 
	//맵 생성
   map = new google.maps.Map(document.getElementById('map'), {
   zoom: 4,
   center: {lat: -8.672062, lng: 115.231609},  // 처음 지도 센터 위치: 발리 덴파사르.
   mapTypeControlOptions: {
       mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain',
               'styled_map']
      }
  });////map 생성
  
  
  //멥으로 뷰 이동
  var offset=$('#intro_container').offset();
	 $('html, body').animate({scrollTop : offset.top}, 400);
  
   
  //스트릿뷰
  sv= new google.maps.StreetViewService();
  panorama=new google.maps.StreetViewPanorama(document.getElementById('pano'),{
	  position:{lat: -8.672062, lng: 115.231609},
	  pov: {heading: 165, pitch: 0 }
	  
  });
  
  
  //맵 타입 변경 가능케하는 버튼생성
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');
  ////
  
  //루트와 거리계산,네비게이션
    directionsService = new google.maps.DirectionsService;
    directionsRenderer = new google.maps.DirectionsRenderer({
    draggable:false,//드래그 가능 여부
    map: map
  });
  directionsRenderer.addListener('directions_changed', function() {
    computeTotalDistance(directionsRenderer.getDirections());//총 거리 계산
  });
  //루트와 거리계산,네비게이션 끝

  //displayRoute 함수에 출발지와 도착지 설정
  displayRoute(origin, destination, directionsService,
      directionsRenderer,spots);
  ////
  
 
  
  //맵에 클릭이벤트 
  /*
   아래와 같은 이벤트 들이 있음
   bounds_changed
	center_changed
	click
	dblclick
	drag
	dragend
	dragstart
	heading_changed
	idle
	maptypeid_changed
	mousemove
	mouseout
	mouseover
	projection_changed
	resize
	rightclick
	tilesloaded
	tilt_changed
	zoom_changed
  */
  	
  
  
  map.addListener('click', function(event) {
	  	$('#map').css('width','100%');
		$('#pano').css('width','0%').css('float','left').css('height','800px');
		
		
	   $('#places').html('');
	   if(markers.length!=0){
		   //확인용
     	   //	console.log('click Markers',markers);
		   //
     	    removeMarkers(markers);
     	    markers=[];
     	   }
	   //서비스 생성
	     servicePlace = new google.maps.places.PlacesService(map);
	     /*
	     google.maps.places.RankBy.PROMINENCE (default) 평점순
	     google.maps.places.RankBy.DISTANCE 거리순
	     
	     */
	     //확인용
	     // console.log('servicePlace',servicePlace)
	     ///
	     servicePlace.nearbySearch(
	         	{location:event.latLng ,
	        	 radius: 5000,
	        	 type:[nearSearchType],
	             keyword: keyword
	         },
	         function(results, status, pagination) {
	           if (status !== 'OK') return;
	           
	           createMarkers(results);
	           
	         });
	     ////servicePlace
	     
	     
	   });////map.addListener
	   var input = document.getElementById('autocomplete');
	  	
		var autocomplete = new google.maps.places.Autocomplete(input);
		google.maps.event.addListener(autocomplete, 'place_changed', function () {
			var bounds = new google.maps.LatLngBounds();
			var searchedPlace=autocomplete.getPlace();
			console.log('autocomplete place',searchedPlace);
			 var logo;
			  
			 if(nearSearchType=='restaurant'){
				logo='<c:url value="/images/icons/foodIcon.png"/>';
			 }
			 else{
				logo='<c:url value="/images/icons/spotIcon.png"/>';
			 }
			 var image = {
			          url: logo,
			          size: new google.maps.Size(71, 71),
			          origin: new google.maps.Point(0, 0),
			          anchor: new google.maps.Point(17, 34),
			          scaledSize: new google.maps.Size(50, 50)
			       };
			 marker = new google.maps.Marker({
		          map: map,
		          icon: image,
		          animation: google.maps.Animation.DROP,
		          title: searchedPlace.name,
		          position: searchedPlace.geometry.location
		        });
	         markers.push(marker);
	         infoWindow.open(map, marker);
	         buildIWContent(searchedPlace);
	         buildDetailContent(searchedPlace);
	         bounds.extend(searchedPlace.geometry.location);  
	         map.fitBounds(bounds);
		})
}////initMap

function getDetailById(placeIds){ 
	servicePlace = new google.maps.places.PlacesService(map);
	var place_detail=servicePlace.getDetails({placeId: placeIds},
            function(place, status) {
              if (status !== google.maps.places.PlacesServiceStatus.OK) {
                return '없음';
              }
              console.log('place in func',place);
              return place;
            });
	return place_detail;
}////getDetailById

$(function(){
		$.ajax({
			url:'<c:url value="SavedPlan.kosmo"/>',
			data:$('#cities-no').serialize(),
			dataType:'json',
			success:function(data){successAjax(data)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		})
	
	
	
	$('#auto-spots').click(function(){
		
		$.ajax({
			url:'<c:url value="SpotList.kosmo"/>',
			data:{
				'city_no':'${city_no}',
				'cities_no':'${cities_no}',
				'gap':'${gap}'
			},
			dataType:'json',
			success:function(data){successAjax(data)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
		
	});
	
	
	var successAjax = function(data){
		spotInfo={};
		dayplans={};
		nearSearchType='attractions';
		servicePlace = new google.maps.places.PlacesService(map);
		
	function details(item,date){
		console.log('일차:',date,',details안의 item:',item)
		servicePlace.getDetails({placeId:item},
				function(place, status) {
              		if (status !== google.maps.places.PlacesServiceStatus.OK) {
              				console.log('status in func:',status)
                			return;
             	 	}
					var placelatlng={location:place.geometry.location.lat()+','+place.geometry.location.lng()}
					if(dayplans[date]==undefined){
	  					spots=[]
	  					spots.push(placelatlng);
	  					dayplans[date]={'origin':origin,'spots':spots};
					}
					else{
		  				dayplans[date]['spots'].push(placelatlng);
					}
           		})
	}//details
		
		
		

		
		console.log('data[0]:',data[0])
		$.each(data[0], function (date,item) {
			console.log('date:',date,',item:',item);
			var flag=false;
			if(item.length!=0){
				$('#loadingImg').attr('style','display:block')
				$('#map').attr('style','opacity:0.5')
			}
			
			for(var i=0;i<item.length;i++){
				(function(x) {
						setTimeout(function() {
							details(item[x],date)
							placeDetailnSave(item[x],date.substring(3))
							console.log('x*item.length:',x*item.length);
							if(x==item.length-1){
								setTimeout(function() {
									spots=dayplans['day1'].spots
									$('#loadingImg').attr('style','display:none')
									$('#map').attr('style','opacity:1')
									displayRoute(origin,destination , directionsService,
										      directionsRenderer,spots);
								},2000)
							}
						}, 3000*x);
				})(i);
				
			}
		})////each

	};/////successAjax 
	
});



 //0] 주변 찾기 설정
  function food() {
	  $('#type div').attr('class','snip1535')
	  $('#type div:eq(2)').attr('class','snip1535')
	  if(markers.length!=0){
	   //확인용
    	   //	console.log('click Markers',markers);
	   //
   	    removeMarkers(markers);
   	    markers=[];
   	   }
	  nearSearchType='restaurant';
	  keyword='restaurant'
      }
  function tour() {
	  $('#type div').attr('class','snip1535')
	  $('#type div:eq(1)').attr('class','snip1535')
	  if(markers.length!=0){
	   //확인용
    	   //	console.log('click Markers',markers);
	   //
   	    removeMarkers(markers);
   	    markers=[];
   	   }
	  nearSearchType='attractions'
	  keyword='attractions';
     }
  
  //0-1] 바구니에 스팟들 담기
 function placeDetailnSave(placeId,date){
	  servicePlace.getDetails({placeId: placeId},
	            function(place, status) {
	              if (status !== google.maps.places.PlacesServiceStatus.OK) {
	            	  console.log('detailSave:',status)
	                return;
	              }
	            	   hotelInfo['day'+date]={'hotel':origin}
	            	   if(spotInfo['day'+date]==undefined){
	            		   console.log('새로 만들어지는 place:',place.name)
		            	   var savedSpot=[]
		            	   var latlng=place.geometry.location.lat()+','+place.geometry.location.lng();
		            	   console.log('place in Detail save: ',place.name);
		            	   spotsForSave['day'+date]='';
		            	   spotsForSave['day'+date]+=(place.place_id)+':'+latlng+':'+place.name+'&';
		            	   savedSpot.push({'spot':place})
		            	   spotInfo['day'+date]=savedSpot
	            	   }
	            	   else{
	            		   console.log('저장되는 place:',place.name)
	            		   var latlng=place.geometry.location.lat()+','+place.geometry.location.lng();
	            		   spotsForSave['day'+date]+=(place.place_id)+':'+latlng+':'+place.name+'&';
	            		   spotInfo['day'+date].push({'spot':place})
	            	   }
	               
	            });
  }////placeDetail
  
  function box(){
	  $('#map').css('width','100%');
	  $('#pano').css('width','0%').css('float','left').css('height','800px');
	  var boxOrigin='';
	  var sp_waypoints=document.getElementById('sp-waypoints');
	  sp_waypoints.innerHTML=''
	  
	  console.log('dd',dayplans['day'+day]);
	  if(dayplans['day'+day]==undefined){
		  dayplans['day'+day]={'origin':origin,'spots':[]};
	  }
	  sp_waypoints.innerHTML=''
	  placeDetailnSave($('#iw-id').html(),day)
	  dayplans['day'+day].spots.push({location:$('#iw-lanlng').html()});
	  //console.log('lanlng',$('#iw-lanlng').html())
	  spots=dayplans['day'+day].spots;
  	  displayRoute(origin, destination, directionsService,directionsRenderer,spots);
		
	  if(markers.length!=0){
		   //확인용
    	   //	console.log('click Markers',markers);
		   //
    	    removeMarkers(markers);
    	    markers=[];
    	   }
  }////box
  
  function clearBox(){
	  if(confirm('현재 플랜을 정말 삭제하시겠습니까?')){
		  if(markers.length!=0){
			   //확인용
		    	   //	console.log('click Markers',markers);
			   //
		   	    removeMarkers(markers);
		   	    markers=[];
		   	   }
		  var savedSpot=[]
		  
		  spotsForSave['day'+day]='';
		  spots=dayplans['day'+day].spots=[];
		  spotInfo['day'+day]=savedSpot
		  displayRoute(origin, destination, directionsService,
			       directionsRenderer,spots);
	  }
  }////clearBox
  
 
  
  
 
  
 
 //2] 맵 위에 루트 표시
 function displayRoute(start, end, service, display,locatoins) {
     service.route({
     origin: start,//출발지
     destination:end,//도착지
     waypoints:locatoins,/*,{location: 'ubud, 발리'},{location: '공항, 발리'}*///여기에 경유지 추가
     travelMode: walkDrive,
     /*탈것 추가
     DRIVING (Default)
	 BICYCLING
	 WALKING
	 ※TRANSIT
	 { 트렌짓은 이런 옵션들도 가지고 있다
	  arrivalTime: Date,
	  departureTime: Date,
	  modes[]: TransitMode,
		  BUS 
		  RAIL 
		  SUBWAY 
		  TRAIN
		  TRAM
	  
	  routingPreference: TransitRoutePreference
  		  FEWER_TRANSFERS
 		  LESS_WALKING
		}
	 
     */
     avoidTolls: false,//톨게이트 피해서?
     optimizeWaypoints: true
   }, function(response, status) {
     if (status === 'OK') {
       display.setDirections(response);
     } else {
       alert('자동차 결로를 찾지 못했습니다:' + status);
       if(confirm('도보 경로로 변경하여 찾아보시겠습니까?')){
    	   walkDrive='WALKING';
       	   displayRoute(origin,origin,directionsService,directionsRenderer,spots)
       }
     }
   });
 }////displayRoute
 
 
 //3] 주변 마커 생성
 function createMarkers(places) {
	  var bounds = new google.maps.LatLngBounds();
	  var logo;
	  
	  if(nearSearchType=='restaurant'){
		logo='<c:url value="/images/icons/foodIcon.png"/>';
	  }
	  else{
		logo='<c:url value="/images/icons/spotIcon.png"/>';
	  }
	  
      
      for (var i = 0, place; place = places[i]; i++) {
        //console.log('place.icon',place.icon)
        var placesList = document.getElementById("places");
    	var image = {
          url: logo,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(50, 50)
        };
		  
          marker = new google.maps.Marker({
          map: map,
          icon: image,
          animation: google.maps.Animation.DROP,
          title: place.name,
          position: place.geometry.location
        });
          
         marker.placeResult = place;
         google.maps.event.addListener(marker, 'click', showInfoWindow);
         markers.push(marker)
         var div = document.createElement("div");
         div.setAttribute('id',place.place_id)
         div.setAttribute('class','btn col-sm-12')
         div.setAttribute('onclick','searchedSpotBtn(this)')
         div.textContent = place.name;
         
         if(place.photos!==undefined){
        	var img = document.createElement("img");
        	img.src=place.photos[0].getUrl();
        	img.setAttribute('style','width:500px;height:200px')
        	placesList.appendChild(img);

         }
         
         //if(place.photos!=undefined){
         //img.setAttribute('src',place.photos[0].getUrl());
         //img.setAttribute('style','width:350px;height:200px')
         //placesList.appendChild(img);
         //}
         //placesList.appendChild(img);
         placesList.appendChild(div);
         div = document.createElement("div");
         div.setAttribute('class','col-sm-12')
         var br=document.createElement("br");
         div.appendChild(br)
         
         placesList.appendChild(div);
        //마커 확인
   	 	//console.log('마커',marker.position.toString());
         //console.log('place.geometry.location',place.geometry.location);
    	//
        bounds.extend(place.geometry.location);  
      }
      map.fitBounds(bounds);
 }///createMarkers
 
 
 function searchedSpotBtn(data){
	 $('#sp-modal').modal('hide');
	 console.log('searchedSpotBtn:',data.innerHTML,'아이디: ',data.getAttribute('id'))
	 
	 var logo;
	  
	  if(nearSearchType=='restaurant'){
		logo='<c:url value="/images/icons/foodIcon.png"/>';
	  }
	  else{
		logo='<c:url value="/images/icons/spotIcon.png"/>';
	  }
	  var image = {
	          url: logo,
	          size: new google.maps.Size(71, 71),
	          origin: new google.maps.Point(0, 0),
	          anchor: new google.maps.Point(17, 34),
	          scaledSize: new google.maps.Size(50, 50)
	        };
	 
	 servicePlace.getDetails({placeId: data.getAttribute('id')},
            function(place, status) {
              if (status !== google.maps.places.PlacesServiceStatus.OK) {
                return;
              }
              marker = new google.maps.Marker({
                  map: map,
                  title: data.innerHTML,
                  icon: image,
                  animation: google.maps.Animation.DROP,
                  position: place.geometry.location
                });
              markers.push(marker);
              infoWindow.open(map, marker);
              buildIWContent(place);
              buildDetailContent(place);
            });
	 
	 var offset=$('#intro').offset();
	  $('html, body').animate({scrollTop : offset.top}, 400);
 }///searchedSpotBtn
 
 
 //3-1]주변 마커 제거
 function removeMarkers(markers){
	 for (var i = 0; i<markers.length; i++) {
		 markers[i].setMap(null)
		 //확인용
		 //console.log('markers['+i+']',markers[i])
		 //
	 }
 }///removeMarkers
 
 //3-2] 마커에 iw창 띄우기 infowindow
 function showInfoWindow() {
	 	//확인용
	 	//console.log('marker.placeResult',marker.placeResult)
	 	///
        var marker = this;
	 	
        servicePlace.getDetails({placeId: marker.placeResult.place_id},
            function(place, status) {
              if (status !== google.maps.places.PlacesServiceStatus.OK) {
                return;
              }
              infoWindow.open(map, marker);
              buildIWContent(place);
              buildDetailContent(place);
            });
      }////showInfoWindow
 
 //3-3] 마커 iw창 place_id 찾아서 place detail정보 찾아서 띄우기     
 function buildIWContent(place) {
	 
	 var logo;
	  
	  if(nearSearchType=='restaurant'){
		logo='<i class="fas fa-utensils fa-2x"></i>';
	  }
	  else{
		logo='<i class="fas fa-torii-gate fa-2x"></i>';
	  }
     document.getElementById('iw-icon').innerHTML = logo;
     document.getElementById('iw-url').innerHTML = '<h4><a href="' + place.url +
         '"  target="blank">' + place.name + '</a></h4>';
     document.getElementById('iw-address').textContent = place.vicinity;
     document.getElementById('iw-lanlng').textContent = place.geometry.location.toString().substring(1,place.geometry.location.toString().length-1);
     document.getElementById('iw-id').textContent = place.place_id
     if (place.formatted_phone_number) {
       document.getElementById('iw-phone-row').style.display = '';
       document.getElementById('iw-phone').textContent =
           place.formatted_phone_number;
     } else {
       document.getElementById('iw-phone-row').style.display = 'none';
     }
     // Assign a five-star rating to the hotel, using a black star ('&#10029;')
     // to indicate the rating the hotel has earned, and a white star ('&#10025;')
     // for the rating points not achieved.
     if (place.rating) {
       var ratingHtml = '';
       for (var i = 0; i < 5; i++) {
         if (place.rating < (i + 0.5)) {
           ratingHtml += '&#10025;';
         } else {
           ratingHtml += '&#10029;';
         }
       document.getElementById('iw-rating-row').style.display = '';
       document.getElementById('iw-rating').innerHTML = ratingHtml;
       }
     } else {
       document.getElementById('iw-rating-row').style.display = 'none';
     }
     // The regexp isolates the first part of the URL (domain plus subdomain)
     // to give a short URL for displaying in the info window.
     if (place.website) {
       var fullUrl = place.website;
       var website = hostnameRegexp.exec(place.website);
       if (website === null) {
         website = 'http://' + place.website + '/';
         fullUrl = website;
       }
       document.getElementById('iw-website-row').style.display = '';
       document.getElementById('iw-website').textContent = website;
     } else {
       document.getElementById('iw-website-row').style.display = 'none';
     }
   }/////buildIWContent
 
 //3-4]
   function buildDetailContent(place) {
	   document.getElementById('md-name').innerHTML = '';
	   document.getElementById('md-review').innerHTML = '';
	   md_name=document.getElementById('md-name');
	   md_review=document.getElementById('md-review');
	   span=document.createElement('span')
	   span.textContent=place.name;
	   md_name.appendChild(span)
	   if(place.reviews!=undefined){
		   for(var i=0;i<place.reviews.length;i++){
		   span=document.createElement('h4')
		   span.textContent=' ▶'+place.reviews[i].author_name;
		   
		   md_review.appendChild(span)
		   span=document.createElement('h5')
		   span.setAttribute('style','background-color:#0099CC;border-radius:6px;color:white;')
		   span.textContent=place.reviews[i].text
		   md_review.appendChild(span)
		   }
	   }
	   
	   
	   
	   
	   sv.getPanorama(
	            {
	              location: place.geometry.location,
	              radius: 50
	            },
	            processSVData
	          ); 
	   
   }
 
   function processSVData(data, status){
	   console.log('sv data:',data)
	   if (status === "OK") {
		streetFlag=true;
        markerPanoID = data.location.pano;
        console.log('markerPanoID:',markerPanoID)
	  } 
	  else {
       console.error("Street View data not found for this location.");
       
       streetFlag=false;
       
       alert('이 지역에 대한 스트릿뷰틑 찾지 못했습니다.')
     }
   }
   
 //4] 토탈 거리 계산기
 function computeTotalDistance(result) {
   var total = 0;
   var myroute = result.routes[0];
   for (var i = 0; i < myroute.legs.length; i++) {
     total += myroute.legs[i].distance.value;
   }
   total = total / 1000;
   document.getElementById('total').innerHTML = total + ' km';
 }////computeTotalDistance
 
 function showPlan(){
	 var sp_origin=document.getElementById('sp-origin');
	 var sp_destination=document.getElementById('sp-destination')
	 var sp_waypoints=document.getElementById('sp-waypoints');
	 
	 sp_destination.textContent='도착지:'+hotelname
	 sp_destination.setAttribute('style','background-color:#f5f5f5;border-radius:9px')
	 sp_origin.textContent='출발지:'+hotelname
	 sp_origin.setAttribute('style','background-color:#f5f5f5;border-radius:9px')
	 
	 
	//확인용
		//console.log('day',day)
	 	//console.log('spotArr:',spotArr)
	 	//console.log('spotArr[0].spot.name:',spotArr[0].spot.name)
	 //
	 if(spotInfo['day'+day]!=undefined){
		 var spotArr=spotInfo['day'+day]
		 sp_waypoints.innerHTML=''
		 
		 for(var i=0;i<spotArr.length;i++){
			 
			console.log('들어옴',spotArr[i].spot.name)
			var div=document.createElement('div');
			div.setAttribute('style','background-color:#f0ffff;border-radius:9px')
			
			var h4=document.createElement('h3')
			h4.textContent=(i+1)+'. 경유지 ▶'
			h4.setAttribute('style','font-weight:bolder;')
			div.appendChild(h4)
			h4=document.createElement('h4')
			h4.setAttribute('style','color:#0080ff;border-radius:9px')
			h4.textContent=spotArr[i].spot.name
			h4.setAttribute('id',spotArr[i].spot.place_id)
			h4.setAttribute('onclick','searchedSpotBtn(this)')
			div.appendChild(h4)
			h4=document.createElement('h5')
	 	 	h4.textContent=spotArr[i].spot.formatted_address
	 	 	div.appendChild(h4)
	 	 	sp_waypoints.appendChild(div)
		 }
	 }
	 else{
		 sp_waypoints.textContent=''
		 var h3=document.createElement('h3')
		 h3.setAttribute('style','color:#e85977;border-radius:9px')
		 h3.textContent='기능을 이용하여 자기만의 플랜을 만들어보세요!'
		 sp_waypoints.appendChild(h3)
	 }
	  $('#sp-modal').modal('show');
	  $('#close2').on('click',function(){
	  		$('#sp-modal').modal('hide');
		});
 }
 
 ///상세정보 보기 모달창
async function streetView(){
	  panorama=  await new google.maps.StreetViewPanorama(document.getElementById('pano'),{
	  position:{lat: -8.672062, lng: 115.231609},
	  pov: {heading: 165, pitch: 0 },
	  pano:markerPanoID
  		});
      panorama.setVisible(true);
      if(streetFlag){
		  $('#map').css('width','50%').css('float','left')
		  $('#pano').css('width','50%').css('float','left').css('height','800px');
	  }
 }
 
 function detail(){
	 
	  $('#js-modal h4').css({color:'black',margin:'10px'})
	  $('#js-modal span').css({color:'black',textAlign:'center',fontWeigt:'bord'})
	 
	
	  
	  $('#js-modal').modal('show');
	  $('#close').on('click',function(){
			$('#js-modal').modal('hide');
			 
		});
	  
	 
 }////detail
 
 
 function DayPlan(data){
	 //확인
	 console.log('data.id',data.id)
	 console.log(data.id.split('.')[1])
	 
	 day=data.id.split('.')[1]
	 
	 //확인
	 console.log('day',day)
	 console.log(dayplans['day'+day])
	 
	 if(dayplans['day'+day]!=undefined){
	 planOrigin=dayplans['day'+day].origin
	 spots=dayplans['day'+day].spots
	 displayRoute(planOrigin,destination , directionsService,
		      directionsRenderer,spots);
	 }
	 else{
		 alert('준비된 계획이 없습니다')
		 spots=[];
		 dayplans['day'+day]={'origin':origin,'spots':spots}
		 displayRoute(origin,destination , directionsService,
			      directionsRenderer,spots);
	 }
 }
 
 function clearPlanBox() {
	 if(confirm('모든 플랜들을 정말 삭제하시겠습니까?')){
		spotInfo={}
		dayplans={};
		spotsForSave="";
		spotsForSave={city_name:'${origin}',planner_no:'${planner_no}',cities_no:'${cities_no}'};
		alert('모든 플랜들이 삭제되었습니다')
	 }
}
 
 function back() {
	 var jsonData = JSON.stringify(spotsForSave);
	 console.log('LAST spotsForSave:',spotsForSave);
	 
	 $.ajax({
			url:'<c:url value="PlanSave.kosmo"/>',
			data:spotsForSave,
			success:function(){
				location.replace("<c:url value='Planner.kosmo?planner_no=${planner_no}'/>");
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	}
 function autoComplete(){
	 $('#autocomplete').val('')
		
 }
 
</script>	
		
	<div class="intro" id="intro">
		
		<div class="intro_container" id="intro_container" style="width:100%">
			
			<input type="text" id="cities-no"  value="${cities_no}" name="cities_no" hidden="true" >
			<input type="text" id="city-no"  value="${city_no}" name="city_no" hidden="true" >
			<input type="text" id="gap"  value="${gap}" name="gap" hidden="true" >
			<div class="row">
				<div class="col-sm-12">
					<div id="attractionBtn" class="snip1535" style="border-radius: 12px;" onclick="tour();"><i class="fas fa-torii-gate fa-2x">명소</i></div>
					<div id="foodBtn" class="snip1535" style="border-radius: 12px;" onclick="food();"><i class="fas fa-utensils fa-2x">음식점</i></div>
					<div id="pano"></div>
					<div id="map"></div>
					<div id="autocomplete_box" class="input-group input-group-lg col-sm-3">
						
					</div>
					<div id="left-panel">
						<button class="planview" data-toggle="collapse" data-target="#right-panel" aria-expanded="false">주변 검색 목록</button>
						<input type="text" style="margin-left:4px;" id="autocomplete" class="form-control" placeholder="찾는 명소이름 직접 입력" onfocus="autoComplete()" >
						<div class="collapse" style="margin-left:3px;" id="right-panel">
							
							
							<div class="row" id="places"></div>
						</div>
					</div>
					<div id="bottomPlanBox-panel">
						<div id="dayPlanRow">
							<c:forEach begin="1" end="${gap}" var="days" >
									<div class="planview" id="day.${days}" onclick="DayPlan(this)"><i class="fas fa-bookmark"> ${days}일차 플랜</i></div>
									
							</c:forEach>
							<div class="btn btn-danger waves-effect" style="border-radius: 9px;width:100%;" onclick="clearBox();"><i class="far fa-trash-alt"> 현재 삭제</i></div>
							<div class="btn btn-danger btn-rounded waves-effect" style="border-radius: 9px;width:100%;" onclick="clearPlanBox()"><i class="fas fa-trash"> 전체 삭제</i></div>
							<button class="btn aqua-gradient" id="auto-spots" style="border-radius: 9px;width:100%;">자동 완성</button>
							<div class="planview" data-toggle="modal" data-target="#sp-modal" onclick="showPlan()"><i class="fas fa-eye"> 현재 플랜  상세 보기</i></div>
							<div class="planview" onclick="back()">저장후 planner로 이동 <i class="fas fa-download"></i></div>	
						</div>
						
					</div>
					<div id="watchNowPlan">
						
					</div>
					<img id="loadingImg" src="<c:url value="/images/loading.gif"/>"></img>
				</div>
				 
				
				
			</div>	
					
		</div>
	</div>
	
	
		<div style="display: none">
	      <div id="info-content">
	        <div id="info_window" class="row">
	          <div class="col-sm-12" id="iw-url-row">
	          	<div class="row">
	          		<div id="iw-icon" class="col-sm-3"></div>
	          		<div id="iw-url" class="col-sm-9"></div>
	          	</div>
	          	<div class="row" id="iw-address-row" >
	          		<div class="col-sm-3">주소:</div>
	          		<div id="iw-address" class="col-sm-9"></div>
	          	</div>
	          	<div class="row" id="iw-phone-row">
	          		<div class="col-sm-3">전화번호:</div>
	          		<div id="iw-phone" class="col-sm-9"></div>
	          	</div>
	          	<div class="row" id="iw-rating-row">
	          		<div class="col-sm-3">구글평점:</div>
	          		<div id="iw-rating" class="col-sm-9"></div>
	          	</div>
	          	<div class="row"  id="iw-website-row">
	          		<div class="col-sm-3">웹사이트:</div>
	          		<div id="iw-website" class="col-sm-9"></div>
	          	</div>
	          	<div hidden="true" class="row" id="iw-lanlng-row">
	          		<div class="col-sm-3">위도경도:</div>
	          		<div id="iw-lanlng" class="col-sm-9"></div>
	          	</div>
	          	<div hidden="true" class="row">
	          		<div class="col-sm-3">위치 아이디:</div>
	          		<div id="iw-id" class="col-sm-9"></div>
	          	</div>
	          	<div class="row">
	          		<div class="col-sm-12"><br></div>
	          	</div>
	          	<div class="row">
	          	<div class="col-sm-4">
	          		<div id="reviewBtn" class="btn btn-info waves-effect" data-toggle="modal" onclick="detail()"><i class="fas fa-book"></i> 리뷰</div>
	          	</div>
	          	<div class="col-sm-4">
	            	<div id="streetViewBtn" class="btn btn-info waves-effect" onclick="streetView()"><i class="fas fa-info-circle"></i> 스트릿 view</div>
	          	</div>
	          	<div class="col-sm-4">
	          		<div class="btn btn-success waves-effect" onclick="box()"><i class="fas fa-cart-arrow-down"> 바구니!</i></div>
	          	</div>
	           </div>
	        </div>
	       </div>   	
	      </div>
    	</div>
    	
	<div class="modal fade" id="js-modal" data-backdrop="static">
	  <div class="modal-dialog modal-lg modal-notify modal-info">
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<h2 style="text-align:center;" id="md-name"></h2>
	    		<button class="close" id="close">
	    			<span>&times;</span>
	    		</button>
	    	</div>
	    	<div class="modal-body">
	    		
    			
				<button id="review" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				  	 구글 댓글 보기 <i class="fas fa-comment-alt"></i>
				</button>
				<div class="collapse" id="collapseExample">
				  <div class="well" id="md-review">
				  </div>
				</div>
	    	</div>
	    </div>
	  </div>
	</div>	
	
	<div class="modal fade" id="sp-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog modal-notify modal-info" role="document">
	    <div class="modal-content">
	    	<div class="modal-header">
	         <p class="heading lead">현재 나의 플랜</p>	         		
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	           <span aria-hidden="true" class="white-text">&times;</span>
	         </button>
	       </div>
	    	<div class="modal-body" >	   		
	    		<i class="fas fa-road animated rotateIn"></i>
	    		<div class="row">
		    		<div class="col-sm-12" id="sp-origin"></div>
		    		<div class="col-sm-12" id="sp-waypoints" style="overflow-y:scroll"></div>
		    		<div class="col-sm-12" id="sp-destination"></div>
		    		<div class="col-sm-12" id="distance">
						<h4>전체 이동 거리: <span id="total"></span></h4>
					</div>
	    		</div>
	    	</div>
	    </div>
	  </div>
	</div>
	
	
 	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=${GoogleMapApiKey}&libraries=places&callback=initMap">
    </script>
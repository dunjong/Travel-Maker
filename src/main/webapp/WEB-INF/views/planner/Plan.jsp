<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/js/jquery.jcarousel.min.js'/>"></script>
<script src="<c:url value='/js/jcarousel.basic.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/styles/jcarousel.basic.css'/>">
<style>
	  #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        margin-left: 10px;
      }
      #map {
        height: 100%;
        width: 100%;
      }
      table {
        font-size: 12px;
      }
      .panel {
        height: 100%;
        overflow: auto;
      }
      .iw_table_row {
         height: 18px;
         color:#B28AF0;
         font-size:15px;
         font-weight:border
      }
      .iw_attribute_name {
        font-weight: bold;
        text-align: right;
        color:black;
      }
      .iw_table_icon {
        text-align: right;
      }
      #types img{
      	border-radius:30px
      }
      #types img:hover{
      	width: calc(100% + 20px);
      	opacity: 1;
      	border-radius:30px
      }
      #types img:active{
      	width: calc(100% + 5px);
      	opacity: 0.5;
      }
      #sp-origin,#sp-destination{
      	 height: 30px;
         color:#B28AF0;
         font-size:20px;
         font-weight:border;
         font-height:30px;
         border:double #32a1ce
      }
      #sp-waypoints{
      	 height: 500px;
         color:#ff9999;
         font-size:20px;
         font-weight:border;
         font-height:30px;
         border:double #32a1ce;
      }
      #type{
      	margin:40px;
      	color:sandybrown;
      }
      #type > strong{
      	color:red
      }
      #day{
      	color:green;
      	border:thick double #ff9999
      }
      #buttons{
      	margin-top:30px;
      	
      }
      #buttons > div{
      	margin-right: 7px;
      }
      #hotelIcon{
      	height:50px;
      	width:50px
      }
      #planBox{
      	 border:thick double #ff9999
      }
      #planBox > div{
      	margin:10px;
      }
      #md-image img{
	      width:580px;
	      height:380px;
	      border:1rem solid;
      }
      #md-review{
      	overflow:scroll;
      	height:360px;
      }
      #review{
      	margin-left:300px;
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
var nearSearchType='lodging';
var keyword='';
//출발지 선언
var origin='방콕, 태국';
//도착지 선언
var destination='호텔,방콕, 태국';
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
//선택된 일차 선언
var day=1;
//몇일치 일지 정하는 수 선언(넘어오는 값) 지금은 8일차
var plans=5;
//짜여진 계획 저장하는 JSON 선언
var dayplans={};

 //0] 주변 찾기 설정
  function food() {
	  $('#type').html('맵을 눌러서 주변 <strong>맛집</strong>을 확인해보세요!')
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
  function hotel() {
	  $('#type').html('맵을 눌러서 주변 <strong>호텔</strong>을 확인해보세요!')
	  if(markers.length!=0){
	   //확인용
    	   //	console.log('click Markers',markers);
	   //
   	    removeMarkers(markers);
   	    markers=[];
   	   }
	  nearSearchType='lodging';
	  keyword='lodging'
     }
  function tour() {
	  $('#type').html('맵을 눌러서 주변 <strong>명소</strong>를 확인해보세요!')
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
  function placeDetailnSave(placeId){
	  servicePlace.getDetails({placeId: placeId},
	            function(place, status) {
	              if (status !== google.maps.places.PlacesServiceStatus.OK) {
	                return;
	              }
	              console.log('place in placeDetail:',place)
	               if(nearSearchType=='lodging'){
	            	   console.log('day in save',day)
	             	   hotelInfo['day'+day]={'hotel':place}
	               }
	               else{
	            	   if(spotInfo['day'+day]==undefined){
		            	   var savedSpot=[]
		            	   savedSpot.push({'spot':place})
		            	   spotInfo['day'+day]=savedSpot
	            	   }
	            	   else{
	            		   spotInfo['day'+day].push({'spot':place})
	            	   }
	               }
	            });
  }////placeDetail
  
  function box(){
	  var boxOrigin='';
	  var sp_waypoints=document.getElementById('sp-waypoints');
	  sp_waypoints.innerHTML=''
	  if(nearSearchType=='lodging'){
		  placeDetailnSave($('#iw-id').html())
		  
		  boxOrigin=$('#iw-lanlng').html();
		  displayRoute(boxOrigin,destination , directionsService,
			       directionsRenderer,spots);
	  }
	  else{
		  sp_waypoints.innerHTML=''
		  placeDetailnSave($('#iw-id').html())
		  spots.push({location:$('#iw-lanlng').html()});
		  //console.log('lanlng',$('#iw-lanlng').html())
	  	  displayRoute(origin, destination, directionsService,
		       directionsRenderer,spots);
	  }
	  if(markers.length!=0){
		   //확인용
    	   //	console.log('click Markers',markers);
		   //
    	    removeMarkers(markers);
    	    markers=[];
    	   }
  }////box
  function clearBox(){
	  if(markers.length!=0){
		   //확인용
	    	   //	console.log('click Markers',markers);
		   //
	   	    removeMarkers(markers);
	   	    markers=[];
	   	   }
	  displayRoute(origin, destination, directionsService,
		       directionsRenderer,spots);
  }////clearBox
  
 
  
  
 
  
 //1] 페이지에 맵 표시
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
     
   
   //맵 타입 변경 가능케하는 버튼생성
   map.mapTypes.set('styled_map', styledMapType);
   map.setMapTypeId('styled_map');
   ////
   
   //루트와 거리계산,네비게이션
     directionsService = new google.maps.DirectionsService;
     directionsRenderer = new google.maps.DirectionsRenderer({
     draggable:false,//드래그 가능 여부
     map: map,//맵
     panel: document.getElementById('right-panel')//패널 dom 객체
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
   
 }////initMap
 
 //2] 맵 위에 루트 표시
 function displayRoute(origin, destination, service, display,spots) {
     service.route({
     origin: origin,//출발지
     destination: destination,//도착지
     waypoints:spots,/*,{location: 'ubud, 발리'},{location: '공항, 발리'}*///여기에 경유지 추가
     travelMode: 'DRIVING',
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
       alert('Could not display directions due to: ' + status);
     }
   });
 }////displayRoute
 
 
 //3] 주변 마커 생성
 function createMarkers(places) {
	  var bounds = new google.maps.LatLngBounds();
	  var logo;
	  if(nearSearchType=='lodging'){
	  	logo='<c:url value="/images/hotelIcon.png"/>';
	  }
	  else if(nearSearchType=='restaurant'){
		logo='<c:url value="/images/foodIcon.png"/>';
	  }
	  else{
		logo='<c:url value="/images/spotIcon.png"/>';
	  }
	  
      
      for (var i = 0, place; place = places[i]; i++) {
        console.log('place.icon',place.icon)
    	var image = {
          url: logo,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(25, 25)
        };
		  
          marker = new google.maps.Marker({
          map: map,
          icon: image,
          animation: google.maps.Animation.DROP,
          title: place.name,
          position: place.geometry.location
        });
         marker.placeResult = place;
         google.maps.event.addListener(marker, 'mouseover', showInfoWindow);
         markers.push(marker)
        //마커 확인
   	 	//console.log('마커',marker.position.toString());
    	//
        bounds.extend(place.geometry.location);  
      }
 }///createMarkers
 
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
	  if(nearSearchType=='lodging'){
	  	logo='<c:url value="/images/hotelIcon.png"/>';
	  }
	  else if(nearSearchType=='restaurant'){
		logo='<c:url value="/images/foodIcon.png"/>';
	  }
	  else{
		logo='<c:url value="/images/spotIcon.png"/>';
	  }
     document.getElementById('iw-icon').innerHTML = '<img style="width:80px;height:80px;margin:10px" class="hotelIcon" ' +
         'src="' + logo + '"/>';
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
	   document.getElementById('md-image').innerHTML = '';
	   document.getElementById('md-name').innerHTML = '';
	   document.getElementById('md-review').innerHTML = '';
	   md_image=document.getElementById('md-image');
	   md_name=document.getElementById('md-name');
	   md_review=document.getElementById('md-review');
	  
	   for(var i=0;i<10;i++){
			   if(place.photos!=undefined && place.photos[i]!=undefined){
				    console.log('place.photos[i].getUrl()',place.photos[i].getUrl())
				    li =document.createElement('li');
				    img = document.createElement('img');
				    img.alt='사진 없음';
	           		img.src=place.photos[i].getUrl()
		            li.appendChild(img);	
		            md_image.appendChild(li);
			   }
		   }; 
		   span=document.createElement('span')
		   span.textContent=place.name;
		   md_name.appendChild(span)
		   if(place.reviews!=undefined){
			   for(var i=0;i<place.reviews.length;i++){
			   span=document.createElement('h4')
			   span.textContent='리뷰'+(i+1)+' ▶'+place.reviews[i].author_name+' : '+place.reviews[i].text;
			   md_review.appendChild(span)
			   }
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
	 sp_destination.textContent='도착지:'+destination
	 //확인용
	 	console.log('hotelInfo:',hotelInfo)
	 //
	 console.log('hotelInfo',hotelInfo['day'+day])
	 if(hotelInfo['day'+day]!=undefined)
	 	 sp_origin.textContent='출발지:'+hotelInfo['day'+day].hotel.name
	 else
		 sp_origin.textContent='출발지:'+origin
	 var spot=''
	 for(var i=0;i<spots.length;i++){
		 spot+=spots[i].location+' '
	 }
	 
	 var sp_waypoints=document.getElementById('sp-waypoints');
	//확인용
		console.log('day',day)
		var spotArr=spotInfo['day'+day]
	 	console.log('spotArr:',spotArr)
	 	console.log('spotArr[0].spot.name:',spotArr[0].spot.name)
	 //
	 if(spotInfo['day'+day]!=undefined){
		 
		 sp_waypoints.innerHTML=''
		 
		 for(var i=0;i<spotArr.length;i++){
			 
			console.log('들어옴',spotArr[i].spot.name)
			var h4=document.createElement('h4')
			h4.textContent='◆'+(i+1)+'번째 경유지:'
			sp_waypoints.appendChild(h4)
			h4=document.createElement('h4')
			h4.textContent='이름:'+spotArr[i].spot.name
			sp_waypoints.appendChild(h4)
			h4=document.createElement('h4')
	 	 	h4.textContent='주소:'+spotArr[i].spot.formatted_address
	 	 	sp_waypoints.appendChild(h4)
	 	 	h4=document.createElement('h4')
	 	 	h4.textContent='위치 아이디:'+spotArr[i].spot.id
	 	 	sp_waypoints.appendChild(h4)
		 }
	 }
	 else{
		 sp_waypoints.textContent='경유지: 없음'
	 }
	  $('#sp-modal').modal('show');
	  $('#close2').on('click',function(){
	  		$('#sp-modal').modal('hide');
		});
 }
 
 ///상세정보 보기 모달창
 function detail(){
	 
	  $('#js-modal h4').css({color:'black',margin:'10px',border:'thick double #32a1ce'})
	  $('#js-modal span').css({color:'black',textAlign:'center',fontWeigt:'bord'})
	  
	    var $btn = $(this).button('loading')
	    $btn.button('reset')
	  
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
	 planSpots=dayplans['day'+day].spots
	 displayRoute(planOrigin,destination , directionsService,
		      directionsRenderer,planSpots);
	 }
	 else{
		 alert('준비된 계획이 없습니다')
		 spots=[];
		 displayRoute(origin,destination , directionsService,
			      directionsRenderer,spots);
	 }
 }
 
 function clearPlanBox() {
	day=1
	planBox.innerHTML=''
	$('#day').html('1일차 플랜');
	clearBox()
}
 function back() {
	 $('#frm').prop('action','<c:url value="/TravelMaker/Planner.kosmo"/>')
 	 $('#frm').submit()
}
 function saveDayPlan(){
	 dayplans['day'+day]={'origin':origin,'spots':spots}
	 alert(day+'일차 계획이 저장되었습니다.')
 }
 
</script>	
	
		
	<div class="intro">
		
		<div class="intro_container" style="margin-left:150px;width:80%">
			<div class="row">
				<div class="col-sm-4">
					
				</div>
						<div class="col-sm-6" id="planBox">
							<c:forEach begin="1" end="5" var="days" >
								<div class="btn btn-warning" id="day.${days}" onclick="DayPlan(this)">${days}일차 플랜</div>
							</c:forEach>
						</div>
				<div class="col-sm-2">
					<div class="btn btn-danger" onclick="clearPlanBox()">전체 플랜 삭제하기</div>
					<div class="btn btn-info" onclick="back()">여정 표로 돌아가기</div>
					<div>
						<form hidden="true" id="frm">
							
						</form>
					</div>
				</div>
				
			</div>
			<br>
			<br>
			<br>
			<div class="row" style="margin-left:10px;" >
				<div class="col-sm-3">
					<div id="types" class="row" style="margin-left:10px;" >
						<div class="col-sm-12">
							<h3 onclick="hotel();">호텔</h3>
							<img id="hotel-img" alt="" src="<c:url value='/images/hotels.jpg'/>" onclick="hotel();">
						</div>
						<div class="col-sm-12">
							<h3 onclick="tour();">명소</h3>
							<img id="tour-img" alt="" src="<c:url value='/images/tours.jpg'/>" onclick="tour();">
						</div>
						<div class="col-sm-12">
							<h3 onclick="food();">식당</h3>
							<img id="food-img" alt="" src="<c:url value='/images/food.jpg'/>" onclick="food();">
						</div>
						<div class="col-sm-12" id="buttons">
							<div class="btn btn-warning" onclick="clearBox();">플랜 삭제!</div>
							<div class="btn btn-danger" onclick="showPlan()" >플랜 보기!</div>
							<div class="btn btn-info" onclick="saveDayPlan()">플랜  저장!</div>
							<h4>전체 거리: <span id="total"></span></h4>
						</div>
					</div>
				</div>
				<div class="col-sm-9" style="height: 700px;margin-bottom:20px">
					<div id="floating-panel">
						<h4><span id="type">맵을 눌러서 주변 <strong>호텔</strong>을 확인해보세요!</span><small id=day>1일차 플랜</small></h4>
				    </div>
				   
					<div id="map"></div>
					
				</div>
<!-- 				<div id="right-panel" class="col-sm-2" style="height: 700px; width: 100px;margin-bottom:20px;overflow:scroll;"> -->
<!-- 					 -->
<!-- 				</div> -->
			</div>
			
		</div>
		<!-- makerclick -->
	
		
		
	</div>
		<div style="display: none">
	      <div id="info-content">
	        <table>
	          <tr id="iw-url-row" class="iw_table_row">
	            <td id="iw-icon" class="iw_table_icon"></td>
	            <td id="iw-url"></td>
	          </tr>
	          <tr id="iw-address-row" class="iw_table_row">
	            <td class="iw_attribute_name">주소:</td>
	            <td id="iw-address"></td>
	          </tr>
	          <tr id="iw-phone-row" class="iw_table_row">
	            <td class="iw_attribute_name">전화번호:</td>
	            <td id="iw-phone"></td>
	          </tr>
	          <tr id="iw-rating-row" class="iw_table_row">
	            <td class="iw_attribute_name">구글평점:</td>
	            <td id="iw-rating"></td>
	          </tr>
	          <tr id="iw-website-row" class="iw_table_row">
	            <td class="iw_attribute_name">웹사이트:</td>
	            <td id="iw-website"></td>
	          </tr>
	          <tr id="iw-lanlng-row" class="iw_table_row">
	            <td class="iw_attribute_name">위도경도:</td>
	            <td id="iw-lanlng"></td>
	          </tr>
	          <tr class="iw_table_row">
	            <td class="iw_attribute_name">위치 아이디: </td>
	            <td id="iw-id"></td>
	          </tr>
	          <tr class="iw_table_row">
	          	<td><br></td>
	          </tr>
	          <tr class="iw_table_row">
	            <td class="iw_attribute_name"></td>
	            <td>
	            	<button class="btn btn-primary" id="myButton" data-loading-text="Loading..." autocomplete="off" data-toggle="modal" onclick="detail()">상세정보 보기</button>
	          		<div class="btn btn-danger" onclick="box()">바구니에 담기▶</div>
	            </td>
	          </tr>
	        </table>
	          	
	      </div>
    	</div>
    	
	<div class="modal fade" id="js-modal" data-backdrop="static">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	    	<div class="modal-body">
	    		<button class="close" id="close">
	    			<span>&times;</span>
	    		</button>
    			<h2 style="text-align:center;" id="md-name"></h2>
   				<div class="wrapper">
		            <div class="jcarousel-wrapper">
		                <div class="jcarousel">
		                    <ul id="md-image">
		                      
		                    </ul>
		                </div>
		
		                <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
		                <a href="#" class="jcarousel-control-next">&rsaquo;</a>
		                
		                <p class="jcarousel-pagination">
		                    
		                </p>
		           
			           
					</div>
		        </div>
				<button id="review" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				  	구글 댓글 보기
				</button>
				<div class="collapse" id="collapseExample">
				  <div class="well" id="md-review">
				  </div>
				</div>
	    	</div>
	    </div>
	  </div>
	</div>	
	
	<div class="modal fade" id="sp-modal" data-backdrop="static">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	    	<div class="modal-body" >
	    		<button class="close" id="close2">
	    			<span>&times;</span>
	    		</button>
	    		<div class="row">
		    		<div class="col-sm-12" id="sp-origin"></div>
		    		<div class="col-sm-12" id="sp-waypoints" style="overflow-y:scroll;"></div>
		    		<div class="col-sm-12" id="sp-destination"></div>
	    		</div>
	    	</div>
	    </div>
	  </div>
	</div>
	
	
	
 	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj0yu46KIPovjgRNFnBGDuAw_XOAoG8jc&libraries=places&callback=initMap">
    </script>
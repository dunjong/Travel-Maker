<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
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
    </style>

	<!-- Search -->

	

<script>
//변수 선언
var map,infoWindow,servicePlace;
var markers=[];
var hostnameRegexp = new RegExp('^https?://.+?/');
var nearSearchType='lodging';
var origin='방콕, 태국';
var destination='공항, 방콕, 태국';
var spots=[];
var directionsService;
var directionsRenderer;
var keyword='';
var md_image;	
var md_name;
var md_review;
var img;
var span;
var hotelInfo=[{'hotel':origin}]
var spotInfo=[]
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
	             	   hotelInfo.push({'hotel':place})
	               }
	               else{
	            	   spotInfo.push({'spot':place})
	               }
	            });
  }////placeDetail
  
  function box(){
	 
	  var sp_waypoints=document.getElementById('sp-waypoints');
	  sp_waypoints.innerHTML=''
	  if(nearSearchType=='lodging'){
		  hotelInfo=[]
		  placeDetailnSave($('#iw-id').html())
		  
		  origin=$('#iw-lanlng').html();
		  displayRoute(origin, destination, directionsService,
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
	  origin='방콕, 태국'
	  hotelInfo=[{'hotel':origin}]
	  spotInfo=[];
	  spots=[];
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
	  	logo='https://www.iconsdb.com/icons/preview/deep-pink/hotel-2-xxl.png';
	  }
	  else if(nearSearchType=='restaurant'){
		logo='https://www.iconsdb.com/icons/preview/deep-pink/pizza-3-xxl.png';
	  }
	  else{
		logo='https://www.iconsdb.com/icons/preview/barbie-pink/star-6-xxl.png';
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
         google.maps.event.addListener(marker, 'click', showInfoWindow);
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
	  	logo='https://www.iconsdb.com/icons/preview/deep-pink/hotel-2-xxl.png';
	  }
	  else if(nearSearchType=='restaurant'){
		logo='https://www.iconsdb.com/icons/preview/deep-pink/pizza-3-xxl.png';
	  }
	  else{
		logo='https://www.iconsdb.com/icons/preview/barbie-pink/star-6-xxl.png';
	  }
	 
     document.getElementById('iw-icon').innerHTML = '<img class="hotelIcon" ' +
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
		   img = document.createElement('img');
		   img.alt='no image';
		   if(place.photos!=undefined && place.photos[i]!=undefined)
           img.src=place.photos[i].getUrl({maxWidth: 300, maxHeight: 200})
		   md_image.appendChild(img);
		  
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
	 if(hotelInfo[0].hotel.name!=undefined)
	 	 sp_origin.textContent='출발지:'+hotelInfo[0].hotel.name
	 else
		 sp_origin.textContent='출발지:'+hotelInfo[0].hotel
	 var spot=''
	 for(var i=0;i<spots.length;i++){
		 spot+=spots[i].location+' '
	 }
	 
	 var sp_waypoints=document.getElementById('sp-waypoints');
	//확인용
	 	console.log('spotInfo:',spotInfo)
	 //
	 if(spotInfo[0]!=undefined){
		 sp_waypoints.innerHTML=''
		 
		 for(var i=0;i<spotInfo.length;i++){
			var h4=document.createElement('h4')
			h4.textContent='◆'+(i+1)+'번째 경유지:'
			sp_waypoints.appendChild(h4)
			h4=document.createElement('h4')
			h4.textContent='이름:'+spotInfo[i].spot.name
			sp_waypoints.appendChild(h4)
			h4=document.createElement('h4')
	 	 	h4.textContent='주소:'+spotInfo[i].spot.formatted_address
	 	 	sp_waypoints.appendChild(h4)
	 	 	h4=document.createElement('h4')
	 	 	h4.textContent='위치 아이디:'+spotInfo[i].spot.id
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
	  $('#js-modal img').css({width:'300px',height:'200px',margin:'10px',border:'1rem solid'})
	  $('#js-modal h4').css({color:'black',margin:'10px',border:'thick double #32a1ce'})
	  $('#md-image').css({marginLeft:'60px'})
	  $('#js-modal span').css({color:'black',textAlign:'center',fontWeigt:'bord'})
	  
	  $('#js-modal').modal('show');
	  $('#close').on('click',function(){
			$('#js-modal').modal('hide');
		});
 }////detail
 
 
</script>	
	
		
	<div class="intro">
		
		<div class="intro_container" style="margin-left:150px;width:80%">
			<div class="row">
				<div class="col-sm-3"> 
				</div>
				<div class="col-sm-7">
					<h3><span id="type">맵을 눌러서 주변 <strong>호텔</strong>을 확인해보세요!</span></h3>
				</div>
			</div>
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
							<div class="btn btn-warning" onclick="clearBox();">전체 삭제!</div>
							<div class="btn btn-danger" onclick="showPlan()" >플랜 보기!</div>
							<div class="btn btn-info">플랜  저장!</div>
							<h4>전체 거리: <span id="total"></span></h4>
						</div>
					</div>
				</div>
				<div class="col-sm-9" style="height: 700px;margin-bottom:20px">
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
	          <tr id="iw-lanlng-row" class="iw_table_row">
	            <td class="iw_attribute_name">위치 아이디: </td>
	            <td id="iw-id"></td>
	          </tr>
	          
	        </table>
	          	<div class="btn btn-primary" data-toggle="modal" onclick="detail()">상세정보 보기</div>
	          	<div class="btn btn-danger" onclick="box()">바구니에 담기▶</div>
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
    			<div id="md-image">
        		</div>
        		<div id="md-review">
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
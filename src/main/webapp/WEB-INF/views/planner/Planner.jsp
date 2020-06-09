<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #map {
        height: 100%;
        width: 100%;
      }
      #right-panel {
        float: right;
        width: 80%;
        height: 100%;
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
         color:#ff9999;
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
    </style>

	<!-- Search -->

	

<script>
//변수 선언

var marker;
var origin='런던,영국';
var destination='로마,이탈리아';
var waypoints=[];
var directionsService;
var directionsRenderer;



 

 
  
function addCity(){
	waypoints.push({location:'파리,프랑스'},{location:'프라하,체코'});
	displayRoute(origin, destination, directionsService,
		       directionsRenderer,waypoints);
} 
  


 //1] 페이지에 맵 표시
 function initMap() {
	 
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
    center: {lat: 129.4878800486111, lng: 95.7239385944053},  // 처음 지도 센터 위치: 발리 덴파사르.
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
     draggable: true,//드래그 가능
     map: map,//맵
     panel: document.getElementById('right-panel')//패널 dom 객체
   });
   

   directionsRenderer.addListener('directions_changed', function() {
     computeTotalDistance(directionsRenderer.getDirections());//총 거리 계산
   });
   //루트와 거리계산,네비게이션 끝
   
  
 
   //displayRoute 함수에 출발지와 도착지 설정
   displayRoute(origin, destination, directionsService,
       directionsRenderer,waypoints);
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
	   console.log('event.latLng',event.latLng)
	     
	   });////map.addListener
   
 }////initMap

 
 //2] 맵 위에 루트 표시
 function displayRoute(origin, destination, service, display, waypoints) {
     service.route({
     origin: origin,//출발지
     destination: destination,//도착지
     waypoints:waypoints,
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
 
 
</script>	
	
		
	<div class="intro">
		
		<div class="intro_container" style="margin-left:150px;width:80%">
			
			<div class="row" style="margin-left:10px;" >
				<div class="col-sm-8" style="height: 700px;margin-bottom:20px">
					<div id="map"></div>
				</div>
				<div id="right-panel" class="col-sm-4" style="height: 700px; width: 100px;margin-bottom:20px;overflow:scroll;">
					<p>Total Distance: <span id="total"></span></p>
				</div>
			</div>
			<div id="types" class="row" style="margin-left:10px;" >
				<div class="form-inline">
					  <div class="form-group">
					    <label>Name</label>
					    <input type="text" class="form-control" id="exampleInputName2" placeholder="도시 검색">
					  </div>
					  <div type="submit" class="btn btn-warning" onclick="addCity()"> 도시 추가</div>
				</div>
				<div class="col-sm-4">
					<form action="<c:url value='/TravelMaker/Plan.kosmo'/>">
						<button class="btn btn-danger" onclick="plan()">플랜 보기 버튼:누르세요!</button>
					</form>
				</div>
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
	            <td class="iw_attribute_name">Address:</td>
	            <td id="iw-address"></td>
	          </tr>
	          <tr id="iw-phone-row" class="iw_table_row">
	            <td class="iw_attribute_name">Telephone:</td>
	            <td id="iw-phone"></td>
	          </tr>
	          <tr id="iw-rating-row" class="iw_table_row">
	            <td class="iw_attribute_name">Rating:</td>
	            <td id="iw-rating"></td>
	          </tr>
	          <tr id="iw-website-row" class="iw_table_row">
	            <td class="iw_attribute_name">Website:</td>
	            <td id="iw-website"></td>
	          </tr>
	          <tr id="iw-lanlng-row" class="iw_table_row">
	            <td class="iw_attribute_name">lanlng:</td>
	            <td id="iw-lanlng"></td>
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
	
	
	
 	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj0yu46KIPovjgRNFnBGDuAw_XOAoG8jc&libraries=places&callback=initMap">
    </script>
			
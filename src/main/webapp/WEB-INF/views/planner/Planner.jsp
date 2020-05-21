<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height:100%;
        width:100%;
      }
      #places{
      	position:relative;
      	list-style-type: none;
        padding: 0;
        margin: 10px;
      }
       
    </style>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <body>
  
    
    <p>Click on the map to add markers.</p>
    <script>

      // In the following example, markers appear when the user clicks on the map.
      // The markers are stored in an array.
      // The user can then click an option to hide, show or delete the markers.
      var map;
      var markers = [];
      var haightAshbury = {lat: -8.672062, lng: 115.231609};//발리 덴파사르
      var placesList;
      var imageList;
      var child;
      var img;
      var br;
      var settings;
      var spot='restaurant';
      
      function initMap() {
        
    	
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: haightAshbury
        });
        
       
        

        // This event listener will call addMarker() when the map is clicked.
        map.addListener('click', function(event) {
          addMarker(event.latLng);
          haightAshbury=event.latLng;
          imageList=$('#images');
          placesList=$('#places');
          remove();
          initMap();
        });

        // Adds a marker at the center of the map.
        addMarker(haightAshbury);
        
        
     // 2] 장소 정보 찾는 코드
        // Create the places service.
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch(
            {location: haightAshbury, radius: 1000, type: [spot]},
            function(results, status, pagination) {
              if (status !== 'OK') return;
              
              createMarkers(results);
              
            });
	  
	  
        
      }///initMap

      // Adds a marker to the map and push to the array.
      function addMarker(location) {
    	setMapOnAll(null);
        markers = [];
        var marker = new google.maps.Marker({
          position: location,
          map: map
        });
        markers.push(marker);
      }

      // Sets the map on all markers in the array.
      function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(map);
        }
      }
      // Deletes all markers in the array by removing references to them.
      function food() {
    	  remove();
    	  spot='restaurant';
    	  initMap();
      }
	  function hotel() {
		  remove();
		  spot='lodging';
    	  initMap();
      }
	  function tour() {
		  remove();
		  spot='night_club';
    	  initMap();
	  }
	  function remove(){
		  child=$('#places table');
          child.remove();
	  }
      
      function createMarkers(places) {
          var bounds = new google.maps.LatLngBounds();
          placesList = document.getElementById('places');
          imageList = document.getElementById('images');
          
          for (var i = 0, place; place = places[i]; i++) {
            var image = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };
  		  
            
            
            var marker = new google.maps.Marker({
              map: map,
              icon: image,
              animation: google.maps.Animation.DROP,
              title: place.name,
              position: place.geometry.location
            });

            bounds.extend(place.geometry.location);
            
            
            
            img = document.createElement('img');
            img.alt='no image';
            if(place.photos!=null){
            	img.src=place.photos[0].getUrl({maxWidth: 300, maxHeight: 200})
            	
            }
            var table=document.createElement('table');
            var table2=document.createElement('table');
            var tr=document.createElement('TR');
            var tr2=document.createElement('TR');
            var tr3=document.createElement('TR');
            var tr4=document.createElement('TR');
            var tr5=document.createElement('TR');
            var tr6=document.createElement('TR');
            var td=document.createElement('TD');
            var td2=document.createElement('TD');
            
            var td_name = document.createElement('td');
            var td_rating = document.createElement('td');
            var td_location = document.createElement('td');
            var td_id = document.createElement('td');
            var td_price_level =document.createElement('td');
            
            td_name.textContent = '식당이름: '+place.name;
            td_rating.textContent='평점:'+place.rating+'점';
            td_location.textContent='위치정보(경도,위도): '+place.geometry.location;
            td_id.textContent='위치아이디: '+place.place_id;
            td_price_level.textContent='가격수준: '+place.price_level;
            
            br=document.createElement('br');
           	
            td.colSpan='5';
           
            
            placesList.appendChild(table);
            table.appendChild(tr);
            tr.appendChild(td);
            td.appendChild(img);
            tr.appendChild(td2);
            td2.appendChild(table2);
            
            table2.appendChild(tr2);
            tr2.appendChild(td_name);
            table2.appendChild(tr3);
            tr3.appendChild(td_rating);
            table2.appendChild(tr4);
            tr4.appendChild(td_location);
            table2.appendChild(tr5);
            tr5.appendChild(td_price_level);
            table2.appendChild(tr6);
            tr6.appendChild(td_id);
           
            
          }
          $('table').css('background-color','yellow');
         
          map.fitBounds(bounds);
        }
      
    </script>

	<!-- Search -->

	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">나의 플래너</div>
						<div class="home_search_content">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="alert alert-normal">
			<div class="row">
					<div class="col-sm-12" style="height: 300px; width: 100px; border: 1px red solid">
						<div class="row" id="map"></div>
					</div>
			</div>
			<div class="row">
				<div class="col-sm-4" style="border: 1px red solid;">
					<img alt="" src="<c:url value='/images/food.jpg'/>" onclick="food();">
				</div>
				<div class="col-sm-4" style="border: 1px red solid;">
					<img alt="" src="<c:url value='/images/tours.jpg'/>" onclick="hotel();">
				</div>
				<div class="col-sm-4" style="border: 1px red solid;">
					<img alt="" src="<c:url value='/images/hotels.jpg'/>" onclick="tour();">
				</div>
			</div>
			
			
			
			
			<div class="row">
				<div class="col-sm-12" style="height: 800px; border: 1px red solid; overflow:scroll; ">
					
					<div id="places">
					
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
	
	
	
	
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj0yu46KIPovjgRNFnBGDuAw_XOAoG8jc&libraries=places&callback=initMap">
    </script>

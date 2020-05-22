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
		  
		  child=$('#places div');
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
	            var div=document.createElement('div');
	            div.className='col-sm-6';
	            var div2=document.createElement('div');
	            div2.className='col-sm-6';
	            
	            var row=document.createElement('div');
	            row.className='row';
	            var row2=document.createElement('div');
	            row2.className='row';
	            
	            var div_name = document.createElement('div');
	            div_name.className='col-sm-12';
	            var div_rating = document.createElement('div');
	            div_rating.className='col-sm-12';
	            var div_location = document.createElement('div');
	            div_location.className='col-sm-12';
				var div_id = document.createElement('div');
  				div_id.className='col-sm-12';
	            var div_price_level =document.createElement('div');
	            div_price_level.className='col-sm-12';
	            
	            div_name.textContent = '이름: '+place.name;
	   			div_rating.textContent='평점:'+place.rating+'점';
	    		div_location.textContent='위치정보(경도,위도): '+place.geometry.location;
	    		div_id.textContent='위치아이디: '+place.place_id;
	    		div_price_level.textContent='가격수준: '+place.price_level;
	           
	            
	            
	          	placesList.appendChild(row);
	            row.appendChild(div);
	           	div.appendChild(img);
	           	row.appendChild(div2);
	           	div2.appendChild(row2);
	           	row2.appendChild(div_name);
	           	row2.appendChild(div_rating);
	           	row2.appendChild(div_location);
				row2.appendChild(div_id);
	           	row2.appendChild(div_price_level);
	           	
	          }
	          $('#places img').css({width:'250px',height:'200px'});
	    	  $('#places .row').css({width: '95%',height: '100%',margin:'10px', padding:'20px', backgroundColor:'white',boxShadow:'1px 1px 1px 1px gray',borderRadius:'11px /11px'})
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
	
	
	<div class="intro">
		<div class="intro_container" style="margin-left:50px;width:80%">
			<div class="row">
					<div class="col-sm-12" style="height: 300px; width: 100px;margin-bottom:20px">
						<div class="row" id="map"></div>
					</div>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<img alt="" src="<c:url value='/images/food.jpg'/>" onclick="food();">
				</div>
				<div class="col-sm-4">
					<img alt="" src="<c:url value='/images/tours.jpg'/>" onclick="hotel();">
				</div>
				<div class="col-sm-4">
					<img alt="" src="<c:url value='/images/hotels.jpg'/>" onclick="tour();">
				</div>
			</div>
			<div id="places" class="alert alert-success" style="padding-right:100px">
			</div>
		</div>
	</div>
	
	
	
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj0yu46KIPovjgRNFnBGDuAw_XOAoG8jc&libraries=places&callback=initMap">
    </script>

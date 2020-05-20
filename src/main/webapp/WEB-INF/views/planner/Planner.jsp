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
      var child;
      var img;
      var br;
      function initMap() {
        
    	
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: haightAshbury
        });
        

        // This event listener will call addMarker() when the map is clicked.
        map.addListener('click', function(event) {
          addMarker(event.latLng);
          haightAshbury=event.latLng;
          placesList=$('#places');
          child=$('#places li');
          img=$('#places img');
          br=$('#places br');
          child.remove();
          img.remove();
          br.remove();
          initMap();
        });

        // Adds a marker at the center of the map.
        addMarker(haightAshbury);
        
        
     // 2] 장소 정보 찾는 코드
        // Create the places service.
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch(
            {location: haightAshbury, radius: 1000, type: ['restaurant']},
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
      function deleteMarkers() {
    	setMapOnAll(null);
        markers = [];
      }
      
      function createMarkers(places) {
          var bounds = new google.maps.LatLngBounds();
          placesList = document.getElementById('places');

          
          
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
            
            
            
            
            
            var li_name = document.createElement('li');
            var li_rating = document.createElement('li');
            var li_location = document.createElement('li');
            var li_id = document.createElement('li');
            var li_price_level =document.createElement('li');
            
            li_name.textContent = '식당이름: '+place.name;
            li_rating.textContent='평점:'+place.rating+'점';
            li_location.textContent='위치정보(경도,위도): '+place.geometry.location;
            li_id.textContent='위치아이디: '+place.place_id;
            li_price_level.textContent='가격수준: '+place.price_level;
            
            
            if(place.photos==null){
            	  continue;
              }
            img = document.createElement('img');
            img.alt='no image';
            img.src=place.photos[0].getUrl({maxWidth: 300, maxHeight: 200})
           	$('img').css({height:'200px',width:'250px'});
            $('#places li').css({border: '1px black solid',color:'black'});
            
            br=document.createElement('br');
            
            placesList.appendChild(img);
            placesList.appendChild(li_name);
            placesList.appendChild(li_rating);
            placesList.appendChild(li_location);
            placesList.appendChild(li_price_level);
            placesList.appendChild(li_id);
            
            placesList.appendChild(br);
            placesList.appendChild(br);
            
          }
          map.fitBounds(bounds);
        }
      
    </script>
    <script>
	$(function(){
		$('#ad').click(function(){
			var settings = {
		    		"async": true,
		    		"crossDomain": true,
		    		"url": "https://tripadvisor1.p.rapidapi.com/hotels/list-by-latlng?lang=ko_KR&hotel_class=1%252C2%252C3&limit=30&adults=1&rooms=1&currency=USD&latitude=-8.672062&longitude=115.231609",
		    		"method": "GET",
		    		"headers": {
		    			"x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
		    			"x-rapidapi-key": "9095c68cdcmshe3e836ea4f7917bp1fa2a1jsn44f214b94ffc"
		    		}
		    	}

		    	$.ajax(settings).done(function (response) {
		    		console.log(response.data[0])
		    		$('#div1').text(response.data[0].name);
		    		$('#img1').prop("src", response.data[0].photo.images.thumbnail.url);
		    	});
			
		})
		
	})
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
				<div class="col-sm-4" style="height: 800px; width: 30px; border: 1px red solid; overflow:scroll; ">
					<h3 style="text-align:center">주변 맛집</h3>
					<ul id="places"></ul>
				</div>
				<div class="col-sm-4" style="height: 800px; width: 30px; border: 1px red solid">
					<h3 style="text-align:center">주변 명소</h3>
					
				</div>
				<div class="col-sm-4" style="height: 800px; width: 30px; border: 1px red solid">
					<h3 style="text-align:center">주변 호텔</h3>
					<div id="div1"><img id="img1"/></div>
				</div>
			</div>
			
		</div>
	</div>
	
	
	
	
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj0yu46KIPovjgRNFnBGDuAw_XOAoG8jc&libraries=places&callback=initMap">
    </script>

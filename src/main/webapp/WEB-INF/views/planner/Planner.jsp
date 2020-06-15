 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 800px;
      }
      /* Optional: Makes the sample page fill the window. */
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
        margin-left: -52px;
      }
    </style>
    <div class="intro">
		
		<div class="intro_container" style="margin-left:150px;width:80%">
			<div class="row">
			    <div id="floating-panel" onclick="drop()">
			      <h3>마커를 클릭하여 세부일정을 짜세요!</h3> 
			    </div>
			    <div class="col-sm-12" id="map"></div>
			    
		    </div>
		</div>
	</div>
	<form hidden="true" id="frm">
		<input hidden="true" name="origin" value="방콕,태국" />
		<input hidden="true" name="destination" value="공항,방콕,태국" />
	</form>
    <script>

      // If you're adding a number of markers, you may want to drop them on the map
      // consecutively rather than all at once. This example shows how to use
      // window.setTimeout() to space your markers' animation.
	  var servicePlace;
      var neighborhoods = [
        {lat: 13.752967686985727, lng: 100.5029815077901},
        {lat: 7.915127681368687, lng: 98.33354269870432}
      ];

      var markers = [];
      var map;
      var cities = [];
      var test ;
      
      
      function searchCity(){
    	  
      }

      function initMap() {
    	drop()
    	test  = new google.maps.LatLng(11.148595261550177,100.13194482923747);
    	console.log('test',test)
    	
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: {lat: 11.148595261550177, lng: 100.13194482923747}
        });
        map.addListener('click', function(event){
      	  console.log('event',event.latLng.lat())
      	  console.log('event',event.latLng.lng())
        })
      }

      function drop() {
        clearMarkers();
        for (var i = 0; i < neighborhoods.length; i++) {
          addMarkerWithTimeout(neighborhoods[i], i * 200);
        }
      }

      function addMarkerWithTimeout(position, timeout) {
        window.setTimeout(function() {
        	var marker=new google.maps.Marker({
                position: position,
                map: map,
                animation: google.maps.Animation.DROP
              })
        	marker.addListener('click', function(event){
          	  console.log('event',event)
          	  $('#frm').prop('action','<c:url value="/TravelMaker/Plan.kosmo"/>')
          	  
          	  $('#frm').submit()
          	  
            })
          markers.push(marker);
        }, timeout);
      }

      function clearMarkers() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }
      markers[0]
     
      
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDj0yu46KIPovjgRNFnBGDuAw_XOAoG8jc&libraries=places&callback=initMap">
    </script>
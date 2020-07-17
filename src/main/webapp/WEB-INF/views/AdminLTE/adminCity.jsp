<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Travel-Maker Admin Page</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
   href="<c:url value='/plugins2/fontawesome-free/css/all.min.css'/>">
<!-- Ionicons -->
<link rel="stylesheet"
   href="<c:url value='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'/>">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
   href="<c:url value='/plugins2/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'/>">
<!-- iCheck -->
<link rel="stylesheet"
   href="<c:url value='/plugins2/icheck-bootstrap/icheck-bootstrap.min.css'/>">
<!-- JQVMap -->
<!-- Theme style -->
<link rel="stylesheet"
   href="<c:url value='/dist/css/adminlte.min.css'/>">
<!-- overlayScrollbars -->
<link rel="stylesheet"
   href="<c:url value='/plugins2/overlayScrollbars/css/OverlayScrollbars.min.css'/>">
<!-- Daterange picker -->
<link rel="stylesheet"
   href="<c:url value='/plugins2/daterangepicker/daterangepicker.css'/>">
<!-- summernote -->
<!-- Google Font: Source Sans Pro -->
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
   rel="stylesheet">
<style type="text/css">
     /* Always set the map height explicitly to define the size of the div
      * element that contains the map. */
     #map {
       margin:70px;
       height: 800px;
       width:900px;
     }

     /* Optional: Makes the sample page fill the window. */
     html,
     body {
       height: 100%;
       margin: 0;
       padding: 0;
     }

     .controls {
       background-color: #fff;
       border-radius: 2px;
       border: 1px solid transparent;
       box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
       box-sizing: border-box;
       font-family: Roboto;
       font-size: 15px;
       font-weight: 300;
       height: 29px;
       margin-left: 17px;
       margin-top: 10px;
       outline: none;
       padding: 0 11px 0 13px;
       text-overflow: ellipsis;
       width: 400px;
     }

     .controls:focus {
       border-color: #4d90fe;
     }

     .title {
       font-weight: bold;
     }

     #infowindow-content {
       display: none;
     }

     #map #infowindow-content {
       display: inline;
     }
</style>
<script>
	function save_auto_spot(){
		console.log('도시이름:',$('#city_name').val());
		console.log('명소이름:',$('#spot_name').val());
		console.log('위치아이디:',$('#spot_id').val());
		console.log('위치위도경도:',$('#spot_latlng').val());
		console.log('일차:',$('#auto_plan_date').val());
	}

    (function(exports) {
      "use strict";

      // This sample uses the Place Autocomplete widget to allow the user to search
      // for and select a place. The sample then displays an info window containing
      // the place ID and other information about the place that the user has
      // selected.
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
      function initMap() {
        var map = new google.maps.Map(document.getElementById("map"), {
          center: {
            lat: -33.8688,
            lng: 151.2195
          },
          zoom: 13
        });
        var input = document.getElementById("pac-input");
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo("bounds", map); // Specify just the place data fields that you need.

        autocomplete.setFields(["place_id", "geometry", "name"]);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById("infowindow-content");
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map
        });
        marker.addListener("click", function() {
          infowindow.open(map, marker);
        });
        autocomplete.addListener("place_changed", function() {
          infowindow.close();
          var place = autocomplete.getPlace();

          if (!place.geometry) {
            return;
          }

          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          } // Set the position of the marker using the place ID and location.

          marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
          });
          marker.setVisible(true);
          infowindowContent.children["place-name"].textContent = place.name;
          infowindowContent.children["place-id"].textContent = place.place_id;
          infowindowContent.children["place-address"].textContent =place.formatted_address;
          infowindowContent.children["place-latlng"].textContent ="1234";
          console.log('place:',place);
          $('#spot_name').prop('value',place.name)
          $('#spot_id').prop('value',place.place_id)
          $('#spot_latlng').prop('value',place.geometry.location.lat()+','+place.geometry.location.lng())
          
          infowindow.open(map, marker);
        });
      }

      exports.initMap = initMap;
    })((this.window = this.window || {}));
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
   <div class="wrapper">
      <!-- Navbar -->
      <nav
         class="main-header navbar navbar-expand navbar-white navbar-light">
         <!-- Left navbar links -->
         <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" data-widget="pushmenu"
               href="#" role="button"><i class="fas fa-bars"></i></a></li>
            <li class="nav-item d-none d-sm-inline-block"><a
               href=<c:url value="/"/> class="nav-link">Home</a></li>
         </ul>

         <!-- Right navbar links -->
         <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link"
               data-widget="control-sidebar" data-slide="true" href="#"
               role="button"> <i class="fas fa-th-large"></i>
            </a></li>
         </ul>
      </nav>
      <!-- /.navbar -->

      <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
         <!-- Brand Logo -->
         <a href="index3.html" class="brand-link"> <img
            src="<c:url value='/dist/img/AdminLTELogo.png'/>"
            alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
            style="opacity: .8"> <span
            class="brand-text font-weight-light">Travel-Maker</span>
         </a>

         <!-- Sidebar -->
         <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
               <div class="image">
                  <img
                     src="<c:url value='/dist/img/KakaoTalk_20200619_180642584_02.jpg'/>"
                     class="img-circle elevation-2" alt="User Image">
               </div>
               <div class="info">
                  <a href="#" class="d-block">관리자</a>
               </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column"
                  data-widget="treeview" role="menu" data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                  <li class="nav-item has-treeview menu-open"><a href="#"
                     class="nav-link active"> <i
                        class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                           관리자 메뉴 <i class="right fas fa-angle-left"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="admin1.kosmo"
                           class="nav-link"> <i class="far fa-circle nav-icon"></i>
                              <p>페이지 관리</p>
                        </a></li>
                        <li class="nav-item"><a href="admin2.kosmo"
                           class="nav-link active"> <i class="far fa-circle nav-icon"></i>
                              <p>회원관리</p>
                        </a></li>

                     </ul></li>

                  </li>

                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                           리뷰 및 공지사항 관리 <i class="right fas fa-angle-left"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="ReviewSearch.kosmo"
                           class="nav-link"> <i class="far fa-circle nav-icon"></i>
                              <p>리뷰관리</p>
                        </a></li>
                        <li class="nav-item"><a href="CustomerService.kosmo"
                           class="nav-link"> <i class="far fa-circle nav-icon"></i>
                              <p>공지사항 관리</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item"><a href="pages/gallery.html"
                     class="nav-link"> <i class="nav-icon far fa-image"></i>
                        <p>도시관리</p>
                  </a></li>
            </nav>
            <!-- /.sidebar-menu -->
         </div>
         <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <div class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1 class="m-0 text-dark">여행사 패키지 저장</h1>
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard v1</li>
                     </ol>
                  </div>
                  <!-- /.col -->
               </div>
               <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
         </div>
         <!-- /.content-header -->

         <!-- Main content -->
         <section class="content">
	            	 <div class="row">
	            		<div class="col-sm-6">
		            		 <div class="row">
		            		 	
			            		<div class="col-sm-6">
				            		도시 이름
				            	</div>
				            	<div class="col-sm-6">
				            		<input id="city_name" type="text" name="city_name">
				            	</div>
				            	<div class="col-sm-6">
				            		명소 이름
				            	</div>
				            	<div class="col-sm-6">
				            		<input id="spot_name" type="text" name="spot_name">
				            	</div>
				            	<div class="col-sm-6">
				            		위치 아이디
				            	</div>
				            	<div class="col-sm-6">
			            			<input id="spot_id" type="text"  name="spot_id">
			            		</div>
			            		<div class="col-sm-6">
				            		위치 위도 경도
				            	</div>
			            		<div class="col-sm-6">
			            			<input id="spot_latlng" type="text"  name="spot_latlng">
			            		</div>
			            		<div class="col-sm-6">
				            		일차
				            	</div>
				            	<div class="col-sm-6">
				            		<input id="auto_plan_date" value="1" max="5" min="1" type="number" name="auto_plan_date">
				            	</div>
			            	</div>
		            	</div>
		            	
		            	<div class="col-sm-6">
		            		<br>
		            		<button class="btn btn-info" onclick="save_auto_spot()">auto_plan행 추가</button>
		            	</div>
	            	</div>
            	<div style="display: none">
			      <input
			        id="pac-input"
			        class="controls"
			        type="text"
			        placeholder="Enter a location"
			      />
			    </div>
			    <div id="map"></div>
			    <div id="infowindow-content">
			      <span id="place-name" class="title"></span><br />
			      <strong>Place ID:</strong> <span id="place-id"></span><br />
			      <span id="place-address"></span>
			      <span id="place-latlng" class="title"></span><br />
			    </div>
            
            
            
         </section>
         <!-- /.content -->
      </div>

   </div>
   <!-- /.content-wrapper -->
   <footer class="main-footer">
      <strong>Copyright &copy; 2014-2019 <a
         href="http://adminlte.io">AdminLTE.io</a>.
      </strong> All rights reserved.
      <div class="float-right d-none d-sm-inline-block">
         <b>Version</b> 3.0.5
      </div>
   </footer>

   <!-- Control Sidebar -->
   <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
   </aside>
   <!-- /.control-sidebar -->
   </div>
   <!-- ./wrapper -->
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=${GoogleMapApiKey}&libraries=places&callback=initMap">
    </script>
   <!-- jQuery -->
   <script src="<c:url value='/plugins2/jquery/jquery.min.js'/>"></script>
   <!-- jQuery UI 1.11.4 -->
   <script src="<c:url value='/plugins2/jquery-ui/jquery-ui.min.js'/>"></script>
   <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
   <script>
      $.widget.bridge('uibutton', $.ui.button)
   </script>
   <!-- Bootstrap 4 -->
   <script
      src="<c:url value='/plugins2/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
   <!-- jQuery Knob Chart -->
   <script src="<c:url value='/plugins2/jquery-knob/jquery.knob.min.js'/>"></script>
   <!-- daterangepicker -->
   <script src="<c:url value='/plugins2/moment/moment.min.js'/>"></script>
   <!-- Tempusdominus Bootstrap 4 -->
   <script
      src="<c:url value='/plugins2/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'/>"></script>
   <!-- Summernote -->
   <!-- overlayScrollbars -->
   <script
      src="<c:url value='/plugins2/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
   <!-- AdminLTE App -->
   <script src="<c:url value='/dist/js/adminlte.js'/>"></script>
   <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
   <script src="<c:url value='/dist/js/pages/dashboard.js'/>"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="<c:url value='/dist/js/demo.js'/>"></script>
   
</body>
</html>
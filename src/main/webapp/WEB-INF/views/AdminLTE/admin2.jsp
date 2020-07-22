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
<link rel="stylesheet"
	href="<c:url value='/plugins2/summernote/summernote-bs4.css'/>">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
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
			<a href="admin1.kosmo" class="brand-link"> <img
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
									리뷰 및 도시 관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="ReviewSearch.kosmo"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>리뷰관리</p>
								</a></li>
								<li class="nav-item"><a href="adminCity.kosmo"
									class="nav-link"> <i class="nav-icon far fa-image"></i>
										<p>도시관리</p>
								</a></li>
							</ul></li>
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
							<h1 class="m-0 text-dark">Member Controll</h1>
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
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">회원 정보</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table id="example2" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>NO</th>
												<th>이름</th>
												<th>아이디</th>
												<th>비밀번호</th>
												<th>연령대</th>
												<th>성별</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not isEmpty}">
												<c:forEach items="${list}" var="item" varStatus="loop">
													<tr>
														<td>${item.id_no}</td>
														<td>${item.user_name}</td>
														<td>${item.user_id}</td>
														<td>${item.user_pwd}</td>
														<td>${item.user_rrn}</td>
														<td>${item.user_gender}</td>
														<td><input type="checkbox"></td>
													</tr>
												</c:forEach>
											</c:if>

										</tbody>
										<tfoot>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="row" style="text-align: right;">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="example2_info" role="status"
											aria-live="polite">1/10 page</div>
									</div>
									<div class="col-sm-12 col-md-7" style="text-align: right;">
										<div class="dataTables_paginate paging_simple_numbers"
											id="example2_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous disabled"
													id="example2_previous"><a href="#"
													aria-controls="example2" data-dt-idx="0" tabindex="0"
													class="page-link">Previous</a></li>
												<li class="paginate_button page-item active"><a
													href="#" aria-controls="example2" data-dt-idx="1"
													tabindex="0" class="page-link">1</a></li>
												<div class="col-sm-12 col-md-7" style="text-align: right;">
													<button id="deletebtn">블랙</button>
												</div>
											</ul>
										</div>
									</div>
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

					</div>
					<!-- /.container-fluid -->
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
	<!-- ChartJS -->
	<script src="<c:url value='/plugins2/chart.js/Chart.min.js'/>"></script>
	<!-- daterangepicker -->
	<script src="<c:url value='/plugins2/moment/moment.min.js'/>"></script>
	<script
		src="<c:url value='/plugins2/daterangepicker/daterangepicker.js'/>"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<c:url value='/plugins2/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'/>"></script>
	<!-- Summernote -->
	<script
		src="<c:url value='/plugins2/summernote/summernote-bs4.min.js'/>"></script>
	<!-- overlayScrollbars -->
	<script
		src="<c:url value='/plugins2/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/dist/js/adminlte.js'/>"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="<c:url value='/dist/js/pages/dashboard.js'/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/dist/js/demo.js'/>"></script>
	<script>
		
	</script>
</body>
</html>
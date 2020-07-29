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
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>페이지 관리</p>
								</a></li>
								<li class="nav-item"><a href="admin2.kosmo"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
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
								</a></li></li>
						<li class="nav-item"><a href="adminCity.kosmo"
							class="nav-link"> <i class="nav-icon far fa-image"></i>
								<p>도시관리</p>
						</a></li>
					</ul>
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
							<h1 class="m-0 text-dark">Preview</h1>
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
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3>50 명</h3>

								<p>예약자 수</p>
							</div>
							<div class="icon">
								<i class="ion ion-bag"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-success">
							<div class="inner">
								<h3>105명</h3>

								<p>금주 방문자 수</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer">More info<i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-warning">
							<div class="inner">
								<h3>${memberCount}명</h3>

								<p>회원수</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<a href="admin2.kosmo" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-danger">
							<div class="inner">
								<h3>COVID-19</h3>
								<p>실시간 코로나 현황 및 이슈</p>
							</div>
							<div class="icon">
								<i class="ion ion-logo-freebsd-devil"></i>
							</div>
							<a
								href="http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=11&ncvContSeq=&contSeq=&board_id=&gubun="
								class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<section class="col-lg-8 connectedSortable">
						<!-- Custom tabs (Charts with tabs)-->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">
									<i class="fas fa-chart-pie mr-1"></i> 금주 방문자 그래프
								</h3>
								<div class="card-tools">
									<ul class="nav nav-pills ml-auto">
										<li class="nav-item"><a class="nav-link active"
											href="#revenue-chart" data-toggle="tab">굴곡형</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#sales-chart" data-toggle="tab">도넛형</a></li>
									</ul>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="tab-content p-0">
									<!-- Morris chart - Sales -->
									<div class="chart tab-pane active" id="revenue-chart"
										style="position: relative; height: 550px;">
										<canvas id="bar-chart" width="800" height="450"></canvas>
									</div>
									<div class="chart tab-pane" id="sales-chart"
										style="position: relative; height: 450;">
										<canvas id="pie-chart" width="800" style="height: 450;"></canvas>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</section>
					<!-- TO DO List -->
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">
								<i class="ion ion-clipboard mr-1"></i> To Do List
							</h3>

							<div class="card-tools">
								<ul class="pagination pagination-sm">
									<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
									<li class="page-item"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
								</ul>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<ul class="todo-list" data-widget="todo-list">
								<li>
									<!-- drag handle --> <span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span> <!-- checkbox -->
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo1" id="todoCheck1">
										<label for="todoCheck1"></label>
									</div> <!-- todo text --> <span class="text">방문자수 확인하기</span> <!-- Emphasis label -->
									<small class="badge badge-danger"><i
										class="far fa-clock"></i> 2 mins</small> <!-- General tools such as edit or delete-->
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div>
								</li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo2" id="todoCheck2"
											checked> <label for="todoCheck2"></label>
									</div> <span class="text">현재 예약현황 확인하기</span> <small
									class="badge badge-info"><i class="far fa-clock"></i> 4
										hours</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo3" id="todoCheck3">
										<label for="todoCheck3"></label>
									</div> <span class="text">리뷰 및 공지사항 체크</span> <small
									class="badge badge-warning"><i class="far fa-clock"></i>
										1 day</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo4" id="todoCheck4">
										<label for="todoCheck4"></label>
									</div> <span class="text">깃 허브 체크 </span> <small
									class="badge badge-success"><i class="far fa-clock"></i>
										3 days</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo5" id="todoCheck5">
										<label for="todoCheck5"></label>
									</div> <span class="text">이번달 인기여행지 자료 확인</span> <small
									class="badge badge-primary"><i class="far fa-clock"></i>
										1 week</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo6" id="todoCheck6">
										<label for="todoCheck6"></label>
									</div> <span class="text">코로나 관련 이슈 확인 하기</span> <small
									class="badge badge-secondary"><i class="far fa-clock"></i>
										1 month</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo4" id="todoCheck4">
										<label for="todoCheck4"></label>
									</div> <span class="text">회원 블랙여부 확인하기 </span> <small
									class="badge badge-success"><i class="far fa-clock"></i>
										3 days</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo5" id="todoCheck5"> 
										<label for="todoCheck5"></label>
									</div> <span class="text">그동한 고생했어</span> <small
									class="badge badge-primary"><i class="far fa-clock"></i>
										1 week</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo6" id="todoCheck6">
										<label for="todoCheck6"></label>
									</div> <span class="text">마지막 까지 화이팅~!</span> <small
									class="badge badge-secondary"><i class="far fa-clock"></i>
										1 month</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
							</ul>
						</div>
						<!-- /.card-body -->
						<div class="card-footer clearfix">
							<button type="button" class="btn btn-info float-right">
								<i class="fas fa-plus"></i> Add item
							</button>
						</div>
					</div>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
			<!-- Map card -->
			<section class="col-lg-8 connectedSortable">
				<!-- solid sales graph -->
				<div class="card bg-gradient-info">
					<div class="card-header border-0">
						<h3 class="card-title">
							<i class="fas fa-th mr-1"></i> 예약 현황 그래프
						</h3>

						<div class="card-tools">
							<button type="button" class="btn bg-info btn-sm"
								data-card-widget="collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn bg-info btn-sm"
								data-card-widget="remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body" style="background-color: white">
						<canvas class="chart" id="line-chart"
							style="min-height: 300px; height: 300px; max-height: 600px; max-width: 130%;"></canvas>
					</div>
					<!-- /.card-body -->
					<div class="card-footer bg-transparent">
						<div class="row">
							<div class="col-4 text-center">
								<input type="text" class="knob" data-readonly="true" value="16"
									data-width="60" data-height="60" data-fgColor="#05fce4">

								<div class="text-white">다낭</div>
							</div>
							<!-- ./col -->
							<div class="col-4 text-center">
								<input type="text" class="knob" data-readonly="true" value="13"
									data-width="60" data-height="60" data-fgColor="#05fce4">

								<div class="text-white">세부</div>
							</div>
							<!-- ./col -->
							<div class="col-4 text-center">
								<input type="text" class="knob" data-readonly="true" value="10"
									data-width="60" data-height="60" data-fgColor="#05fce4">

								<div class="text-white">방콕</div>
							</div>
							<!-- ./col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.card-footer -->
				</div>
				<!-- /.card -->
			</section>
			<!-- right col -->
			<!-- right col (We are only adding the ID to make the widgets sortable)-->
		</div>
		<!-- /.row (main row) -->
	</div>
	<!-- /.container-fluid -->

	<!-- /.content -->
	<!-- /.content-wrapper -->
	<footer class="main-footer">
		<strong>Copyright &copy; 2020 <a href="http://adminlte.io">Travel_maker</a>.
		</strong> All rights reserved.
		<div class="float-right d-none d-sm-inline-block">
			<b>Version</b> 0.0.1
		</div>
	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
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
	<!-- Sparkline -->
	<script src="<c:url value='/plugins2/sparklines/sparkline.js'/>"></script>

	<!-- jQuery Knob Chart -->
	<script src="<c:url value='/plugins2/jquery-knob/jquery.knob.min.js'/>"></script>
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

	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/dist/js/demo.js'/>"></script>
	<script>
		//방문자
		new Chart(document.getElementById("bar-chart"), {
			type : 'bar',
			data : {
				labels : [ "SUN", "MON", "THUE", "WED", "THUR", "FRI", "SAT" ],
				datasets : [ {
					label : "방문자:",
					backgroundColor : [ "#0fc6fe", "#0faafe", "#0f7bfe",
							"#0f67fe", "#0f4ffe", "#0f33fe", "#170ffe" ],
					data : [  3, 10, 18, 15, 16, 21, 25 ]
				} ]
			},
			options : {
				legend : { 
					display : false
				}, 
				title : {
					display : true,
					text : '7월 2째주 방문자 그래프'
				}
			}
		});
		//방문자 도넛
		new Chart(document.getElementById("pie-chart"), {
			type : 'pie',
			data : { 
				labels : [ "SUN", "MON", "THUE", "WED", "THUR", "FRI", "SAT" ],
				datasets : [ {
					label : "Population",
					backgroundColor : [ "#0fc6fe", "#0faafe", "#0f7bfe",
							"#0f67fe", "#0f4ffe", "#0f33fe", "#170ffe" ],
					data : [ 3, 10, 18, 15, 16, 21, 25 ] 
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : '7월 2째주 방문자 그래프'
				}
			}
		});

		//예약현황
		new Chart(document.getElementById("line-chart"),
				{
					type : 'line',
					data : {
						labels : [ '룸복', '세부', '오사카', '다낭', '방콕', '발리', '사이판',
								'하와이' ],
						datasets : [ {
							label : '예약자 수',
							borderWidth : 2,
							lineTension : 0,
							spanGaps : true,
							borderColor : '#0f3ffe',
							pointRadius : 5, 
							pointHoverRadius : 7,
							pointColor : 'white',
							pointBackgroundColor : 'white',
							data : [ 8, 13, 3, 16, 10, 4, 7, 3 ],
						} ]
					},

					options : {
						legend : {
							display : false
						},
						title : {
							display : true,
							text : 'July Most Reservation Graph'

						}
					}
				});

		//인기도시 지도차트

		/* jQueryKnob */
		$('.knob').knob()
	</script>
</body>
</html>
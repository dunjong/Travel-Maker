<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->

<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css"
	rel="stylesheet">
<!-- JQuery -->

<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->

<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<style>
#chatbtn{
		position: absolute;
        top:2500%;
        left:120%;
        z-index: 5;
        padding: 5px; 
       
}
#chatbtn img{
 		width:56px;
        height:56px;
}
.modal-header{
		border-top-left-radius: 12px;
		border-top-right-radius: 12px;
}

</style>
<header class="header">
	<div class="container">
		<div class="row">
			<div class="col">
				<div
					class="header_content d-flex flex-row align-items-center justify-content-start">
					<div
						class="header_content_inner d-flex flex-row align-items-end justify-content-start">
						<div class="logo">
							<a href="<c:url value="/"/>">TravelMaker</a>
						</div>
						<nav class="main_nav">
							<ul
								class="d-flex flex-row align-items-start justify-content-start">
								<li><a class="active" href="<c:url value="/"/>">HOME</a></li>
								<c:if test="${not empty sessionScope.id}">
								<li><a href="<c:url value='/TravelMaker/CitySearch.kosmo'/>">PLANNER</a></li>
								</c:if>
								<c:if test="${empty sessionScope.id}">
								<li><a href="#" id='loginrequired'>PLANNER</a></li>
								</c:if>
								<li><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">REVIEW<span class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a
											href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>">리뷰
												보기</a></li>
										<li><a
											href="<c:url value='/TravelMaker/ReviewWrite.kosmo'/>">리뷰
												작성하기</a></li>
									</ul></li>
								<li><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">MEMBER<span class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<c:if test="${empty sessionScope.id}" var="login">
											<li id="loginbtn1" data-toggle="modal"><a href="#">로그인</a></li>
											<li id="signupmodalbtn" data-toggle="modal"><a href="#">회원가입</a></li>
										</c:if>
										<c:if test="${!login}">
											<li><a href="<c:url value='/TravelMaker/MyInfo.kosmo'/>">회원정보</a></li>
											<li id="logoutbtn1"><a href="#">로그아웃</a></li>
											<li><a href="<c:url value='/TravelMaker/MyPlanner.kosmo?user_id=${sessionScope.id}'/>">나의플랜</a></li>
											<li> <!-- 리뷰리스트.코스모를 리뷰서치.코스모로 변경: 여동준 --> 
											<a href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>">나의리뷰</a></li>
											<li><a href="<c:url value='/TravelMaker/admin1.kosmo'/>"> 관리자</a></li>
										</c:if>
										
									</ul>
									</li>
								<li>
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">Customer Service<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<c:url value='/TravelMaker/CustomerService.kosmo'/>">공지사항</a></li>
										<li><a href="#">QnA</a></li>
									</ul>
									</li>
							</ul>
							<button id="chatbtn" class="rounded-circle" type="button" data-toggle="modal" data-target="#ChatModal" style="text-align: right;cursor: pointer; "><img src="images/104352_482_1650.jpg" class="rounded-circle" style="color: sandybrown" alt=""></button>
							
							
							
						</nav>
						<!--  <div class="header_phone ml-auto">Call us:010-7928-1552</div>-->

						<!-- Hamburger -->

						<div class="hamburger ml-auto">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</header>

<!-- Home -->

<div class="home">

	<!-- Home Slider -->
	<div class="home_slider_container">
		<div class="owl-carousel owl-theme home_slider">
			<!-- Slide -->
			<div class="owl-item">
				<div class="background_image"></div>
				<div class="home_slider_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_slider_content">
									<div class="home_title">
										<h3 style="color: black; margin-left: 50dp">
											SHOW YOUR <span style="color: red;">'COURAGE'</span>
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal-chatbot">
								
		<div class="modal fade right" id="ChatModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-side modal-bottom-right" role="document">
		<div class="modal-dialog modal-notify modal-info">
	<div class="modal-content">
	     <div class="modal-header">        
	       <h4 class="modal-title" id="myModalLabel" style="color:white;"><i class="fa fa-fighter-jet"></i>TravelMaker</h4>
	       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	     </div>
	     <div class="modal-body">
		<iframe
	         id="iframe"	         
	         style="min-height: 60vh; border:none;"  	         
	         width="100%"
	         height="90%"
	         src="https://171eadfc75fa.ngrok.io">                        
	     </iframe>
	      </div>
	</div>
	    <!-- /.modal-content -->
	  </div>
	  <!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	</div>
</div>
	
</div>

<div class="menu">
	<div
		class="menu_header d-flex flex-row align-items-center justify-content-start">
		<div class="menu_logo">
			<a href="index.html">TravelMaker</a>
		</div>
		<div class="menu_close_container ml-auto">
			<div class="menu_close">
				<div></div>
				<div></div>
			</div>
		</div>
	</div>
	<div class="menu_content">
		<!-- 작은화면에서 보이는 메뉴 -->
		<ul>
			<li><a class="active" href="<c:url value="/"/>">HOME</a></li>
			<c:if test="${not empty sessionScope.id}">
				<li><a href="<c:url value='/TravelMaker/CitySearch.kosmo'/>">PLANNER</a></li>
			</c:if>
			<c:if test="${empty sessionScope.id}">
				<li><a href="#" id='loginrequired2'>PLANNER</a></li>
			</c:if>
			<li>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">REVIEW<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<c:url value='/TravelMaker/ReviewList.kosmo'/>">리뷰 리스트</a></li>
					<li><a href="<c:url value='/TravelMaker/ReviewView.kosmo'/>">리뷰 보기</a></li>
					<li><a href="#">리뷰 작성</a></li>
				</ul>
			</li>
			<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">MEMBER<span
					class="caret"></span></a>
				<ul class="dropdown-menu">
					
					<c:if test="${empty sessionScope.id}" var="login">
						<li id="loginbtn2" data-toggle="modal"><a href="#">로그인</a></li>
						<li><a href="#" id="signupmodalbtn">회원가입</a></li>
					</c:if>
					<c:if test="${!login}">
						<li><a href="<c:url value='/TravelMaker/MyInfo.kosmo'/>">회원정보</a></li>
						<li id="logoutbtn2"><a href="#">로그아웃</a></li>
						<li><a href="<c:url value='/TravelMaker/MyPlanner.kosmo?user_id=${sessionScope.id}'/>">나의플랜</a></li>
						<li><a href="<c:url value='/TravelMaker/ReviewList.kosmo'/>">나의리뷰</a></li>
						<li><a href="<c:url value='/TravelMaker/admin1.kosmo'/>"> 관리자</a></li>
					</c:if>
					
					
				</ul></li>
			<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Customer
					Service<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a
						href="<c:url value='/TravelMaker/CustomerService.kosmo'/>">공지사항</a></li>
					<li><a href="#">QnA</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="menu_social">
		<div class="menu_phone ml-auto">Call us: 00-56 445 678 33</div>
		<ul class="d-flex flex-row align-items-start justify-content-start">
			<li><a href="#"><i class="fa fa-pinterest"
					aria-hidden="true"></i></a></li>
			<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
			<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
			<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
		</ul>
	</div>
</div>

<!--로그인 modal-->
<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content form-elegant">
			<div class="modal-header text-center">
				<h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3">로그인</h3>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body mx-4">
				<form id="logInForm" action="<c:url value='/TravelMaker/LoginProcess.do'/>" method="post">
					<div class="md-form mb-5">
						<label data-error="wrong" data-success="right" for="Form-id1" class="username"> 아이디 </label> 
						<input id="id" name="user_id" type="text" autocomplete="on" class="form-control validate" placeholder="아이디를 입력하세요">
					</div>
					<div class="md-form pb-3">
						<label data-error="wrong" data-success="right" for="Form-pass1" class="userpass"> <span style="color: black;">비밀번호</span></label> 
						<input id="pwd" name="user_pwd" type="password" class="form-control validate" placeholder="비밀번호를 입력하세요" />
					</div>
					<span id="loginfailmessage" style="color: red; font-size: .8em">${NotMember}</span>
				</form>
			</div>
			<div class="modal-footer">
				<div class="text-center mb-3" style="width: 100%; height: 100%">
					<a href="#" id='loginsubmit' class="btn blue-gradient btn-block btn-rounded z-depth-1a">로그인</a>
					<p class="font-small grey-text d-flex justify-content-end">회원이 아니신가요?
						<a href="#" id="signupmodalbtn2" class="blue-text ml-1">
							<i class="fas fa-share animated rotateIn">Click!</i>
						</a>
					</p>
				</div>
			</div>
			<!-- 카카오 로그인 -->
			<div class="modal-body">
				<label>간편 로그인</label>
				<div></div>
				<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
				<a id="kakao-login-btn"></a> 
				<a href="http://developers.kakao.com/logout"></a>
				<script type='text/javascript'>
					//<![CDATA[
					Kakao.init('788481db29afb2534dcb46b9ac0c6770'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
					Kakao.Auth.createLoginButton({
						container : '#kakao-login-btn', 
						success : function(authObj) {
							Kakao.API.request({
								url : '/v2/user/me', 
								success : function(res) {
									console.log(res)
									console.log(res.properties.nickname)
									console.log(res.kakao_account.email);//<-- 카카오 이메일
									console.log(res.id);//<-- 아이디
									console.log(res.kakao_account.age_range);//<--나이
									console.log(res.kakao_account.gender)//<--성별
									$.ajax({
										url:"<c:url value='/TravelMaker/kakao.do'/>",//요청할 서버의 URL주소
										type:'get',//데이타 전송방식(디폴트는 get방식) 
										dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
										data:{
											"user_id":res.kakao_account.email,
											"user_pwd":res.id,
											"user_rrn":res.kakao_account.age_range,
											"user_gender":res.kakao_account.gender,
											"user_name":res.properties.nickname
										},
										success:function(response){
											if((!res.kakao_account.has_age_range||!res.kakao_account.has_email||!res.kakao_account.has_gender)&&response=="signup")
												alert('선택사항 미충족시 기본값으로 대체됩니다\n회원정보에서 수정해주세요')
											else if(response=="signup") alert("간편회원가입 성공");
											history.go(0);
										},
										error:function(data){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
											console.log('쿼리실행중에러:',data.responseText);				
										}
									});
							
						            },
						            fail: function(error) {
						              console.log('카카오로그인실패',JSON.stringify(error));
						            }
						          });
						                  
						        },
						        fail: function(err) {
						          console.log('카카오로그인실패2',JSON.stringify(err));
						        }
						      });
				</script>

				<!-- 네이버 아이디로 로그인 -->
				<script type="text/javascript"
					src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
					charset="utf-8"></script>
				<div id="naverIdLogin"></div>
				<script type="text/javascript">
					var naverLogin = new naver.LoginWithNaverId({
						clientId : "9S4_IFNQ8VcUuiO1dsY5",
						callbackUrl : "http://localhost:9506",
						isPopup : false,
						loginButton : {
							color : "green",
							type : 3,							
							height : 48
						}
					});
					naverLogin.init();
				</script>
			</div>
		</div>
	</div>
</div>


<!-- 회원 가입 modal -->
<div class="modal fade" id="sighupmodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" style="color: black;">회원가입</h5>
			</div>
			<div class="modal-body">
				<form action="<c:url value='/TravelMaker/ValidationCheck.do'/>"
					method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label" style="color: black;">아이디</label>
						<div>
							<input id="signUpId" type="text" class="form-control input-lg"
								name="user_id" value="${param.user_id}" placeholder="아이디를 입력하세요">
						</div>
						<div>
							<a class="btn btn-success" id="signUpIdCheckBtn">아이디 확인</a> <span
								id="idErrormessage" style="color: red; font-size: .8em">${idError}<form:errors
									path="memberDTO.user_id" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" style="color: black;">이름</label>
						<div>
							<input type="text" class="form-control input-lg" name="user_name"
								value="${param.user_name}" placeholder="이름을 입력하세요"> <span
								style="color: red; font-size: .8em">${nameError}<form:errors
									path="memberDTO.user_name" /></span>
						</div>
					</div>
					<div class="form-group">
						<div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">비밀번호</label>
						<div>
							<input type="password" class="form-control input-lg"
								name="user_pwd" placeholder="비밀번호를 입력하세요"> <span
								style="color: red; font-size: .8em">${passwordError}<form:errors
									path="memberDTO.user_pwd" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">비밀번호
							확인</label>
						<div>
							<input type="password" class="form-control input-lg"
								name="password_check" placeholder="비밀번호를 다시 입력하세요"> <span
								style="color: red; font-size: .8em">${password_checkError}<form:errors
									path="memberDTO.password_check" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">나이</label>
						<div class="col-sm-4">
							<select class="form-control input-sm" name="user_rrn">
								<option>출생 연도를 선택하세요</option>
								<option <c:if test="${param.user_rrn=='60~70' }">checked</c:if> value="60~70" >1950~1959</option>
								<option <c:if test="${param.user_rrn=='50~60' }">checked</c:if>value="50~60">1960~1969</option>
								<option <c:if test="${param.user_rrn=='40~50' }">checked</c:if>value="40~50">1970~1979</option>
								<option <c:if test="${param.user_rrn=='30~40' }">checked</c:if>value="30~40">1980~1989</option>
								<option <c:if test="${param.user_rrn=='20~30' }">checked</c:if>value="20~30">1990~1999</option>
								<option <c:if test="${param.user_rrn=='10~20' }">checked</c:if>value="10~20">2000~2009</option>
								<option <c:if test="${param.user_rrn=='0~10' }">checked</c:if>value="0~10">2010~2019</option>
								<option <c:if test="${param.user_rrn=='0' }">checked</c:if>value="0">2020~</option>
							</select> <span style="color: red; font-size: .8em">${ageError}<form:errors
									path="memberDTO.user_rrn" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">성별</label>
						<div class="col-sm-4">
							<!--  가로 배치 -->
							<div class="radio">
								<label><input type="radio" value="남자" name="user_gender"
									<c:if test="${param.user_gender=='male' }">checked</c:if>>male</label> <label><input
									type="radio" value="여자" name="gender"
									<c:if test="${param.user_gender=='female' }">checked</c:if>>female</label>
							</div>
							<span style="color: red; font-size: .8em">${genderError}<form:errors
									path="memberDTO.user_gender" /></span>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" id="sighUpSubmit" type="submit">확인</button>
						<button class="btn btn-danger" type="button" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	//회원가입 validate에러 발생시
	if(${not empty error}){
		$('#sighupmodal').modal("show");
	}
	//로그인실패시
	if(${not empty NotMember}){
		$('#loginmodal').modal("show");
	}
	$('#loginrequired').click(function(e){
		e.preventDefault();
		$('#loginmodal').modal("show");
	})
	$('#loginrequired2').click(function(e){
		e.preventDefault();
		$('#loginmodal').modal("show");
	})
	$('#sighupmodal').on('hide.bs.modal', function (e) {
		$('#sighupmodal .form-control').prop('value','')
	})
	//로그인 모달켜기용 - 전체화면/작은화면
	$('#loginbtn1').click(function(e) {
		e.preventDefault();
		$('#loginmodal').modal("show");
	});
	$('#loginbtn2').click(function(e) {
		e.preventDefault();
		$('#loginmodal').modal("show");
	});
	//로그인용
	$('#loginsubmit').click(function loginsubmit(){
		$('#logInForm').submit();
	})
	//로그아웃용
	var logoutForm = document.createElement('form');
	logoutForm.action = '<c:url value="/TravelMaker/Logout.do"/>'
	$('#logInForm').append(logoutForm)
	$('#logInSubmit').click(function(){
		$('#logInForm').submit();
	})
	$('#logoutbtn1').click(function(){
		logoutForm.submit();
	})
	$('#logoutbtn2').click(function(){
		logoutForm.submit();
	})
	//회원가입용
	$('#signupmodalbtn').click(function(e) {
		e.preventDefault();
		$('#sighupmodal').modal("show");
	});
	$('#signupmodalbtn2').click(function(e) {
		e.preventDefault();
		$('#loginmodal').modal("hide")
		$('#sighupmodal').modal("show");
	});
	$('#signUpIdCheckBtn').click(function(e){
		e.preventDefault();
		if($('#signUpId').prop('value').length==0){
			if(${not empty idError})
				$('#signUpId').prop('value',${idError}+" ");
			return false;	
		}
		//회원가입시 로그인 체크용 
		$.ajax({
			url:"<c:url value='/TravelMaker/IdCheck.do'/>",//요청할 서버의 URL주소
			type:'get',//데이타 전송방식(디폴트는 get방식) 
			dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
			data:{"signUpId":$('#signUpId').prop('value')},
			success:function(response){
				if(response=='failure'){
					$('#idErrormessage').text("아이디가 이미 존재합니다");
				}
				else if(response=='success'){
					$('#idErrormessage').text("중복되는 아이디가 없습니다");
					$('#idErrormessage').prop('style','color:green;font-size: .8em')
				}
			},
			error:function(data){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
				console.log('에러:',data.responseText);				
			}
		});
	});
	
})
</script>
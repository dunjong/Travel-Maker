<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	body{
		padding-top:50px;
	}
</style>
<script>
	function isLogin(){
		//ajax요청
		$.ajax({
			url:"<c:url value='/OneMemo/Auth/IsLogin.bbs'/>",
			dataType:'json',
			success:function(data){
				console.log(typeof data);
				console.log(JSON.stringify(data));
				if(data.IsLogin=='YES'){//로그인 되었다면
					//목록페이지로 이동]
					location.replace("<c:url value='/OneMemo/BBS/List.bbs'/>");
				} 
				else{//로그인이 안됬다면
					alert('로그인후 이용하세요');
					location.replace("<c:url value='/OneMemo/Auth/Login.bbs'/>");
				}
			},
			error:function(e){
				console.log('에러:',e);
			}
			
			
		});
	}
</script>
<nav class="navbar navbar-default navbar-fixed-top">
	<!-- 상단메뉴 시작 -->
	<div class="container-fluid">
		<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#collapse-menu">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>			
			<a class="navbar-brand" href='<c:url value="/DataRoom/Index.kosmo"/>'>
				<span class="glyphicon glyphicon-ok"></span>
				BBST
			</a>
		</div>
		<!-- navbar-header -->

		<!-- 화면 크기가 클때 상단에 보여지는 메뉴(데스크탑용) -->
		<div class="collapse navbar-collapse" id="collapse-menu">
			<ul class="nav navbar-nav navbar-right">
				<li><a href='<c:url value="/"/>'>메인</a></li>
				<!-- 스프링 씨큐러티 사용하지 않을때 -->
				<%-- 
				<c:if test="${empty sessionScope.id }" var="isNotLogin">
				<li><a href="<c:url value="/OneMemo/Auth/Login.bbs"/>">로그인</a></li>
				</c:if>
				<c:if test="${not  isNotLogin}">
				<li><a href="<c:url value="/OneMemo/Auth/Logout.bbs"/>">로그아웃</a></li>
				</c:if>
				--%>
				<!-- 
				     스프링 씨큐리티 사용시 :단,<security:csrf disabled="false" />
				     설정시 로그아웃을 GET방식이 아닌 POST방식으로 해야한다
				   true로 지정시에는 GET방식이어도 상관없다(CSRF공격은 막지 못한다)
				-->
				<sec:authorize access="isAnonymous()">
					<li><a href="<c:url value="/OneMemo/Auth/Login.bbs"/>">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="javascript:logout();">로그아웃</a></li>
				</sec:authorize>
				
				<!-- ajax로 로그인 여부 판단 -->
				<li><a href="javascript:isLogin();">게시판</a></li>
				<!--  
				<li><a href='<c:url value="/OneMemo/BBS/List.bbs"/>'>한줄 댓글 게시판</a></li>
				-->
			</ul>
		</div>
		<!-- /.navbar-collapse -->

	</div>
	<!-- /.container-fluid -->
</nav>
<!--  상단 메뉴 끝 -->
<!-- action 은 스프링 씨큐리티의 security-context.xml의
     <security:logout태그의 logout-url속성에 지정한 값과 일치
          시킨다
 -->
<form id="logoutForm" method="post" action="<c:url value='/OneMemo/Auth/Logout.bbs'/>">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script>
	//csrf사용시에만 아래 함수 필요
	function logout(){
		$('#logoutForm').submit();	
	}
</script>

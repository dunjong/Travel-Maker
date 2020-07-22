<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
#reviewBack {
	text-align: center;
}

#reviewBackImage {
	background-image: url("<c:url value='/images/reviewBackLarge.jpg'/>");
	height: 1041px;
	background-repeat: no-repeat;
	background-position: center center;
}
</style>
<!-- Search -->
<script>
$(function(){
	if(${not empty error2}){
		$('#myModal').modal("show");
	}
})
</script>
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div class="home_search_title">회원정보</div>
					<div class="home_search_content">

						<form action="#">
							<div class="form-group">
								아이디: <input type="text" class="form-control" disabled="disabled" value="${user_id}">
							</div>
							<div class="form-group">
								이름: <input type="text" class="form-control" name="value"
									disabled="disabled" value="${user_name}"> 
							</div>
							<div class="form-group">
								출생연도: <input type="text" class="form-control" name="value"
									disabled="disabled" value="${user_rrn}"> 
							</div>
							<div class="form-group">
								성별: <input type="text" class="form-control" name="value"
									disabled="disabled" value="${user_gender}"> 
							</div>
						</form>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#myModal"
							style="vertical-align: middle; text-align: center;">정보수정
							하러가기 Click!</button>
					</div>

					<!-- Modal -->

				</div>
			</div>
		</div>
	</div>
</div>
<div id=reviewBack>
	<div id="reviewBackImage"></div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel" style="color: black;">회원정보
					수정</h4>
			</div>
			<div class="modal-body">
				<form action="<c:url value='/TravelMaker/ValidationCheck2.do'/>" method='POST'>
					<div class="form-group">
						<label class="col-sm-2 control-label" style="color: black;">아이디</label>
					</div>
					<div>
						<!-- 아이디는 수정이 불가능하도록 readonly 속성 추가 -->
						<input id="signupid" type="text" readonly="readonly"
							class="form-control input-lg" name="user_id" value="${user_id}">
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" style="color: black;">이름</label>
						<div>
							<input type="text" class="form-control input-lg" name="user_name"
								value="${user_name}" placeholder="수정할 이름을 입력하세요">
							<span style="color: red; font-size: .8em">${nameError}<form:errors
									path="memberDTO.user_name" /></span>
						</div>
					</div>
					<div class="form-group">
						<div></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">비밀번호</label>
						<div>
							<input type="password" class="form-control input-lg"
								name="user_pwd" value="" placeholder="수정할 비밀번호를 입력하세요"><span
								style="color: red; font-size: .8em">${passwordError}<form:errors
									path="memberDTO.user_pwd" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">비밀번호
							확인</label>
						<div>
							<input type="password" class="form-control input-lg"
								name="password_check" value="" placeholder="수정할 비밀번호를 다시 입력하세요">
							<span
								style="color: red; font-size: .8em">${password_checkError}<form:errors
									path="memberDTO.password_check" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">나이</label>
						<div class="col-sm-4">
							<select class="form-control input-sm" name="user_rrn" >
								<option>출생 연도를 선택하세요</option>
								<option <c:if test='${user_rrn}=="60~70"'>checked</c:if> value="60~70" >1950~1959</option>
								<option <c:if test='${user_rrn}=="50~60"'>checked</c:if>value="50~60">1960~1969</option>
								<option <c:if test='${user_rrn}=="40~50"'>checked</c:if>value="40~50">1970~1979</option>
								<option <c:if test='${user_rrn}=="30~40"'>checked</c:if>value="30~40">1980~1989</option>
								<option <c:if test='${user_rrn}=="20~30"'>checked</c:if>value="20~30">1990~1999</option>
								<option <c:if test='${user_rrn}=="10~20"'>checked</c:if>value="10~20">2000~2009</option>
								<option <c:if test='${user_rrn}=="0~10"'>checked</c:if>value="0~10">2010~2019</option>
								<option <c:if test='${user_rrn}=="0"'>checked</c:if>value="0">2020~</option>
							</select> <span style="color: red; font-size: .8em">${ageError}<form:errors
									path="memberDTO.user_rrn" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">성별</label>
						<div class="col-sm-4">
							<!--  가로 배치 -->
							<div class="radio">
								<label>남자</label>
								<input type="radio" value="male" name="user_gender" value="${user_gender}" <c:if test="${user_gender=='male'}">checked</c:if>>
								<label>여자</label>
								<input type="radio" value="female" name="user_gender" value="${user_gender}" <c:if test="${user_gender=='female'}">checked</c:if>> 
							</div>
							<span style="color: red; font-size: .8em">${genderError}<form:errors
									path="memberDTO.user_gender" /></span>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" id="EditSubmit" type="submit">수정</button>
						<button class="btn btn-danger" type="button" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	

	<!-- Search -->

	<div class="modal fade" id="sighupmodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" style="color: black;">회원정보 수정</h5>
			</div>
			<div class="modal-body">
				<form action="<c:url value='/TravelMaker/ValidationCheck.do'/>"
					method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label" style="color: black;">아이디</label>
						<div>
							<!-- 아이디는 수정이 불가능하도록 readonly 속성 추가 -->
							<input id="signUpId" type="text" readonly="readonly" class="form-control input-lg"
								name="id" value="${param.id}" placeholder="아이디를 입력하세요">
						</div>
						<div>
							<a class="btn btn-info" id="signUpIdCheckBtn">아이디 확인</a> <span
								id="idErrormessage" style="color: red; font-size: .8em">${idError}<form:errors
									path="memberDTO.id" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" style="color: black;">이름</label>
						<div>
							<input type="text" class="form-control input-lg" name="name"
								value="${param.name}" placeholder="이름을 입력하세요"> <span
								style="color: red; font-size: .8em">${nameError}<form:errors
									path="memberDTO.name" /></span>
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
								name="password" placeholder="비밀번호를 입력하세요"> <span
								style="color: red; font-size: .8em">${passwordError}<form:errors
									path="memberDTO.password" /></span>
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
							<select class="form-control input-sm" name="rrn" value="${param.rrn}">
								<option>출생 연도를 선택하세요</option>
								<option value="1950" >1950~1959</option>
								<option value="1960">1960~1969</option>
								<option value="1970">1970~1979</option>
								<option value="1980">1980~1989</option>
								<option value="1990">1990~1999</option>
								<option value="2000">2000~2009</option>
								<option value="2010">2010~2019</option>
								<option value="2020">2020~</option>
							</select> <span style="color: red; font-size: .8em">${ageError}<form:errors
									path="memberDTO.rrn" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" style="color: black;">성별</label>
						<div class="col-sm-4">
							<!--  가로 배치 -->
							<div class="radio">
								<label><input type="radio" value="남자" name="gender"
									<c:if test="${param.gender=='남자' }">checked</c:if>>남자</label> <label><input
									type="radio" value="여자" name="gender"
									<c:if test="${param.gender=='여자' }">checked</c:if>>여자</label>
							</div>
							<span style="color: red; font-size: .8em">${genderError}<form:errors
									path="memberDTO.gender" /></span>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn" id="sighUpSubmit" type="submit">확인</button>
						<button class="btn" type="button" data-dismiss="modal"
							style="color: red;">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
//회원수정용
	$('#signupmodalbtn').click(function(e) {
		e.preventDefault();
		$('#sighupmodal').modal("show");
	});
	$('#signUpIdCheckBtn').click(function(e){
		e.preventDefault();
		if($('#signUpId').prop('value').length==0){
			if(${not empty idError})
				$('#signUpId').prop('value',${idError}+" ");
			return false;	
		}
</script>		
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- Search -->

	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">회원정보</div>
						<div class="home_search_content">
							<div>아이디:${id}</div>
							
							<form action="<c:url value='MyInfoEdit.kosmo'/>">
								<div>이름:</div>
								<input type="text" name="value" readonly="readonly" value="${name}" >
								<input type="text" name="updateColumn" hidden="true" value="user_name" >
								<input type="text" name="id" hidden="true" value="${id}" >
								
								<div>비밀번호:</div>
								<input type="text" name="value" readonly="readonly" value="${pwd}" >
								<input type="text" name="updateColumn" hidden="true" value="user_pwd" >
								<input type="text" name="id" hidden="true" value="${id}" >
			
								<div>출생연도:</div>
								<input type="text" name="value" readonly="readonly" value="${rrn}" >
								<input type="text" name="updateColumn" hidden="true" value="user_rrn" >
								<input type="text" name="id" hidden="true" value="${id}" >
				
								<div>성별:</div>
								<input type="text" name="value" readonly="readonly" value="${gender}" >
								<input type="text" name="updateColumn" hidden="true" value="user_gender" >
								<input type="text" name="id" hidden="true" value="${id}" >
								<button class="btn btn-success" style="float: right;">수정</button>
							</form>
							
							
							
							
							
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
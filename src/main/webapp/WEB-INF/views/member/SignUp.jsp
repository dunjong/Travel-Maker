<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">Register</div>
						<div class="home_search_content">
							<form class="home_search_form" id="home_search_form">
							<div class="form-group" id="id"><!-- <div class="row">와 같다 -->
								<!--  label에 control-label도 함께:가운데 정렬 -->
								<label  class="col-sm-2 control-label">아이디</label>
								<div class="col-sm-4">
									<input type="text" class="form-control input-lg" name="id" placeholder="id">
								</div>
								
								<label  class="col-sm-2 control-label">이름</label>
								<div class="col-sm-4">
									<input type="text" class="form-control input-lg" name="name" placeholder="name">
								</div>
								
								
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">암호</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" name="password" placeholder="password">
								</div>
								<label class="col-sm-2 control-label">암호확인</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" name="password2" placeholder="pass check" >
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">증명사진</label>
								<div class="col-sm-4">
									<input type="file" name="file">
									<p class="help-block">이미지파일만 업로드하세요</p>
								</div>
							</div>
							<div class="form-group"><!-- <div class="row">와 같다 -->
								<!--  label에 control-label도 함께:가운데 정렬 -->
								<label  class="col-sm-2 control-label">나이</label>
								<div class="col-sm-4">
									<select class="form-control input-sm" name="age">
									  <option>출생 연도를 선택하세요</option>
									  <option value="1950">1950~</option>
									  <option value="1960">1960~</option>
									  <option value="1970">1970~</option>
									  <option value="1980">1980~</option>
									  <option value="1990">1990~</option>
									  <option value="2000">2000~</option>
									  <option value="2010">2010~</option>
									  <option value="2020">2020~</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">성별</label>
								<div class="col-sm-4">
									<!--  가로 배치 -->
									<div class="radio">
										<label><input type="radio" value="남" name="gender">남자</label>
										<label><input type="radio" value="여" name="gender">여자</label>
										<label><input type="radio" value="트랜스젠더" name="gender">트랜스 젠더</label>
									</div>
								</div>					
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">관심나라</label>
								<div class="col-sm-4">							
									<div class="checkbox">
										<label><input type="checkbox" name="inter" value="Eu">유럽</label>	
										<label><input type="checkbox" name="inter" value="Na">북미</label>		
										<label><input type="checkbox" name="inter" value="Sa">남미</label>
										<label><input type="checkbox" name="inter" value="Au">호주</label>										
									</div>						
								</div>		
								<div class="col-sm-4">							
									<div class="checkbox">
										<label><input type="checkbox" name="inter" value="Jp">일본</label>
										<label><input type="checkbox" name="inter" value="Cn">중국</label>
										<label><input type="checkbox" name="inter" value="Dm">국내</label>
										<label><input type="checkbox" name="inter" value="Ea">동남아</label>														
									</div>						
								</div>				
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">직업</label>
								<div class="col-sm-3">
									<select class="form-control input-sm" name="occupation">
									  <option>직업을 선택하세요</option>
									  <option value="eng">엔지니어</option>
									  <option value="edu">교육</option>
									  <option value="std">학생</option>
									  <option value="sale">자영업</option>
									  <option value="com">회사원</option>
									  <option value="hos">주부</option>
									  <option value="pub">공무원</option>
									  <option value="amp">예체능</option>
									  <option value="etc">기타</option>
									</select>
								</div>
							</div>			
							
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	


	

	<!-- Destinations -->

	
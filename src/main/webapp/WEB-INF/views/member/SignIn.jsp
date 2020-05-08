<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	

	<!-- Search -->

	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">로그인</div>
						<div class="home_search_content">
							<form action="#" class="home_search_form" id="home_search_form">
								<div class="form-group">
									<label for="id" class="col-sm-2  control-label">ID</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="id" id="id"
											placeholder="ID">
									</div>
								</div>
								
								<div class="form-group">
									<label for="pwd" class="col-sm-2  control-label">PASSWORD</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="pwd" name="pwd"
											placeholder="PASSWORD">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-danger">LOGIN</button>
									</div>
								</div>							
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


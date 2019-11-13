<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post"
        action="${pageContext.request.contextPath}/signup"></form>>
		<img src="assets/image/logo.png" width="100%">
		<h2 class="sr-only">Login Form</h2>
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<input class="form-control" type="text" name="id" placeholder="아이디" />
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password" placeholder="비밀번호" />
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password" placeholder="비밀번호 확인" />
		</div>
		<div class="form-group">
			<input class="form-control" type="email" name="email" placeholder="이메일" />
		</div>
		<div class="form-group">
			<input class="form-control" type="text" name="nickname" placeholder="닉네임" />
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
			<label class="form-check-label" for="inlineCheckbox1">남자</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
			<label class="form-check-label" for="inlineCheckbox2">여자</label>
		</div>
		<div class="form-group">
			<select id="inputState" class="form-control">
				<option selected>나이</option>
				<option>10대</option>
				<option>20대</option>
				<option>30대</option>
				<option>40대</option>
				<option>50대</option>
				<option>60대</option>
				<option>70대</option>
				<option>80대</option>
			</select>
		</div>
		<label>선호도</label>
		<div class="form-group">
			<select id="inputState" class="form-control">
				<option>빡빡한 일정을 좋아해요</option>
				<option>느슨한 일정을 좋아해요</option>
			</select>
		</div>
		<div class="form-group">
			<select id="inputState" class="form-control">
				<option>주간 여행을 좋아해요</option>
				<option>야간 여행을 좋아해요</option>
			</select>
		</div>
		<div class="form-group">
			<select id="inputState" class="form-control">
				<option>활기찬 분위기를 선호해요</option>
				<option>조용한 분위기를 선호해요</option>
			</select>
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button">회원가입</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
</div>
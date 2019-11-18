<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Register</title>
	<link rel="stylesheet" href="https://static.blex.kr/assets/library/bootstrap.css">
	<link rel="stylesheet" href="https://baejino.com/baealex.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap">
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/login.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>

<div class="login-dark">
    <form method="post" action="register_additional_info">
		<img src="assets/image/logo.png" width="100%">
		<div class="alert alert-success" role="alert">
			${id} 님의 회원가입이 완료되었습니다!
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="infomation_show()">추가 정보 입력</button></div>
		<div id="addtional" style="display:none;">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="male">
				<label class="form-check-label" for="inlineCheckbox1">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="female">
				<label class="form-check-label" for="inlineCheckbox2">여자</label>
			</div>
			<div class="form-group">
				<select id="inputState" class="form-control">
					<option selected>나이</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대</option>
					<option value="70">70대</option>
					<option value="80">80대</option>
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
		</div>
		<div id="cancle" class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='./'">다음에 할게요</button></div>
		<div id="done" style="display:none" class="form-group"><button class="btn btn-primary btn-block" type="submit">완료</button></div>
	</form>
</div>
<script src="https://static.blex.kr/assets/library/jquery.js"></script>
<script src="https://static.blex.kr/assets/library/bootstrap.js"></script>
<script>
function infomation_show() {
	$('#addtional').css('display', 'block');
	$('#cancle').css('display', 'none');
	$('#done').css('display', 'block');
}
</script>
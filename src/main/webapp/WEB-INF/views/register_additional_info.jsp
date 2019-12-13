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
<body>
	<div class="login-dark">
		<form method="post" action="register_additional_info" onsubmit="return required()">
			<a class="font-classic text-title immutable" href="./">Travlan</a>
			<div class="alert alert-success" role="alert">
				${id} 님의 회원가입이 완료되었습니다!
			</div>
			<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="infomation_show()">추가 정보 입력</button></div>
			<div id="addtional" style="display:none;" data-aos="flip-up">
				<input type="hidden" name="num" value="${num}">
			
				<div class="form-check form-check-inline">
					<input type="radio" name="gender" value="M" checked>남자<br>
					<input type="radio" name="gender" value="F">여자<br>
				</div>
				<div class="form-group">
					<select id="inputState" class="form-control" name="age">
						<option value="10" selected>10대</option>
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
					<select id="inputState" class="form-control" name="type1">
						<option value="A">빡빡한 일정을 좋아해요</option>
						<option value="B">느슨한 일정을 좋아해요</option>
					</select>
				</div>
				<div class="form-group">
					<select id="inputState" class="form-control" name="type2">
						<option value="A">주간 여행을 좋아해요</option>
						<option value="B">야간 여행을 좋아해요</option>
					</select>
				</div>
				<div class="form-group">
					<select id="inputState" class="form-control" name="type3">
						<option value="A">활기찬 분위기를 선호해요</option>
						<option value="B">조용한 분위기를 선호해요</option>
					</select>
				</div>
				<label>거주 지역</label>
				<div class="form-group">
					<select id="province" class="form-control" name="province">
						<option value="XX" selected>지역을 선택해주세요</option>
						<option value="서울">서울특별시</option>
						<option value="강원">강원도</option>
						<option value="대전">대전광역시</option>
						<option value="충남">충청남도</option>
						<option value="충북">충청북도</option>
						<option value="인천">인천광역시</option>
						<option value="경기">경기도</option>
						<option value="광주">광주광역시</option>
						<option value="전남">전라남도</option>
						<option value="전북">전라북도</option>
						<option value="부산">부산광역시</option>
						<option value="경남">경상남도</option>
						<option value="경북">경상북도</option>
						<option value="울산">울산광역시</option>
						<option value="대구">대구광역시</option>
						<option value="제주">제주도</option>
					</select>
				</div>
				<div class="form-group">
					<select id="region_num" class="form-control" name="region_num">
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
	function required() {
		if($('#province option:selected').val() == 'XX') {
			alert('지역을 선택하세요.');
			return false;
		}
	}
	
	function infomation_show() {
		$('#addtional').css('display', 'block');
		$('#cancle').css('display', 'none');
		$('#done').css('display', 'block');
	}

	$("#province").change(function(){
		$.ajax({
            url: "getRegion",
            data: { "province" : $("#province").val() },
            type: "get",
        }).done(function (data) {
            var codes = "";
            $("#region_num").html("");
            $.each(data, function(index, item){
                codes += "<option value=" + item.num + ">" + item.region + "</option>"
            	$("#region_num").html(codes);
            });
		});
	});
	</script>
</body>
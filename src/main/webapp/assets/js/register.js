$("#id").focusout(function(){
    var id = $("#id").val();
    if(id != "") {
        $.ajax({
            url: "idcheck",
            data: { "id" : $("#id").val() },
            type: "get",
        }).done(function (data) {
            $("#idcheck").addClass('alert');
            if(data.flag == 'Y') {
                $("#idcheck").text("사용할 수 있는 아이디입니다.");
                $("#idcheck").removeClass('alert-danger');
                $("#idcheck").addClass('alert-success');
                $("#id").css('border', '1px solid #080');
            } else {
                $("#idcheck").text("이미 등록된 아이디입니다.");
                $("#idcheck").removeClass('alert-success');
                $("#idcheck").addClass('alert-danger');
                $("#id").css('border', '1px solid #f00');
            }
        });
    }
});

$("#email").focusout(function(){
    var email = $("#email").val();
    if(email != "") {
        $.ajax({
            url: "emailcheck",
            data: { "email" : $("#email").val() },
            type: "get",
        }).done(function (data) {
            $("#emailcheck").addClass('alert');
            if(data.flag == 'Y') {
                $("#emailcheck").text("사용할 수 있는 이메일입니다.");
                $("#emailcheck").removeClass('alert-danger');
                $("#emailcheck").addClass('alert-success');
                $("#email").css('border', '1px solid #080');
            } else {
                $("#emailcheck").text("이미 등록된 이메일입니다.");
                $("#emailcheck").removeClass('alert-success');
                $("#emailcheck").addClass('alert-danger');
                $("#email").css('border', '1px solid #f00');
            }
        });
    }
});

$("#password_chk").focusout(function(){
    var password = $("#password").val();
    var passcheck = $("#password_chk").val();
    if(password != "" && passcheck != "") {
        $("#passwordcheck").addClass('alert');
        if(password == passcheck) {
            $("#passwordcheck").text("비밀번호가 일치합니다.");
            $("#passwordcheck").removeClass('alert-danger');
            $("#passwordcheck").addClass('alert-success');
        } else {
            $("#passwordcheck").text("비밀번호가 일치하지 않습니다.");
            $("#passwordcheck").removeClass('alert-success');
            $("#passwordcheck").addClass('alert-danger');
        }
    }
});

$("#nickname").focusout(function(){
    var nickname = $("#nickname").val();
    if(nickname != "") {
        $.ajax({
            url: "nicknamecheck",
            data: { "nickname" : $("#nickname").val() },
            type: "get",
        }).done(function (data) {
            $("#nicknamecheck").addClass('alert');
            if(data.flag == 'Y') {
                $("#nicknamecheck").text("사용할 수 있는 닉네임입니다.");
                $("#nicknamecheck").removeClass('alert-danger');
                $("#nicknamecheck").addClass('alert-success');
                $("#nickname").css('border', '1px solid #080');
            } else {
                $("#nicknamecheck").text("이미 등록된 닉네임입니다.");
                $("#nicknamecheck").removeClass('alert-success');
                $("#nicknamecheck").addClass('alert-danger');
                $("#nickname").css('border', '1px solid #f00');
            }
        });
    }
});

function infomation_show() {
	$('#addtional').css('display', 'block');
	$('#cancle').css('display', 'none');
	$('#done').css('display', 'block');
}
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form name="login"
    	  method="post"
  		  action="${pageContext.request.contextPath}/login">
		<input type="hidden" name="originId" value=""/>
		<input type="hidden" name="originEmail" value=""/>
		<input type="hidden" name="originName" value=""/>
		<input type="hidden" name="redi" value="${redi}"/>
        <a class="font-classic text-title immutable" href="./">Travlan</a>
        <h2 class="sr-only">Login Form</h2>
        <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
        <div class="form-group"><input class="form-control" type="text" name="id" placeholder="ID" required/></div>
        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" required/></div>
		<c:if test="${msg == 'failure'}">
			<div class="alert alert-danger">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		</c:if>
        <div class="form-group"><button class="btn btn-primary btn-block" type="submit">로그인</button></div>
        <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='register'">회원가입</button></div>
        <div id="kakao_id_login">
        	<div class="form-group">
        		<button style="background-color: rgba(30,200,0);" class="btn btn-primary btn-block" type="button" onclick="location.href='${naver_url}'"><i class="fas fa-star"></i> 네이버 로그인</button>
        	</div>
            <div class="form-group">
        		<button style="background-color: rgba(255,232,0);" class="btn btn-primary btn-block text-dark" type="button" onclick="location.href='${kakao_url}'"><i class="fas fa-comment"></i> 카카오 로그인</button>
        	</div>
        </div>
		<a class="forgot" href="${pageContext.request.contextPath}/forgot">아이디 혹은 비밀번호를 잊으셨나요?</a>
    </form>
</div>
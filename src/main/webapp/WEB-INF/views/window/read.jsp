<%@ page contentType = "text/html;charset=utf-8" %>

<div class="form-group row">
	<label for="staticEmail" class="col-sm-2 col-form-label">from.</label>
    <div class="col-sm-10">
      	<input type="text" readonly class="form-control-plaintext" value="${dto.send_user_name}" readonly>
    </div>
</div>
<div class="form-group">
    	<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="5" readonly>${dto.content}</textarea>
</div>
<button type="button" onclick="close()" class="btn btn-dark btn-block">닫기</button>

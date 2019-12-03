<%@ page contentType = "text/html;charset=utf-8" %>

<form method="post" class="container-fluid">
	<input type="hidden" name="revice_user" value="${ num }"/>
	<div class="form-group row">
		<label for="staticEmail" class="col-sm-2 col-form-label">to.</label>
    	<div class="col-sm-10">
      		<input type="text" readonly class="form-control-plaintext" value="${ username }">
    	</div>
  	</div>
	<div class="form-group">
    	<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="5"></textarea>
  	</div>
	<button type="submit" class="btn btn-dark btn-block">
		전송
	</button>
</form>
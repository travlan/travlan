<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <div class="container pt-5">
    
        <form class="form-horizontal" action="post_update" method="post" enctype="multipart/form-data" id="post_write">
			<input type="hidden" name="type" value="ABA">
			<input type="hidden" id="thumbnail" name="thumbnail" value="${post.thumbnail}">
			
            <div class="form-group row">
                <div class="col-sm-12">
                    <input type="text" class="form-control" id="title" name="title" value="${post.title}">
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-12">
                    <textarea rows="12" cols="6" id="content" name="content" class="form-control">${post.content}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-1">
                    <label for="">비용  </label>
                </div>
                                
                <div class="col-sm-4">
					<select name="cost" class="form-control">
                        <option value="F"<c:if test="${post.cost == 'F'}">selected</c:if>> 무료</option>
                        <option value="S"<c:if test="${post.cost == 'S'}">selected</c:if>> 적게</option>
                        <option value="M"<c:if test="${post.cost == 'M'}">selected</c:if>> 중간</option>
                        <option value="L"<c:if test="${post.cost == 'L'}">selected</c:if>> 많이</option>
                    </select>
                </div>
                
                <div class="col-sm-1">
                    <label for="">지역  </label>
                </div>
				
				<div class="col-sm-3">
					<select id="province" class="form-control" name="province">
						<option value="XX">지역을 선택해주세요</option>
						<option value="서울"<c:if test="${fn:substringBefore(region, ' ') == '서울'}">selected</c:if> >서울특별시</option>
						<option value="강원"<c:if test="${fn:substringBefore(region, ' ') == '강원'}">selected</c:if> >강원도</option>
						<option value="대전"<c:if test="${fn:substringBefore(region, ' ') == '대전'}">selected</c:if> >대전광역시</option>
						<option value="충남"<c:if test="${fn:substringBefore(region, ' ') == '충남'}">selected</c:if> >충청남도</option>
						<option value="충북"<c:if test="${fn:substringBefore(region, ' ') == '충북'}">selected</c:if> >충청북도</option>
						<option value="인천"<c:if test="${fn:substringBefore(region, ' ') == '인천'}">selected</c:if> >인천광역시</option>
						<option value="경기"<c:if test="${fn:substringBefore(region, ' ') == '경기'}">selected</c:if> >경기도</option>
						<option value="광주"<c:if test="${fn:substringBefore(region, ' ') == '광주'}">selected</c:if> >광주광역시</option>
						<option value="전남"<c:if test="${fn:substringBefore(region, ' ') == '전남'}">selected</c:if> >전라남도</option>
						<option value="전북"<c:if test="${fn:substringBefore(region, ' ') == '전북'}">selected</c:if> >전라북도</option>
						<option value="부산"<c:if test="${fn:substringBefore(region, ' ') == '부산'}">selected</c:if> >부산광역시</option>
						<option value="경남"<c:if test="${fn:substringBefore(region, ' ') == '경남'}">selected</c:if> >경상남도</option>
						<option value="경북"<c:if test="${fn:substringBefore(region, ' ') == '경북'}">selected</c:if> >경상북도</option>
						<option value="울산"<c:if test="${fn:substringBefore(region, ' ') == '울산'}">selected</c:if> >울산광역시</option>
						<option value="대구"<c:if test="${fn:substringBefore(region, ' ') == '대구'}">selected</c:if> >대구광역시</option>
						<option value="제주"<c:if test="${fn:substringBefore(region, ' ') == '제주'}">selected</c:if> >제주도</option>
					</select>
				</div>
				
				<div class="col-sm-3">
					<select id="region_num" class="form-control" name="region_num">
					
					</select>
				</div>
				
				
            </div>

            <div class="form-group row">
            
                <div class="col-sm-1">
                    <label for="">계절  </label>
                </div>
                
                <div class="col-sm-4">
                    <select name="season" class="form-control">
                        <option value="S"<c:if test="${post.season == 'S'}">selected</c:if>> 봄</option>
                        <option value="U"<c:if test="${post.season == 'U'}">selected</c:if>> 여름</option>
                        <option value="F"<c:if test="${post.season == 'F'}">selected</c:if>> 가을</option>
                        <option value="W"<c:if test="${post.season == 'W'}">selected</c:if>> 겨울</option>
                    </select>
                </div>
                
                <div class="col-sm-1 col-sm-offset-1">
                	<label for="">시간  </label>
                </div>
                
                <div class="col-sm-4">
                    <select name="time" class="form-control">
                        <option value="D"<c:if test="${post.time == 'D'}">selected</c:if>> 주간<option>
                        <option value="N"<c:if test="${post.time == 'N'}">selected</c:if>> 야간</option>
                        <option value="M"<c:if test="${post.time == 'M'}">selected</c:if>> 새벽</option>
                        <option value="A"<c:if test="${post.time == 'A'}">selected</c:if>> 하루종일</option>
                    </select>
                </div>
			</div>
			
            <div class="form-group">
                <div style="display: inline-block;text-align: center;">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#thumbnail_modal">제출</button>
                    <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
                </div>
            </div>
        </form>
    </div>
    
    
    <div class="modal fade" id="thumbnail_modal">
  		<div class="modal-dialog">
      		<div class="modal-content">
      		
        		<div class="modal-header">
        			<h4 class="modal-title">썸네일을 설정해주세요!</h4>
          			<button type="button" class="close" data-dismiss="modal">×</button>
        		</div>
        		
        		<div class="modal-body">
          			<input type="file" accept="image/*" id="thumbnail_upload" >
          			<div class="select_img">
          				<img src=""/>
          			</div>
        		</div>
        		
        		<div class="modal-footer">
          			<button type="button" class="btn btn-primary" onclick="submitContents()">제출</button>
        		</div>
        		
      		</div>
    	</div>
	</div>

<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//썸네일 업로드를 위한 data정보
		var reader = new FileReader;
		var formData = new FormData();
		var fileList;
		
		// 스마트에디터 프레임생성
		var editor_obj = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: editor_obj,
		    elPlaceHolder: "content",
		    sSkinURI: "smarteditor2/SmartEditor2Skin.html",
		    htParams : {
		        // 툴바 사용 여부
		        bUseToolbar : true,
		        // 입력창 크기 조절바 사용 여부
		        bUseVerticalResizer : false,
		        // 모드 탭(Editor | HTML | TEXT) 사용 여부
		        bUseModeChanger : true,
		    }
		});

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
	        $("#region_num").val(${post.region_num}).prop("selected", true);
		});
		
	});
	
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
	
	$("#thumbnail_upload").change(function() {
		if(this.files && this.files[0]) {
		    reader.onload = function(data) {
		    	$(".select_img img").attr("src", data.target.result).width(455);        
		    }
		    fileList = this.files;
			reader.readAsDataURL(this.files[0]);
			$("#thumbnail").val(this.files[0].name);
		}
	});
	
	function thumbnailUpload(){
		formData.append("file", fileList[0]);
	
		$.ajax({
	    	url: "utility/thumbnail_uploader",
	   	 	data: formData,
	    	processData: false,
	    	contentType: false,
	    	type: 'POST'
		}).done(function (data) {
			$("#thumbnail").val(data);
			$("#post_write").submit();
		});
	}
	
	
	function submitContents() {
	editor_obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	if($("#thumbnail").val() != "default.jpg"){
		thumbnailUpload();
	} else {
		$("#post_write").submit();
		}
	}
</script>
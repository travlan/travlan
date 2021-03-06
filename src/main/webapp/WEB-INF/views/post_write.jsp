<%@ page contentType="text/html; charset=UTF-8"%>

<section class="clean-block clean-post dark">
    <div class="container pt-5">
        <form class="form-horizontal" action="post_write" method="post" enctype="multipart/form-data" id="post_write">
			<input type="hidden" name="member_num" value="${sessionScope.num}">
			<input type="hidden" id="thumbnail" name="thumbnail" value="default.jpg">
			<div class="row">
				<div class="col-md-9">
					<div class="form-group">
		                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
		            </div>
		            <div class="form-group block-content">
		                <textarea rows="12" cols="12" id="content" name="content" class="form-control"></textarea>
		            </div>
				</div>
				<div class="col-md-3">
					<div class="form-group block-content p-2">
		                <label class="font-myungjo">타입 </label>
		                  
						<select class="form-control" name="type1">
							<option value="A">빡빡한 일정</option>
							<option value="B">느슨한 일정</option>
						</select>
						<select class="form-control" name="type2">
							<option value="A">주간 여행</option>
							<option value="B">야간 여행</option>
						</select>
						<select class="form-control" name="type3">
							<option value="A">활기찬 분위기</option>
							<option value="B">조용한 분위기</option>
						</select>
		            </div>
					<div class="form-group block-content p-2">
		                <label class="font-myungjo">비용  </label>
		                  
						<select name="cost" class="form-control">
		                    <option value="F">무료</option>
		                    <option value="S">적게</option>
		                    <option value="M">중간</option>
		                    <option value="L">많이</option>
		                </select>
		            </div>
		            <div class="form-group block-content p-2">
		                <label class="font-myungjo">지역  </label>
						
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
						<select id="region_num" class="form-control" name="region_num">
						</select>
						
						
		            </div>
		
		            <div class="form-group block-content p-2">
		                <label class="font-myungjo">계절  </label>
		                <select name="season" class="form-control">
		                   <option value="S">봄</option>
		                   <option value="U">여름</option>
		                   <option value="F">가을</option>
		                   <option value="W">겨울</option>
		                </select>
		             </div>
		             <div class="form-group block-content p-2">
		                <label class="font-myungjo">시간  </label>
		                	
		                <select name="time" class="form-control">
		                    <option value="D">주간</option>
		                    <option value="N">야간</option>
		                    <option value="M">새벽</option>
		                    <option value="A">하루종일</option>
		                </select>
					</div>
					
		            <div class="form-group block-content">
		                <button type="button" class="btn btn-dark btn-block" data-toggle="modal" data-target="#thumbnail_modal">제출</button>
		                <button type="button" class="btn btn-secondary btn-block" onclick="history.back()">취소</button>
		            </div>
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
	
</section>
<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
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
		if($("#title").val.length == 0){
			alert("제목을 입력해주세요!");
			return false;
		}
		else if($("#province").val() == 'XX'){
			alert("지역을 선택해주세요!");
			return false;
			}else{
				editor_obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				if($("#thumbnail").val() != "default.jpg"){
					thumbnailUpload();
				} else {
					$("#post_write").submit();
				}
			return true;
		}
	}
</script>
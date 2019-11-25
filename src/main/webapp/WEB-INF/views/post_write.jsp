<%@ page contentType="text/html; charset=UTF-8"%>

    <div class="container">
        <form class="form-horizontal" action="post_write" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="num" value="${num}">
			
            <div class="form-group">
                <div class="col-sm-12">
                    <input type="text" class="form-control" id="title" name="title">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <textarea rows="12" cols="6" id="content" name="content" class="form-control"></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-sm-6">
                        <label for="">비용 | </label>
						<select name="cost">
                            <option value="F">무료</option>
                            <option value="S">적게</option>
                            <option value="M">중간</option>
                            <option value="L">많이</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <label for="">지역 |  </label>
							<input type="hidden" name="region_num" value="450">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-sm-6">
                        <label for="">계절 | </label>
                        <select name="season">
                            <option value="S">봄</option>
                            <option value="U">여름</option>
                            <option value="F">가을</option>
                            <option value="W">겨울</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                    <label for="">시간 | </label>
                        <input type="checkbox" name="time_day" id="time_day" value="D">주간
                        <input type="checkbox" name="time_night" id="time_night" value="N">야간
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div style="display: inline-block;text-align: center;">
                    <button type="submit" class="btn btn-primary">제출</button>
                    <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
                </div>
            </div>
        </form>
    </div>


<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
        var obj = [];
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
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
</script>
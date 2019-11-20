<%@ page contentType="text/html; charset=UTF-8"%>

    <div class="container">
        <form class="form-horizontal" action="post_write" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${num}">
			
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
						
                    </div>
                    <div class="col-sm-6">
                        <label for="">지역 |  </label>
						
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-sm-6">
                        <label for="">계절 | </label>
                        <select name="season">
                            <option value="spring">봄</option>
                            <option value="summer">여름</option>
                            <option value="fall">가을</option>
                            <option value="winter">겨울</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                    <label for="">시간 | </label>
                        <input type="checkbox" name="time" id="time" value="day">주간
                        <input type="checkbox" name="time" id="time" value="night">야간
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
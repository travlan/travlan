<%@ page contentType = "text/html;charset=utf-8" %>

<form method="post">
    <label>받는 사람 </label>
    <input name="id" readonly value="${ username }"/>
    <input type="hidden" name="revice_user" value="${ num }"/>
    <textarea name="content"></textarea>
    <input type="submit" value="전송">
</form>
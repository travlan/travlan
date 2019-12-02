<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    form {
        width: 300px;
        border: 1px solid #ccc;
    }
    form > * {
        box-sizing: border-box;
        display: block;
        width: 100%;
    }
    </style>
</head>
<body>
    <form>
        <label>신고 대상 : </label>
        <input name="id" readonly value="배진오"/>
        <label>신고 사유 : </label>
        <textarea name="content"></textarea>
        <input type="submit" value="전송">
    </form>
</body>
</html>
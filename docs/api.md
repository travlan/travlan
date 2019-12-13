#### 양식을 맞춰주세요

데이터 생성 위치에 따라서 데이터 앞에 아래 수식을 붙여주세요.

- <FORM> : 폼에서 전달되는 값
- <DB> : DB에서 꺼내오는 값
- 그 외 : 임의로 생성한 값

---

@ 아이디 중복 확인

```
url : '/idcheck'
param : { 'id' : '<FORM>USER_ID' }
return : {
    'flag' : 'Y' | 'N',
}
```

@ 이메일 중복 확인

```
url : '/emailcheck'
param : { 'email' : '<FORM>USER_EMAIL' }
return : {
    'flag' : 'Y' | 'N',
}
```

@ 아이디 찾기

```
url : '/find_id'
param : { 'email' : '<FORM>USER_EMAIL' }
return : {
    'result' : '<DB>USER_ID' | 'N'
}
```

@ 비밀번호 찾기

```
url : '/find_passwd'
param : { 'email' : '<FORM>USER_EMAIL', 'id' : '<FORM>USER_ID' }
return : {
    'result' : '<DB>USER_PASSWORD' | 'N'
}
```

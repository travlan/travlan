package com.sts.travlan;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverController {
	
	/* 인증 요청문을 구성하는 파라미터 
	 * CLIENT_ID : 애플리케이션 등록 후 발급받은 클라이언트 아이디
	 * CLIENT_SECRET : 클라이언트 비밀번호, 외부 노출되면 안됨
	 * REDIRECT_URI : 로그인 인증의 결과를 전달받을 콜백 URL
	 * SESSION_STATE : 애플리케이션이 생성한 상태 토큰
	 */
	private final static String CLIENT_ID = "1cDUN92_cxYMa42bsbLW";
	private final static String CLIENT_SECRET = "cmfCv0aenX";
	private final static String REDIRECT_URI = "http://travlan.tk/naverlogin";
	private final static String SESSION_STATE = "oauth_state";
	
	/* 네이버 아이디로 인증 URL 생성 Method */
	public String getAuthorizationUrl(HttpSession session) {
		
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();

		setSession(session, state);
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	/* 네이버 아이디로 콜백 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		
		/* 콜백으로 전달받은 세션 검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		
		String sessionState = getSession(session);
		
		if(StringUtils.equals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
			
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */			
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			
			return accessToken;
		}
		
		return null;
	}
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		
		return UUID.randomUUID().toString();
	}
	
	private void setSession(HttpSession session, String state) {
		
		session.setAttribute(SESSION_STATE, state);
	}
	
	private String getSession(HttpSession session) {
		
		return (String)session.getAttribute(SESSION_STATE);
	}
	
	/* PROFILE_API_URL : 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.build(NaverLoginApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		
		return response.getBody();
	}
}

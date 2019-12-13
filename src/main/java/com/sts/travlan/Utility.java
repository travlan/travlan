package com.sts.travlan;

import java.util.HashMap;
import java.util.Map;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;
import com.model.mapper.CommentMapper;
import com.model.mapper.Member_ScrapMapper;
import com.model.mapper.PostMapper;

public class Utility {
	
	public static int checkScrap(int member_num, int post_num, Member_ScrapMapper scrap_mapper) {
		Map map = new HashMap();
		map.put("member_num", member_num);
		map.put("post_num", post_num);
		
		return scrap_mapper.checkScrap(map);
	}
	
	public static int mcount(int member_num, CommentMapper comment_mapper) {
		return comment_mapper.mycomment(member_num);
	}
	
	public static int pcount(int member_num, PostMapper post_mapper) {
		return post_mapper.mypost(member_num);
	}
	
	public static int count(int post_num, CommentMapper comment_mapper) {
		return comment_mapper.total(post_num);
	}
	
	public String isLoginFilter(HttpSession session, String uri) {
	if ((String)session.getAttribute("id") == null) {
		return "/login";
		}else {
			return uri;
		}
	}
	
	public String isLoginFilter(HttpSession session) {
		if ((String)session.getAttribute("id") == null) {
			return "/register";
		}else {
			return "redirect:home";
		}
	}
	
	public String encryptPassword(String password) throws NoSuchAlgorithmException {

	    MessageDigest md = MessageDigest.getInstance("SHA-256");
	    md.update(password.getBytes());
	    return bytesToHexString(md.digest());
	}
	
	private static String bytesToHexString(byte[] bytes) {
		
        final char[] hexArray = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
        char[] hexChars = new char[bytes.length * 2];
        int v;
        for ( int j = 0; j < bytes.length; j++ ) {
            v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
	}  
}


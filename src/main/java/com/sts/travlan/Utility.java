package com.sts.travlan;

import java.util.HashMap;
import java.util.Map;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.model.mapper.CommentMapper;
import com.model.mapper.Member_ScrapMapper;
import com.model.mapper.PostMapper;

public class Utility {
	
	public static int scount(int post_num, Member_ScrapMapper scrap_mapper) {
		return scrap_mapper.countScrap(post_num);
	}
	
	public String getRandomIdnPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', 
				'6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 
				'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
		};
		
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < len; i++) {
			idx = (int)(charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		
		return sb.toString();
	}
	
	
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
	
	public static int totalr(int post_num, CommentMapper comment_mapper) {
		return comment_mapper.totalRate(post_num);
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
	
	public String sendPwtoEmail(String email, String id, JavaMailSenderImpl mailSender) {
		int randomNum = (int) ((Math.random() * 10000 + 1)) ;
		String newPasswd = "travlan" + randomNum;
		
	    String setfrom = "admin@travlan.tk";         
	    String tomail  = email;
	    String title   = "Travlan";
	    String content = "안녕하세요! Travlan입니다.\n\n" + id 
	    		       + "님의 비밀번호는 " + newPasswd + "로 변경되었습니다.\n\n"
	    		       + "꼭 로그인해서 비밀번호를 변경해주시길 바랍니다.";
	    
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	      
	      messageHelper.setFrom(setfrom);
	      messageHelper.setTo(tomail);
	      messageHelper.setSubject(title); 
	      messageHelper.setText(content);
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    
		return newPasswd;
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


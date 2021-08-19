package com.jeju.trip.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.jeju.trip.vo.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class AdminTest {
	
	@Autowired
	private MemberService service;
	
	@Test
	public void Admin() throws Exception{
		MemberVO vo = new MemberVO();
		
		vo.setId("admin00");
		vo.setPassword("00");
		vo.setName("관리자");
		vo.setEmail("abcd@naver.com");
		vo.setGender("1");
		vo.setPhone("01000000");
		vo.setAuth("ROLE_ADMIN");
		
		service.register(vo);
		
		log.info("vo:" +vo);
	
	}
}

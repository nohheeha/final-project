package com.jeju.trip.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jeju.trip.vo.QnAVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnAServiceTests {
	
	@Autowired
	private QnAService service;
	
	@Test
	public void testPrint(){
		
		log.info(service);
		
	}
	
	@Test
	public void testGet(){
		QnAVO vo = service.get(2L);
		
		log.info(vo);
	}
	
	@Test
	public void testRegister(){
		
		QnAVO vo = new QnAVO();
		vo.setTitle("테스트");
		vo.setContent("테스트테스트");
		vo.setId("테스터");
		
		long qseq = service.register(vo);
		
		log.info("QSEQ : "+qseq);
	}
}

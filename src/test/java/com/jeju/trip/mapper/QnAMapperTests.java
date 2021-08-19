package com.jeju.trip.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.QnAVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnAMapperTests {

	@Autowired
	private QnAMapper qnaMapper;
	
	@Test
	public void testInsertSelectKey(){
		
		QnAVO vo = new QnAVO();
		vo.setTitle("Test 테스트");
		vo.setContent("Content 테스트");
		vo.setId("tester");
		
		qnaMapper.insertSelectKey(vo);
	}
	
	@Test
	public void testRead(){
		
		QnAVO vo = qnaMapper.read(6L);
		
		log.info(vo);
	}
	
	@Test
	public void testUpdateCount(){
		
		qnaMapper.updateCount(6L);
		
	}
	
	@Test
	public void testDelete(){
		
		int count = qnaMapper.delete(1L);
		
		log.info(count);
	}
	
	@Test
	public void testUpdate(){
		
		QnAVO vo = new QnAVO();
		vo.setQseq(2L);
		vo.setTitle("Updated Title");
		vo.setContent("Updated Content");
		
		int count = qnaMapper.update(vo);
		
		log.info("count: "+count);
	}
	
	@Test
	public void testPaging(){
		Criteria cri = new Criteria();
		
		List<QnAVO> list = qnaMapper.getListWithPaging(cri);
		
		list.forEach(b -> log.info(b));
	}
}

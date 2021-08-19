package com.jeju.trip.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jeju.trip.service.ReplyService;
import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/replies/")
@AllArgsConstructor
public class ReplyContoller {

	private ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new", consumes="application/json",produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		log.info("ReplyVO : "+vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply INSERT COUNT : "+insertCount);
		
		return insertCount==1? 
				new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{qseq}/{page}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("qseq") Long qseq){
		log.info("getList........");
		
		Criteria cri = new Criteria(page, 10);
		
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, qseq), HttpStatus.OK);
	}
	
	@GetMapping(value="/{rseq}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rseq") Long rseq){
		
		log.info("get : "+rseq);
		
		return new ResponseEntity<>(service.get(rseq), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.id")
	@DeleteMapping(value="/{rseq}", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rseq") Long rseq){
		
		log.info("remove : "+rseq);
		
		return service.remove(rseq)==1?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.id")
	@RequestMapping(method={RequestMethod.PUT, RequestMethod.PATCH}, value="/{rseq}", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rseq") Long rseq){
		vo.setRseq(rseq);
		
		log.info("rseq : "+rseq);
		log.info("modify : "+vo);
		
		return service.modify(vo)==1?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}

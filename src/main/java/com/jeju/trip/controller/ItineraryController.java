package com.jeju.trip.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeju.trip.service.ItineraryService;
import com.jeju.trip.vo.ItineraryVO;
import com.jeju.trip.vo.ListVO;
import com.jeju.trip.vo.TripVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/Itinerary/*")
@RequiredArgsConstructor
@Log4j
public class ItineraryController {

	private final ItineraryService service;
	
	
	@GetMapping("/map")
	public void list(Model model){
		log.info("map.......");
		
	}
	
	@ResponseBody
	@PostMapping(value="/save")
	public int save(Long[] tseqList, Long iseq){
		System.out.println("save 호출!!");
		System.out.println("tseqList : "+tseqList+", iseq : "+iseq);
		
		
		int num = service.updateList(tseqList, iseq);
		
	    return num;
	}
	
	@ResponseBody
	@GetMapping(value="/get")
	public String get(String id){
		log.info("get 호출!!! id : "+id);
		
		List<ItineraryVO> list = service.get(id);
		
	    return makeJson(list);
	}
	
	@ResponseBody
	@GetMapping(value="/getList")
	public String getList(Long iseq){
		System.out.println("getList 호출!! iseq : "+iseq);

		List<TripVO> list = service.getList(iseq);
		System.out.println("list---------------------"+list);
	    return makeJson(list);
	}
	
	@ResponseBody
	@GetMapping(value="/addCalendar")
	public void addCalendar(ItineraryVO vo){
		System.out.println("addCalendar 호출!! title : "+vo.getTitle());
		System.out.println("addCalendar 호출!! id : "+vo.getId());

		service.addItinerary(vo);
		
	}
	
	@ResponseBody
	@GetMapping(value="/removeItinerary")
	public void removeItinerary(Long iseq){
		System.out.println("removeItinerary 호출!! iseq : "+iseq);

		service.removeItinerary(iseq);
		
	}
	
	@ResponseBody
	@GetMapping(value="/addList")
	public void addList(ListVO vo){
		System.out.println("addList 호출!! iseq : "+vo.getIseq());
		System.out.println("addList 호출!! tseq : "+vo.getTseq());
		
		service.addList(vo);
		
	}
	
	private String makeJson(Object obj){
		ObjectMapper mapper = new ObjectMapper();

		String jsonStr=null;
		try {
			jsonStr = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		log.info(jsonStr);
		
	    return jsonStr;
	}
}

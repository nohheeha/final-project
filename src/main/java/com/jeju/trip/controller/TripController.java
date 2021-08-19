package com.jeju.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeju.trip.service.TripService;
import com.jeju.trip.vo.PageMaker;
import com.jeju.trip.vo.TripSearch;
import com.jeju.trip.vo.TripVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/Trip/*")

public class TripController {
	private final TripService service;
	
	@GetMapping(value="/Tourlist")
	public String TourController(@ModelAttribute("scri") TripSearch scri, Model model){
		model.addAttribute("tourlist", service.TourList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "Trip/Tourlist";
	}
	
	@GetMapping(value="/Lodgelist")
	public String LodgeController(@ModelAttribute("scri") TripSearch scri, Model model){
		model.addAttribute("lodgelist", service.LodgeList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "Trip/Lodgelist";
	}
	
	@GetMapping(value="/Shoplist")
	public String ShopController(@ModelAttribute("scri") TripSearch scri, Model model){
		model.addAttribute("shoplist", service.ShopList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "Trip/Shoplist";
	}
	
	@GetMapping(value="/Foodlist")
	public String FoodController(@ModelAttribute("scri") TripSearch scri,Model model){
		model.addAttribute("foodlist", service.FoodList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "Trip/Foodlist";
	}
	
	@GetMapping("/TourView")
	public String Read(TripVO vo, Model model){
		
		model.addAttribute("read", service.read(vo.getTseq()));
		return "Trip/TourView";
		
	}
	
	@ResponseBody
	@RequestMapping("/likeup")
	public Long likeup(TripVO vo){
		
		
		return service.likeup(vo);
	}
	
	

}

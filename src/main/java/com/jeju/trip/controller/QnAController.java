package com.jeju.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeju.trip.service.QnAService;
import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.PageDTO;
import com.jeju.trip.vo.QnAVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/QnA/*")
@Log4j
public class QnAController {

	private final QnAService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model){
		log.info(cri);
		log.info("list.......");
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping("/register")
	public void registerGET(){
		
	}
	
	@PostMapping("/register")
	public String register(QnAVO vo, RedirectAttributes rttr){
		log.info("vo: "+vo);
		
		Long qseq = service.register(vo);
		
		log.info("qseq: "+qseq);
		
		rttr.addFlashAttribute("result", qseq);
		
		return "redirect:/QnA/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("qseq") Long qseq, @ModelAttribute("cri") Criteria cri, Model model){
		
		model.addAttribute("vo", service.get(qseq));
		
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("qseq") Long qseq, @ModelAttribute("cri") Criteria cri, Model model){
		
		model.addAttribute("vo", service.getModify(qseq));
		
	}
	
	@PostMapping("/modify")
	public String modify(QnAVO vo, Criteria cri, RedirectAttributes rttr){
		
		int count = service.modify(vo);
		
		if(count==1){
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/QnA/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("qseq") Long qseq, Criteria cri, RedirectAttributes rttr){
		
		int count = service.remove(qseq);
		
		if(count==1){
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/QnA/list";
	}
	
}

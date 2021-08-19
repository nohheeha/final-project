package com.jeju.trip.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeju.trip.service.MemberService;
import com.jeju.trip.service.QnAService;
import com.jeju.trip.service.TripService;
import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.MemberVO;
import com.jeju.trip.vo.PageDTO;
import com.jeju.trip.vo.QnAVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	private final MemberService mservice;
	
	private final QnAService service;
	
	private final TripService tservice;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void getRegister(Model model) throws Exception {
		log.info("get adminMain");
		model.addAttribute("trip", tservice.triplist());
	}
	

	
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
		
		return "redirect:/admin/list";
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
		
		return "redirect:/admin/list";
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
		
		return "redirect:/admin/list";
	}
	
	@RequestMapping("/getMember")
	public void memberList(Model model){
		
		model.addAttribute("get",mservice.memberList());
	}
	
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView( Model model, HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		model.addAttribute("member", mservice.getMember(id));
		log.info("클릭한아이디:" + id);
		
		return "admin/memberUpdateView";
	}
	
	@RequestMapping(value="/adminUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session, Model model) throws Exception{
		
		mservice.adminUpdate(vo);
		
		model.addAttribute("get",mservice.memberList());
		
		return "admin/getMember";
	}
	
	
	
	
		
}

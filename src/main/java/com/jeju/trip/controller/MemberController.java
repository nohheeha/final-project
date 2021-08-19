package com.jeju.trip.controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeju.trip.service.MemberService;
import com.jeju.trip.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/Member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	private final MemberService service;
	
	private final BCryptPasswordEncoder pwdEncoder;
	
	
	// 회원가입 get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get register");
		}
		
		// 회원가입 post
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(MemberVO vo, Model model, HttpServletRequest request) throws Exception {
			logger.info("post register");
			int result = service.idChk(vo);
			
			try {
				if(result == 1) {
					
					return "redirect:/Member/register";
				}else if(result == 0) {
					request.setCharacterEncoding("UTF-8");
					
					service.register(vo);
					
				}
				
			} catch (Exception e) {
				System.out.println("regester err:" + e.getMessage());
			}
			
			
			
			return "Member/Login";
		}
		
		@RequestMapping(value = "/Login", method = RequestMethod.GET)
		public void getlogin(String error, String logout, Model model) throws Exception {
			
			logger.info("로그인 페이지로 이동~");
			logger.info("err :" + error );
			logger.info("logout : " + logout );
			if(error != null) { 
				model.addAttribute("error","아이디와 비밀번호를 확인해주세요"); 
			} 
			if(logout != null) { 
				model.addAttribute("logout","로그아웃"); 
			}
		}
		
		@RequestMapping(value = "/login-processing", method = RequestMethod.POST)
		public void login(String error, HttpSession session, String username) throws Exception{
			logger.info("post login");
			
			
			logger.info("login-processing!");
			logger.info("err :" + error );
		}
		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			Authentication auth =SecurityContextHolder.getContext().getAuthentication();
			if(auth!=null){
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			return "Member/Login";
		}
		
		@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
		public String registerUpdateView(Principal principal, Model model, HttpServletRequest request) throws Exception{
			String id = principal.getName();
			model.addAttribute("member", service.getMember(id));
			
			return "Member/memberUpdateView";
		}
		
		@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
		public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
			
			service.memberUpdate(vo);
			
			session.invalidate();
			
			return "Member/Login";
		}
		
		/**
		// 회원 탈퇴 get
		@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
		public String memberDeleteView(Model model, Principal principal) throws Exception{
			
			String id = principal.getName();
			model.addAttribute("delete", service.getMember(id));
			return "Member/memberDeleteView";
		}
		**/
		
		// 회원 탈퇴 post
		@RequestMapping(value="/memberDelete")
		public String memberDelete(Principal principal) throws Exception{
			/**
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVO member = (MemberVO) session.getAttribute("member");
			// 세션에있는 비밀번호
			String sessionPass = member.getPassword();
			// vo로 들어오는 비밀번호
			String voPass = vo.getPassword();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/Member/memberDeleteView";
			}
			**/
			String id = principal.getName();
			
			int result = service.memberDelete(id);
			
			if(result>0){
				
				SecurityContextHolder.clearContext();
			}
			return "Member/Login";
		}
		
		// 아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="/idChk", method = RequestMethod.POST)
		public int idChk(MemberVO vo) throws Exception {
			int result = service.idChk(vo);
			return result;
		}
		
		@RequestMapping("/getMember")
		public void getMember(String id, Model model, HttpSession session, Principal principal) throws Exception{
			id = principal.getName();
			model.addAttribute("member", service.getMember(id));
		}

		
		
		@ResponseBody
		@RequestMapping(value="/passChk", method=RequestMethod.POST)	
		public boolean passChk(MemberVO vo, Principal principal) throws Exception{
			String id = principal.getName();
			MemberVO member = service.getMember(id);
			boolean pwdChk = pwdEncoder.matches(vo.getPassword(), member.getPassword());
			return pwdChk;
		}
		
	
}

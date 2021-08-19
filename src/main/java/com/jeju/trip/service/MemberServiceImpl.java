package com.jeju.trip.service;


import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jeju.trip.mapper.MemberMapper;
import com.jeju.trip.security.CustomUserDetails;
import com.jeju.trip.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.ToString;


@Service
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper mapper;
	
	
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@Override
	public void register(MemberVO vo) throws Exception {
		System.out.println("Befor Encoder : " + vo.getPassword());
		
		String encodedPassword = bcryptPasswordEncoder.encode(vo.getPassword());
		
		System.out.println("After Encoder : " + encodedPassword);
		System.out.println("Resister User Info : " + vo);
		
		vo.setPassword(encodedPassword);
		
		mapper.register(vo);
		
	}


	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return mapper.login(vo);
	}


	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		System.out.println("Befor Encoder : " + vo.getPassword());
		
		String encodedPassword = bcryptPasswordEncoder.encode(vo.getPassword());
		
		System.out.println("After Encoder : " + encodedPassword);
		System.out.println("Resister User Info : " + vo);
		
		vo.setPassword(encodedPassword);
		mapper.memberUpdate(vo);
		
	}


	@Override
	public MemberVO getMember(String id) throws Exception {
		
		return mapper.getMember(id);
	}


	


	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = mapper.idChk(vo);
		return result;
	}


	@Override
	public CustomUserDetails getUserById(String id) {
		CustomUserDetails users= mapper.getUserById(id);
		return users;
	}


	@Override
	public int memberDelete(String id) throws Exception {
		
		return mapper.memberDelete(id);
	}


	@Override
	public List<MemberVO> memberList() {
		
		return mapper.memberList();
	}


	@Override
	public void adminUpdate(MemberVO vo) {
		mapper.adminUpdate(vo);
		
	}
	
	

}

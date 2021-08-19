package com.jeju.trip.service;



import java.util.List;

import com.jeju.trip.security.CustomUserDetails;
import com.jeju.trip.vo.MemberVO;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO getMember(String id) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public int memberDelete(String id) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	CustomUserDetails getUserById(String id);
	
	public List<MemberVO> memberList();
	
	public void adminUpdate(MemberVO vo);
	
	
}
 
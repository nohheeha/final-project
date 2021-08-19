package com.jeju.trip.service;

import java.util.List;

import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.ReplyVO;

public interface ReplyService {

	int register(ReplyVO vo);
	
	ReplyVO get(Long rseq);
	
	int modify(ReplyVO vo);
	
	int remove(Long rseq);
	
	List<ReplyVO> getList(Criteria cri, Long qseq);
}

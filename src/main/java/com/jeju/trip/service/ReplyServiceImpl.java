package com.jeju.trip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.trip.mapper.ReplyMapper;
import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rseq) {

		return mapper.read(rseq);
	}

	@Override
	public int modify(ReplyVO vo) {

		return mapper.update(vo);
	}

	@Override
	public int remove(Long rseq) {

		return mapper.delete(rseq);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long qseq) {

		return mapper.getList(cri, qseq);
	}

}

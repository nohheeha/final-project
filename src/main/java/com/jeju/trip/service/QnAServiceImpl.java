package com.jeju.trip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jeju.trip.mapper.QnAMapper;
import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.QnAVO;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class QnAServiceImpl implements QnAService {

	private final QnAMapper mapper;

	@Override
	public Long register(QnAVO vo) {
		
		mapper.insertSelectKey(vo);
		
		return vo.getQseq();
	}

	@Override
	public QnAVO get(Long qseq) {
		
		mapper.updateCount(qseq);
		
		return mapper.read(qseq);
	}

	@Override
	public int modify(QnAVO vo) {
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long qseq) {
		
		return mapper.delete(qseq);
	}

	@Override
	public List<QnAVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public QnAVO getModify(Long qseq) {
		
		return mapper.read(qseq);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}
	
	
}

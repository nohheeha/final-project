package com.jeju.trip.service;

import java.util.List;

import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.QnAVO;

public interface QnAService {

	Long register(QnAVO vo);
	
	QnAVO get(Long qseq);
	
	QnAVO getModify(Long qseq);
	
	int modify(QnAVO vo);
	
	int remove(Long qseq);
	
	List<QnAVO> getList(Criteria cri);
	
	int getTotal(Criteria cri);
}

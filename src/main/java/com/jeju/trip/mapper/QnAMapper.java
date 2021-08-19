package com.jeju.trip.mapper;

import java.util.List;

import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.QnAVO;

public interface QnAMapper {

	void insertSelectKey(QnAVO vo);
	
	QnAVO read(Long qseq);
	
	void updateCount(Long qseq);
	
	int delete(Long qseq);
	
	int update(QnAVO vo);
	
	List<QnAVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
}

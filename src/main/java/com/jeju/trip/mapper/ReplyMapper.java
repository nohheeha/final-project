package com.jeju.trip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeju.trip.vo.Criteria;
import com.jeju.trip.vo.ReplyVO;

public interface ReplyMapper {

	int insert(ReplyVO vo);
	
	ReplyVO read(Long rseq);
	
	int delete(Long rseq);
	
	int update(ReplyVO vo);
	
	List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("qseq") Long qseq);
}

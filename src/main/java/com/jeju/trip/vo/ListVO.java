package com.jeju.trip.vo;

import lombok.Data;

@Data
public class ListVO {

	private Long lseq;
	private Long lorder;	// 일정 내의 순서
	private Long iseq;		// 일정
	private Long tseq;		// 일정 내의 여행지들
	
}

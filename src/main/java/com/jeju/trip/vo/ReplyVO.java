package com.jeju.trip.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rseq;
	private Long qseq;
	
	private String id;
	private String content;
	private Date regDate;
	
}

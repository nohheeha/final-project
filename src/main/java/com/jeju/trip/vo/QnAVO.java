package com.jeju.trip.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnAVO {

	private Long qseq;
	private String id;
	private String title;
	private String content;
	private Long count;
	private Date regDate;
	private Date updateDate;
	
}

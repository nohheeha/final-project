package com.jeju.trip.vo;

import lombok.Data;

@Data
public class LikeVO {
	private String ltmid;
	private int ltbid;
	private int ltlike;
	private int count;
 
	public LikeVO() {
		
	}

}

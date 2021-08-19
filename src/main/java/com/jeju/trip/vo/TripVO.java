package com.jeju.trip.vo;

import lombok.Data;

@Data
public class TripVO {
	private int tseq;
	private Long contentid;
	private Long contenttypeid;
	private String title;
	private String address1;
	private String address2;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private Double mapx;
	private Double mapy;
	private String zipcode;
	private String tel;
	private Long likecnt;
	
	public TripVO(){
		
	}

	
	
	
}

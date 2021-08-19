package com.jeju.trip.vo;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String password;
	private String name;
	private String email;
	private String gender;
	private String phone;
	private String auth;
	private int enabled;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

}

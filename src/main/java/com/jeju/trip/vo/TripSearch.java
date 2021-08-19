package com.jeju.trip.vo;

public class TripSearch extends TripCriteria {
	private String searchType = "";
	private String keyword = "";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "TripSearch [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	
}

package com.jeju.trip.service;

import java.util.List;

import com.jeju.trip.vo.TripCriteria;
import com.jeju.trip.vo.TripSearch;
import com.jeju.trip.vo.TripVO;

public interface TripService {
	List<TripVO> TourList(TripSearch scri);
	
	List<TripVO> ShopList(TripSearch scri);
	
	List<TripVO> LodgeList(TripSearch scri);
	
	List<TripVO> FoodList(TripSearch scri);
	
	TripVO read(int tseq);
	
	int listCount(TripSearch scri);
	
	Long likeup(TripVO vo);
	
	List<TripVO> triplist();

}

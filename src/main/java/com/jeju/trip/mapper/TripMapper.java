package com.jeju.trip.mapper;

import java.util.List;

import com.jeju.trip.vo.TripSearch;
import com.jeju.trip.vo.TripVO;

public interface TripMapper {
	List<TripVO> TourList(TripSearch scri);
	
	List<TripVO> ShopList(TripSearch scri);
	
	List<TripVO> LodgeList(TripSearch scri);
	
	List<TripVO> FoodList(TripSearch scri);
	
	TripVO read(int tseq);
	
	int listCount(TripSearch scri);
	
	Long likeup(TripVO vo);
	
	List<TripVO> triplist();


}

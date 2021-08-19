package com.jeju.trip.mapper;

import java.util.List;
import java.util.Map;

import com.jeju.trip.vo.ItineraryVO;
import com.jeju.trip.vo.ListVO;
import com.jeju.trip.vo.TripVO;

public interface ItineraryMapper {

	List<ItineraryVO> get(String id);
	
	List<Long> getTseqList(Long iseq);
	
	List<TripVO> getDetailList(Map<String, List<Long>> map);
	
	int deleteList(Long iseq);
	
	int insertList(Map<String, List<ListVO>> map);
	
	int insertItinerary(ItineraryVO vo);
	
	int deleteItinerary(Long iseq);
	
	int insertItineraryList(ListVO vo);
}

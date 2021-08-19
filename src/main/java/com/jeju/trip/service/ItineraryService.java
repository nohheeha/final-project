package com.jeju.trip.service;

import java.util.List;

import com.jeju.trip.vo.ItineraryVO;
import com.jeju.trip.vo.ListVO;
import com.jeju.trip.vo.TripVO;

public interface ItineraryService {

	List<ItineraryVO> get(String id);
	
	List<TripVO> getList(Long iseq);
	
	int updateList(Long[] tseqList, Long iseq);
	
	int addItinerary(ItineraryVO vo);
	
	int removeItinerary(Long iseq);
	
	int addList(ListVO vo);
	
}

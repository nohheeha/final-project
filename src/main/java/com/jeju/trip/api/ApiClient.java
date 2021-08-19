package com.jeju.trip.api;

import java.util.List;

import com.jeju.trip.vo.TripVO;

public class ApiClient {
	

	public static void main(String[] args) {
		
		
		TourApi api = new TourApi();
		
		List<TripVO> lt = api.getTour();
		
		
		ApiDAO dao = new ApiDAO();
		
		dao.insertTour(lt);
		
		
		
		
		
	}
		

	

}

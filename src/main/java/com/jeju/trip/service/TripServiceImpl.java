package com.jeju.trip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jeju.trip.mapper.TripMapper;
import com.jeju.trip.vo.TripCriteria;
import com.jeju.trip.vo.TripSearch;
import com.jeju.trip.vo.TripVO;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class TripServiceImpl implements TripService {
	private final TripMapper mapper;
	

	@Override
	public TripVO read(int tseq) {
		
		return mapper.read(tseq);
	}

	@Override
	public List<TripVO> TourList(TripSearch scri) {
		
		return mapper.TourList(scri);
	}

	@Override
	public List<TripVO> ShopList(TripSearch scri) {
		
		return mapper.ShopList(scri);
	}

	@Override
	public List<TripVO> LodgeList(TripSearch scri) {
		
		return mapper.LodgeList(scri);
	}

	@Override
	public List<TripVO> FoodList(TripSearch scri) {
		
		return mapper.FoodList(scri);
	}

	@Override
	public int listCount(TripSearch scri) {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

	@Override
	public Long likeup(TripVO vo) {
		mapper.likeup(vo);
		
		return vo.getLikecnt();
	}

	@Override
	public List<TripVO> triplist() {
		// TODO Auto-generated method stub
		return mapper.triplist();
	}

}

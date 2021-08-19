package com.jeju.trip.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.jeju.trip.mapper.ItineraryMapper;
import com.jeju.trip.vo.ItineraryVO;
import com.jeju.trip.vo.ListVO;
import com.jeju.trip.vo.TripVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItineraryServiceImpl implements ItineraryService {

	private final ItineraryMapper mapper;
	
	@Override
	public List<ItineraryVO> get(String id) {
		return mapper.get(id);
	}

	@Override
	public List<TripVO> getList(Long iseq) {
		
		List<Long> tseqList = mapper.getTseqList(iseq);
		System.out.println(tseqList.toString());
		
		if(tseqList.size()==0){
			return null;
		}
		
		Map<String, List<Long>> map = new HashMap<String, List<Long>>();
		map.put("tseqList", tseqList);
		
		return mapper.getDetailList(map);
	}

	@Override
	public int updateList(Long[] tseqList, Long iseq) {
		
		List<ListVO> list = new ArrayList<ListVO>();
		ListVO vo = null;
		for(int i=0; i<tseqList.length; i++){
			vo = new ListVO();
			vo.setIseq(iseq);
			vo.setLorder(Long.valueOf(i+1));
			vo.setTseq(tseqList[i]);
			list.add(vo);
		}
		
		Map<String, List<ListVO>> map = new HashMap<String, List<ListVO>>();
		map.put("list", list);
		
		int delete = mapper.deleteList(iseq);
		int insert = mapper.insertList(map);
		System.out.println(delete+"개 삭제 성공");
		System.out.println(insert+"개 삽입 성공");
		
		return insert;
	}

	@Override
	public int addItinerary(ItineraryVO vo) {

		return mapper.insertItinerary(vo);
	}

	@Override
	public int removeItinerary(Long iseq) {

		return mapper.deleteItinerary(iseq);
	}

	@Override
	public int addList(ListVO vo) {
		
		return mapper.insertItineraryList(vo);
	}

}

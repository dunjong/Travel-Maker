package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.ReviewDTO;
import com.kosmo.travelmaker.service.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	//ReviewDAO주입]
	@Resource(name="reviewDAO")
	private ReviewDAO dao;

	@Override
	public List<ReviewDTO> selectList(Map map) {		
		return dao.selectList(map);
	}

	@Override
	public int getTotalRecord(Map map) {	
		return dao.getTotalRecord(map);
	}

	@Override
	public ReviewDTO selectOne(Map map) {	
		return dao.selectOne(map);
	}

	@Override
	public int delete(Map map) {		
		return dao.delete(map);
	}
	@Override
	public int insert(Map map) {		
		return dao.insert(map);
	}
	@Override
	public int update(Map map) {		
		return dao.update(map);
	}

}

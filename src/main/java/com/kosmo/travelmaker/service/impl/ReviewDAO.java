package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.ReviewDTO;
import com.kosmo.travelmaker.service.ReviewService;

@Repository("reviewDAO")
public class ReviewDAO implements ReviewService {
	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<ReviewDTO> selectList(Map map) {
		
		return sqlMapper.selectList("reviewlectList",map);
	}

	@Override
	public int getTotalRecord(Map map) {
		
		return sqlMapper.selectOne("reviewGetTotalRecord",map);
	}
	//상세보기]
	@Override
	public ReviewDTO selectOne(Map map) {		
		return sqlMapper.selectOne("reviewSelectOne", map);
	}

	@Override
	public int delete(Map map) {
		return sqlMapper.delete("reviewDelete",map);
	}

	@Override
	public int insert(Map map) {
		return sqlMapper.insert("reviewInsert",map);
	}

	@Override
	public int update(Map map) {
		return sqlMapper.update("reviewUpdate",map);
	}

}

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
		
		return sqlMapper.selectList("reviewSelectList",map);
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

		System.out.println("reviewInsertMap:"+map);
		return sqlMapper.insert("reviewInsert",map);
	}

	@Override
	public int update(Map map) {
		return sqlMapper.update("reviewUpdate",map);
	}

	@Override
	public List<ReviewDTO> selectReviewDTOListByCityNo(int city_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectReviewDTOListByCityNo", city_no);
	}

	@Override
	public int likeSelect(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("likeSelect",maps);
	}

	@Override
	public boolean Likeinsert(Map<String, String> maps) {
		// TODO Auto-generated method stub
		System.out.println("maps:"+maps);
		return sqlMapper.insert("Likeinsert", maps)==1?true:false;
	}

	@Override
	public boolean selectLikeByIdReviewNo(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return Integer.parseInt(sqlMapper.selectOne("selectLikeByIdReviewNo", maps).toString())==0?true:false;
	}

	@Override
	public boolean deleteLike(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteLike", maps)==1?true:false;
	}

	@Override
	public void deleteAllLike(Map map) {
		// TODO Auto-generated method stub
		sqlMapper.delete("deleteAllLike", map);
	}

}

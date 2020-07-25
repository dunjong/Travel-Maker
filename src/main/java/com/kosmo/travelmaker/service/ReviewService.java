package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	//목록용]
	List<ReviewDTO> selectList(Map map);
	//전체 레코드 수]
	int getTotalRecord(Map map);
	//상세보기용]
	ReviewDTO selectOne(Map map);
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	List<ReviewDTO> selectReviewDTOListByCityNo(int city_no);
	int likeSelect(Map<String, String> maps);
	boolean Likeinsert(Map<String, String> maps);
	boolean selectLikeByIdReviewNo(Map<String, String> maps);
	boolean deleteLike(Map<String, String> maps);
}

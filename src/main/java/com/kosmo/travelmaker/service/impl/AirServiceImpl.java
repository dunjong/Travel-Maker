package com.kosmo.travelmaker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.AirDTO;
import com.kosmo.travelmaker.service.AirService;

@Service("airService")
public class AirServiceImpl implements AirService {

	@Resource(name="airDAO")
	AirDAO airDAO;
	
	@Override
	public boolean deleteAirRes(AirDTO dto) {
		//유저아이디로 항공권삭제하는 코드넣을 자리
		return airDAO.deleteAirRes(dto);
	}
	@Override
	public List<AirDTO> selectAirResById(String id) {
		// 아이디로 항공권가져오는 코드
		return airDAO.selectAirResById(id);
	}
	@Override
	public boolean insertAirDtoToAir(int air_no) {
		return airDAO.insertAirDtoToAir(air_no);
	}
	@Override
	public boolean insertAirDtoToRes(AirDTO dto) {
		//예약테이블에 항공권 정보 넣는코드
		return airDAO.insertAirDtoToRes(dto);
	}
	@Override
	public AirDTO selectAirByResNo(int Res_no) {
		// resno로 air가져오는코드
		return airDAO.selectAirByResNo(Res_no);
	}
	@Override
	public int CompareTimePlace(String ddate, String departure, String arrival) {
		// TODO Auto-generated method stub
		return airDAO.CompareTimePlace(ddate,departure,arrival);
	}
	@Override
	public List<AirDTO> selectAirDTOByplannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return airDAO.selectAirDTOByplannerNo(planner_no);
	}
}

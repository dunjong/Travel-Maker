package com.kosmo.travelmaker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.MemberDTO;

@Repository
public class MemberDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("isLogin",map)==0 ? false : true;
	}
	public boolean SignUp(MemberDTO dto) {
		return sqlMapper.insert("signUp",dto)==0 ? false : true;
	}
}

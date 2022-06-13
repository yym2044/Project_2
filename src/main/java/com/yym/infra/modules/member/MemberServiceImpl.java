package com.yym.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yym.infra.common.util.UtilDateTime;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	
	
	@Override
	public List<Member> selectListOracle() throws Exception {
		return dao.selectListOracle();
	}

	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}
	
	@Override
	public Member selectOneLoginSns(Member dto) throws Exception {
		return dao.selectOneLoginSns(dto);
	}
	
	@Override
	public int insertMember(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		dao.insertMember(dto);
		dao.insertMemberPhone(dto);
		dao.insertMemberEmail(dto);
		
		return 1;
	}
	
}

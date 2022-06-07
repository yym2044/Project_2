package com.yym.infra.modules.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}
	
	@Override
	public int insertMember(Member dto) throws Exception {
		
		dao.insertMember(dto);
		dao.insertMemberPhone(dto);
		dao.insertMemberEmail(dto);
		
		return 1;
	}
	
}

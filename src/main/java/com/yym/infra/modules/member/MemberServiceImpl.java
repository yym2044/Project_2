package com.yym.infra.modules.member;

import java.util.List;

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
	public List<Member> selectOneMemberCheckOut(MemberVo vo) throws Exception {
		return dao.selectOneMemberCheckOut(vo);
	}

}

package com.yym.infra.modules.member;

import java.util.List;

public interface MemberService {

	public Member selectOneLogin(Member dto) throws Exception;
	public List<Member> selectOneMemberCheckOut(MemberVo vo) throws Exception;
	
}

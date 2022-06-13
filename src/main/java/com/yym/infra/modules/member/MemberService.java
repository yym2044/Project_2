package com.yym.infra.modules.member;

import java.util.List;

public interface MemberService {

	public Member selectOneLogin(Member dto) throws Exception;
	public Member selectOneLoginSns(Member dto) throws Exception;
	
	public int insertMember(Member dto) throws Exception;
	
	public List<Member> selectListOracle() throws Exception;
	
}

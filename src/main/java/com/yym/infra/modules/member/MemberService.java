package com.yym.infra.modules.member;

public interface MemberService {

	public Member selectOneLogin(Member dto) throws Exception;
	
	public int insertMember(Member dto) throws Exception;
	
}

package com.yym.infra.modules.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.yym.infra.modules.member.MemberMpp";

	public Member selectOneLogin(Member dto) {return sqlSession.selectOne(namespace + ".selectOneLogin", dto); }
	
}

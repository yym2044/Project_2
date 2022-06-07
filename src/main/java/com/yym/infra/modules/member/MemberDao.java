package com.yym.infra.modules.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	@Inject
//	@Resource(name = "sqlSessionOracle")
	private SqlSession sqlSessionOracle;
	
	private static String namespace = "com.yym.infra.modules.member.MemberMpp";

	public Member selectOneLogin(Member dto) {return sqlSession.selectOne(namespace + ".selectOneLogin", dto); }
	public int insertMember(Member dto) {return sqlSession.insert(namespace + ".insertMember", dto); }
	public int insertMemberPhone(Member dto) {return sqlSession.insert(namespace + ".insertMemberPhone", dto); }
	public int insertMemberEmail(Member dto) {return sqlSession.insert(namespace + ".insertMemberEmail", dto); }
}

package com.yym.infra.modules.member;

import java.util.List;

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
	
	public List<Member> selectOneMemberCheckOut(MemberVo vo) {return sqlSession.selectList(namespace + ".selectOneMemberCheckOut", vo); }
}

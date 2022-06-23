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
	
	@Inject
//	@Resource(name = "sqlSessionOracle")
	private SqlSession sqlSessionOracle;
	
	private static String namespace = "com.yym.infra.modules.member.MemberMpp";

	public Member selectOneLogin(Member dto) {return sqlSession.selectOne(namespace + ".selectOneLogin", dto); }
	public Member selectOneLoginSns(Member dto) {return sqlSession.selectOne(namespace + ".selectOneLoginSns", dto); }
	public int insertMemberUser(Member dto) {return sqlSession.insert(namespace + ".insertMemberUser", dto); }
	public int insertMemberPhoneUser(Member dto) {return sqlSession.insert(namespace + ".insertMemberPhoneUser", dto); }
	public int insertMemberEmailUser(Member dto) {return sqlSession.insert(namespace + ".insertMemberEmailUser", dto); }
	
	public List<Member> selectListOracle() {return sqlSessionOracle.selectList(namespace + ".selectListOracle", "");}
	
	//////////////////////////////////////////////////////////////////////////////////
	
	public int selectListCount(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectListCount", vo); }
	public List<Member> selectListAllMember() {return sqlSession.selectList(namespace + ".selectListAllMember", "");}
	
	public List<Member> selectList(MemberVo vo){ 
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public List<Member> selectListSearch() {return sqlSession.selectList(namespace + ".selectListSearch", ""); }
	public List<Member> selectListNation() {return sqlSession.selectList(namespace + ".selectListNation", ""); }
	public List<Member> selectNote(MemberVo vo) {return sqlSession.selectList(namespace + ".selectNote", vo); }
	public List<Member> selectListMemberUploaded(MemberVo vo) {return sqlSession.selectList(namespace + ".selectListMemberUploaded", vo); }
	
//	INSERT
	public int insertMember(Member dto){ return sqlSession.insert(namespace + ".insertMember", dto); }
	public int insertMemberEmail(Member dto) {return sqlSession.insert(namespace + ".insertMemberEmail", dto);}
	public int insertMemberAddress(Member dto) {return sqlSession.insert(namespace + ".insertMemberAddress", dto);}
//	public int insertMemberPhoneMobile(Member dto) {return sqlSession.insert(namespace + ".insertMemberPhoneMobile", dto);}
//	public int insertMemberPhoneHome(Member dto) {return sqlSession.insert(namespace + ".insertMemberPhoneHome", dto);}
	public int insertPhone(Member dto) {return sqlSession.insert(namespace + ".insertPhone", dto);}
	public int insertAddressOnline(Member dto) {return sqlSession.insert(namespace + ".insertAddressOnline", dto); }
	public int insertMemberNationality(Member dto) {return sqlSession.insert(namespace + ".insertMemberNationality", dto);}
	
	public int insertMemberNote(Member dto) {return sqlSession.insert(namespace + ".insertMemberNote", dto);}
	
	public int insertMemberUploaded(Member dto) {return sqlSession.insert(namespace + ".insertMemberUploaded", dto); }
	
//	UPDATE
	public int updateMember(Member dto) {return sqlSession.update(namespace + ".updateMember", dto); }
	public int updateMemberEmail(Member dto) {return sqlSession.update(namespace + ".updateMemberEmail", dto); }
	public int updateMemberAddress(Member dto) {return sqlSession.update(namespace + ".updateMemberAddress", dto); }
	public int updateAddressOnline(Member dto) {return sqlSession.update(namespace + ".updateAddressOnline", dto); }
	public int updateMemberPhone(Member dto) {return sqlSession.update(namespace + ".updateMemberPhone", dto); }
//	public int updateMemberPhoneMobile(Member dto) {return sqlSession.update(namespace + ".updateMemberPhoneMobile", dto); }
//	public int updateMemberPhoneHome(Member dto) {return sqlSession.update(namespace + ".updateMemberPhoneHome", dto); }
	public int updateMemberNationality(Member dto) {return sqlSession.update(namespace + ".updateMemberNationality", dto); }
	
	public Member selectOne(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectOne", vo);}
	public List<Member> selectListPhone(MemberVo vo) {return sqlSession.selectList(namespace + ".selectListPhone", vo);}
	public List<Member> selectListAddressOnline(MemberVo vo) {return sqlSession.selectList(namespace + ".selectListAddressOnline", vo); }
//	public Member selectOnePhoneMobile(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectOnePhoneMobile", vo);}
//	public Member selectOnePhoneHome(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectOnePhoneHome", vo);}
	
//	DELETE
	public int deleteMember(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMember", vo);}
	public int deleteMemberEmail(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMemberEmail", vo);}
	public int deleteMemberAddress(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMemberAddress", vo);}
	public int deleteMemberPhone(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMemberPhone", vo);}
	public int deleteMemberNationality(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMemberNationality", vo);}
	
	public int updateMemberDelNy(MemberVo vo) {return sqlSession.update(namespace + ".updateMemberDelNy", vo); }
	
//  DELETE note and UPDATE ifntOrder
	public int deleteMemberNote(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMemberNote", vo);}
	public int deleteMemberNoteAll(MemberVo vo) {return sqlSession.delete(namespace + ".deleteMemberNoteAll", vo); }
	public int rearrangementNote(MemberVo vo) {return sqlSession.update(namespace + ".rearrangementNote", vo);}
	
}

package com.yym.infra.modules.code;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.yym.infra.modules.code.CodeMpp";

	public int selectOneCount(CodeVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
	public List<Code> selectList(CodeVo vo) {return sqlSession.selectList(namespace + ".selectList", vo);}
	public List<Code> selectListAll() {return sqlSession.selectList(namespace + ".selectListAll", ""); }
	
	public int insert(Code dto) {return sqlSession.insert(namespace + ".insert", dto);}
	
	public Code selectOne(CodeVo vo) {return sqlSession.selectOne(namespace + ".selectOne", vo);}
	public Code selectOne(Code dto) {return sqlSession.selectOne(namespace + ".selectOne", dto);}
	
	public List<Code> selectList2(CodeVo vo) {return sqlSession.selectList(namespace + ".selectList2", vo);}
	
//	public int update(CodeVo vo) {return sqlSession.update(namespace + ".update", vo);}
	public int update(Code dto) {return sqlSession.update(namespace + ".update", dto);}
	
	//진짜 삭제
	public int delete(CodeVo vo) {return sqlSession.delete(namespace + ".delete", vo);}
	//가짜 삭제
	public int updateDelete(CodeVo vo) {return sqlSession.update(namespace + ".updateDelete", vo);}
	
	
//	코드
	public int selectOneCount_code(CodeVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount_code", vo);}
	public List<Code> selectList_code(CodeVo vo) {return sqlSession.selectList(namespace + ".selectList_code", vo);}
	
	public int insert_code(Code dto) {return sqlSession.insert(namespace + ".insert_code", dto);}
	
	public Code selectOne_code(CodeVo vo) {return sqlSession.selectOne(namespace + ".selectOne_code", vo);}
	public Code selectOne_code(Code dto) {return sqlSession.selectOne(namespace + ".selectOne_code", dto);}
	
	public int update_code(Code dto) {return sqlSession.update(namespace + ".update_code", dto);}
	
	public int delete_code(CodeVo vo) {return sqlSession.delete(namespace + ".delete_code", vo);}
	
	public List<Code> selectListForCache() {return sqlSession.selectList(namespace + ".selectListForCache", "");}

}
package com.yym.infra.modules.code;

import java.util.List;

public interface CodeService {
	
	public int selectOneCount(CodeVo vo) throws Exception;
	public List<Code> selectList(CodeVo vo) throws Exception; 
	public List<Code> selectListAll() throws Exception;
	
	public int insert(Code dto) throws Exception;
	public Code selectOne(CodeVo vo) throws Exception;
	
	public Code selectOne(Code dto) throws Exception;
	
	public List<Code> selectList2(CodeVo vo) throws Exception;
//	public int update(CodeVo vo) throws Exception;
	public int update(Code dto) throws Exception;
	
	public int delete(CodeVo vo) throws Exception;
	public int updateDelete(CodeVo vo) throws Exception;
	
//	코드
	public int selectOneCount_code(CodeVo vo) throws Exception;
	public List<Code> selectList_code(CodeVo vo) throws Exception;
	public int insert_code(Code dto) throws Exception;
	
	public Code selectOne_code(CodeVo vo) throws Exception;
	public Code selectOne_code(Code dto) throws Exception;
	
	public int update_code(Code dto) throws Exception;
	public int delete_code(CodeVo vo) throws Exception;
}
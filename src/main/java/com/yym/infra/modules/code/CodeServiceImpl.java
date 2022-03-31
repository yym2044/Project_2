package com.yym.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao dao;

	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public List<Code> selectListAll() throws Exception {
		return dao.selectListAll();
	}

	@Override
	public int insert(Code dto) throws Exception {
		
		dao.insert(dto);
//		dao.insert_code(dto);
		
		return 1;
	}

	@Override
	public Code selectOne(CodeVo vo) throws Exception {
		
		return dao.selectOne(vo);
	}
	
	@Override
	public Code selectOne(Code dto) throws Exception {
		
		return dao.selectOne(dto);
	}

	@Override
	public List<Code> selectList2(CodeVo vo) throws Exception {
		
		return dao.selectList2(vo);
	}

//	@Override
//	public int update(CodeVo vo) throws Exception {
//		return dao.update(vo);
//	}
	
	@Override
	public int update(Code dto) throws Exception {
		return dao.update(dto);
	}
	
	@Override
	public int delete(CodeVo vo) throws Exception {
		return dao.delete(vo);
	}
	
	@Override
	public int updateDelete(CodeVo vo) throws Exception {
		return dao.updateDelete(vo);
	}

//	코드
	
	@Override
	public int selectOneCount_code(CodeVo vo) throws Exception {
		return dao.selectOneCount_code(vo);
	}
	
	@Override
	public List<Code> selectList_code(CodeVo vo) throws Exception {
		
		return dao.selectList_code(vo);
	}

	@Override
	public int insert_code(Code dto) throws Exception {
		return dao.insert_code(dto);
	}

	@Override
	public Code selectOne_code(CodeVo vo) throws Exception {
		return dao.selectOne_code(vo);
	}
	
	@Override
	public Code selectOne_code(Code dto) throws Exception {
		return dao.selectOne_code(dto);
	}
	
	@Override
	public int update_code(Code dto) throws Exception {
		return dao.update_code(dto);
	}

	@Override
	public int delete_code(CodeVo vo) throws Exception {
		return dao.delete_code(vo);
	}
	
	@PostConstruct
	public void selectListForCache(){
		
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListForCache();
		
		Code.cachedCodeArrayList.clear();
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " catched !!");
		
	}
	
	public static List<Code> selectListCachedCode(String ifcgSeq) throws Exception {
		List<Code> rt = new ArrayList<Code>();
		for(Code codeRow : Code.cachedCodeArrayList) {
			if(codeRow.getIfcgSeq().equals(ifcgSeq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	public static Code selectOneCachedCode(String ifcdSeq) throws Exception {
		Code rt = new Code();
		for(Code codeRow : Code.cachedCodeArrayList) {
			if(codeRow.getIfcdSeq().equals(ifcdSeq)) {
				rt = codeRow;
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	public static void clear() throws Exception {
		Code.cachedCodeArrayList.clear();
	}
	
}
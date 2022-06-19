package com.yym.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yym.infra.common.util.UtilDateTime;
import com.yym.infra.common.util.UtilUpload;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	
	
	@Override
	public List<Member> selectListOracle() throws Exception {
		return dao.selectListOracle();
	}

	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}
	
	@Override
	public Member selectOneLoginSns(Member dto) throws Exception {
		return dao.selectOneLoginSns(dto);
	}
	
	@Override
	public int insertMemberUser(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		dao.insertMemberUser(dto);
		dao.insertMemberPhoneUser(dto);
		dao.insertMemberEmailUser(dto);
		
		return 1;
	}
	
	///////////////////////////////////////////////////////////////////////////////
	
	@Override
	public int selectListCount(MemberVo vo) throws Exception {
		return dao.selectListCount(vo);
	}
	
	@Override
	public List<Member> selectListAllMember() throws Exception {
		return dao.selectListAllMember();
	}
	
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo); 
	}
	
	@Override
	public List<Member> selectListSearch() throws Exception {
		return dao.selectListSearch();
	}
	
	@Override
	public List<Member> selectListNation() throws Exception {
		return dao.selectListNation();
	}
	
	@Override
	public List<Member> selectNote(MemberVo vo) throws Exception {
		return dao.selectNote(vo);
	}
	
	@Override
	public int insertMember(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		
		
		
		
		dao.insertMember(dto);
		dao.insertMemberAddress(dto);
		dao.insertMemberEmail(dto);
		
		
		// infrMemberPhone
		for(int i=0; i<dto.getIfmpNumberArray().length; i++) {
			dto.setIfmpDefaultNy(dto.getIfmpDefaultNyArray()[i]);
			dto.setIfmpTypeCd(dto.getIfmpTypeCdArray()[i]);
			dto.setIfmpDeviceCd(dto.getIfmpDeviceCdArray()[i]);
			dto.setIfmpTelecomCd(dto.getIfmpTelecomCdArray()[i]);
			dto.setIfmpNumber(dto.getIfmpNumberArray()[i]);
			
			dao.insertPhone(dto);
		}
		
		System.out.println(dto.getIfaoUrlArray1().length);	//1
		System.out.println(dto.getIfaoUrlArray2().length);	//1 들어오는데 뭐지
		
		dao.insertMemberNationality(dto);
		
		
		//추가 start
		
		//이미지
		int j = 0;
		for(MultipartFile multipartFile : dto.getFile0() ) {
			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
			
			UtilUpload.uploadMember(multipartFile, pathModule, dto);
			
			dto.setTableName("infrMemberUploaded");
			dto.setType(0);
			dto.setDefaultNy(0);
			dto.setSort(j);
			dto.setPseq(dto.getIfmmSeq());
			
			
			
			dao.insertMemberUploaded(dto);
			j++;
		}
		
		//파일
		j = 0;
		for(MultipartFile multipartFile : dto.getFile1() ) {
			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
			
			UtilUpload.uploadMember(multipartFile, pathModule, dto);
			
			dto.setTableName("infrMemberUploaded");
			dto.setType(1);
			dto.setDefaultNy(0);
			dto.setSort(j);
			dto.setPseq(dto.getIfmmSeq());
			
			dao.insertMemberUploaded(dto);
			j++;
		}
		
		
		
		//추가 end
		
		
		return 1;
	}
	
	@Override
	public int insertMemberNote(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		return dao.insertMemberNote(dto);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public List<Member> selectListPhone(MemberVo vo) throws Exception {
		return dao.selectListPhone(vo);
	}
	
	@Override
	public List<Member> selectListAddressOnline(MemberVo vo) throws Exception {
		return dao.selectListAddressOnline(vo);
	}
//	@Override
//	public Member selectOnePhoneMobile(MemberVo vo) throws Exception {
//		return dao.selectOnePhoneMobile(vo);
//	}
//	
//	@Override
//	public Member selectOnePhoneHome(MemberVo vo) throws Exception {
//		return dao.selectOnePhoneHome(vo);
//	}
	
	@Override
	public List<Member> selectListMemberUploaded(MemberVo vo) throws Exception {
		return dao.selectListMemberUploaded(vo);
	}

	@Override
	public int updateMember(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		dao.updateMember(dto);
		dao.updateMemberAddress(dto);
		dao.updateMemberEmail(dto);
		dao.updateMemberNationality(dto);
		
		for(int i=0; i<dto.getIfmpNumberArray().length; i++) {
			dto.setIfmpDefaultNy(dto.getIfmpDefaultNyArray()[i]);
			dto.setIfmpTypeCd(dto.getIfmpTypeCdArray()[i]);
			dto.setIfmpDeviceCd(dto.getIfmpDeviceCdArray()[i]);
			dto.setIfmpTelecomCd(dto.getIfmpTelecomCdArray()[i]);
			dto.setIfmpNumber(dto.getIfmpNumberArray()[i]);
			
			dao.updateMemberPhone(dto);
		}
		
		
		return 1;
	}


	@Override
	public int deleteMember(MemberVo vo) throws Exception {
		
		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
			
			dao.deleteMemberAddress(vo);
			dao.deleteMemberEmail(vo);
			dao.deleteMemberPhone(vo);
			dao.deleteMemberNationality(vo);
			dao.deleteMember(vo);
			
		}
		
		
		return 1;
	}

	@Override
	public int updateMemberDelNy(MemberVo vo) throws Exception {
		
		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
			dao.updateMemberDelNy(vo);
		}
		
		return 1;
	}

	@Override
	public int deleteMemberNote(MemberVo vo) throws Exception {
		
		String[] checkboxNoteArray = vo.getCheckboxNoteArray();
		
		for(String checkboxNote : checkboxNoteArray) {
			vo.setIfntOrder(checkboxNote);
			dao.deleteMemberNote(vo);
		}
		
		dao.rearrangementNote(vo);
		
		return 1;
	}
	
}

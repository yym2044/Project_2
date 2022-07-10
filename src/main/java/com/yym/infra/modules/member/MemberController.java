package com.yym.infra.modules.member;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.yym.infra.common.constants.Constants;
import com.yym.infra.common.util.UtilDateTime;
import com.yym.infra.modules.code.CodeServiceImpl;
import com.yym.infra.modules.naver.NaverLoginBo;

@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	
	private NaverLoginBo naverLoginBo;
	
	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo){
		this.naverLoginBo = naverLoginBo;
	}
	
	@RequestMapping("/member/loginNaver")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		OAuth2AccessToken oauthToken = naverLoginBo.getAccessToken(session, code, state);
		
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginBo.getUserProfile(oauthToken);
//      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        session.setAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        
        session.setAttribute("sessSeq", 0); //생략 가능
		
		return "redirect:/index/indexView"; //사용자설정
	}


	
	@RequestMapping(value = "/member/memberListOracle")
	public String memberListOracle(Model model) throws Exception {
		
		model.addAttribute("listOracle", service.selectListOracle());
		
		return "/member/memberListOracle";
	}
	
	@RequestMapping(value = "/member/insertMemberUser")
	public String insertMemberUser(Member dto) throws Exception {
		
		service.insertMemberUser(dto);
		
		return "redirect:/home";
	}
	
	@RequestMapping("/login/loginForm")
    public ModelAndView login(HttpSession session) {
        /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("/login/loginForm", "url", naverAuthUrl);
    }


//	@RequestMapping(value = "/login/loginForm")
//	public String loginForm() {
//		
//		return "/login/loginForm";
//	}
	
	@RequestMapping(value = "/login/loginFindId")
	public String loginFindId() {
		
		return "/login/loginFindId";
	}
	@RequestMapping(value = "/login/loginFindPwd")
	public String loginFindPwd() {
		
		return "/login/loginFindPwd";
	}
	@RequestMapping(value = "/login/regForm1")
	public String regForm1() {
		
		return "/login/regForm1";
	}
	@RequestMapping(value = "/login/regForm2")
	public String regForm2(@ModelAttribute ("dto") Member dto) throws Exception {
		
		return "/login/regForm2";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/member/loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();

		Member rtMember = service.selectOneLogin(dto);

		if (rtMember != null) {

			httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
			httpSession.setAttribute("sessId", rtMember.getIfmmId());
			httpSession.setAttribute("sessName", rtMember.getIfmmName());
			httpSession.setAttribute("sessAdminNy", rtMember.getIfmmAdminNy());
			httpSession.setAttribute("path", rtMember.getPath());
			httpSession.setAttribute("uuidFileName", rtMember.getUuidName());

			returnMap.put("rt", "success");

		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/loginProcSns")
	public Map<String, Object> loginProcSns(Member dto, HttpSession httpSession) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLoginSns(dto);

		if(rtMember != null) {
			
			httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
			httpSession.setAttribute("sessId", rtMember.getIfmmId());
			httpSession.setAttribute("sessName", rtMember.getIfmmName());
			httpSession.setAttribute("sessAdminNy", rtMember.getIfmmAdminNy());
			httpSession.setAttribute("path", rtMember.getPath());
			httpSession.setAttribute("uuidFileName", rtMember.getUuidName());
			
			returnMap.put("rt", "success");
			
		} else {
			returnMap.put("rt", "fail");
		}
		
		
		return returnMap;
	}

	@ResponseBody
	@RequestMapping(value = "/member/logOutProc")
	public Map<String, Object> logOutProc(HttpSession httpSession) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		httpSession.invalidate();
		returnMap.put("rt", "success");

		return returnMap;
	}

	
	/////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/member/excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		String[] arr = vo.getCheckboxExcelArray();
		
		for(String a : arr) {
			System.out.println("---");
			System.out.println(a);
			System.out.println("---");
		}
		
//		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
//		
//		vo.setShPeriod(vo.getShPeriod() == null ? 0 : vo.getShPeriod());
//		
//		if(vo.getShPeriod() == 0) {
//			vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL, 1) : vo.getShDateStart());
//			vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : vo.getShDateEnd());
//		} else if(vo.getShPeriod() == 1) {
//			vo.setShDateStart(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL, 1));
//			vo.setShDateEnd(UtilDateTime.nowString());
//		} else if(vo.getShPeriod() == 2) {
//			vo.setShDateStart(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), -1, 2));
//			vo.setShDateEnd(UtilDateTime.nowString());
//		} else if(vo.getShPeriod() == 3) {
//			vo.setShDateStart(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), -1, 3));
//			vo.setShDateEnd(UtilDateTime.nowString());
//		}
		
		int count = service.selectListCount(vo);
		
		String count2 = String.valueOf(count);
		
		vo.setParamsPaging(count); 
		
		
		if(count != 0) {
			
			List<Member> list = service.selectList(vo);
			
			Workbook wb = new XSSFWorkbook();
			Sheet sheet = wb.createSheet("첫번째 시트");
			Row row = null;
			Cell cell = null;
			int rowNum = 0;
			
			// Header
			row = sheet.createRow(rowNum++);
			
			int col = 1;
			
			cell = row.createCell(0);
			cell.setCellValue("번호");
			if(Arrays.asList(arr).contains("1")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("아이디");
			}
			if(Arrays.asList(arr).contains("2")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("이름");
			}
			if(Arrays.asList(arr).contains("3")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("등급");
			}
			if(Arrays.asList(arr).contains("4")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("성별");
			}
			if(Arrays.asList(arr).contains("5")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("주소");
			}
			if(Arrays.asList(arr).contains("6")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("생년월일");
			}
			if(Arrays.asList(arr).contains("7")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("이메일");
			}
			if(Arrays.asList(arr).contains("8")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("메일수신동의");
			}
			if(Arrays.asList(arr).contains("9")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("휴대전화");
			}
			if(Arrays.asList(arr).contains("10")) {
				cell = row.createCell(col);
				col++;
				cell.setCellValue("SMS수신동의");
			}
			
			// Body
			
			
			for (int i=0; i<list.size(); i++) {
				
				col = 1;
				
				row = sheet.createRow(rowNum++);
				
				cell = row.createCell(0);
				cell.setCellValue(String.valueOf(list.get(i).getIfmmSeq()));
				
				if(Arrays.asList(arr).contains("1")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmmId());
					col++;
				}
				if(Arrays.asList(arr).contains("2")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmmName());
					col++;
				}
				if(Arrays.asList(arr).contains("3")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmmGrade());
					col++;
				}
				if(Arrays.asList(arr).contains("4")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmmGender());
					col++;
				}
				if(Arrays.asList(arr).contains("5")) {
					cell = row.createCell(col);
					
					if(list.get(i).getIfmaAddress1() == null) {
						cell.setCellValue("X");
					} else {
						cell.setCellValue(list.get(i).getIfmaAddress1() + " " + list.get(i).getIfmaAddress2());
					}
					col++;
				}
				if(Arrays.asList(arr).contains("6")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmmDob());
					col++;
				}
				if(Arrays.asList(arr).contains("7")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmeEmailFull());
					col++;
				}
				if(Arrays.asList(arr).contains("8")) {
					cell = row.createCell(col);
					if(list.get(i).getIfmmEmailConsentNy() == 1) {
						cell.setCellValue("동의");
					} else {
						cell.setCellValue("비동의");
					}
					col++;
				}
				if(Arrays.asList(arr).contains("9")) {
					cell = row.createCell(col);
					cell.setCellValue(list.get(i).getIfmpNumber());
					col++;
				}
				if(Arrays.asList(arr).contains("10")) {
					cell = row.createCell(col);
					if(list.get(i).getIfmmSmsConsentNy() == 1) {
						cell.setCellValue("동의");
					} else {
						cell.setCellValue("비동의");
					}
					col++;
				}
			}
			
			// 컨텐츠 타입과 파일명 지정
			httpServletResponse.setContentType("ms-vnd/excel");
			
			String fileName = new String(vo.getExcelFileName().getBytes("UTF-8"), "ISO-8859-1");
			
			// response.setHeader("Content-Disposition", "attachment;filename=example.xls");
			httpServletResponse.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
			
			// Excel File Output
			wb.write(httpServletResponse.getOutputStream());
			wb.close();
			
			
			
		}

		}
    
	
	
	@RequestMapping(value = "/member/memberList")
//	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
	public String memberList(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		
		System.out.println("UtilDateTime.nowLocalDateTime() : " + UtilDateTime.nowLocalDateTime());
		System.out.println("UtilDateTime.nowDate : " + UtilDateTime.nowDate());
		System.out.println("UtilDateTime.nowString() : " + UtilDateTime.nowString());

//		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
//		
//		vo.setShPeriod(vo.getShPeriod() == null ? 0 : vo.getShPeriod());
//		
//		if(vo.getShPeriod() == 0) {
//			vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL, 1) : vo.getShDateStart());
//			vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : vo.getShDateEnd());
//		} else if(vo.getShPeriod() == 1) {
//			vo.setShDateStart(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL, 1));
//			vo.setShDateEnd(UtilDateTime.nowString());
//		} else if(vo.getShPeriod() == 2) {
//			vo.setShDateStart(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), -1, 2));
//			vo.setShDateEnd(UtilDateTime.nowString());
//		} else if(vo.getShPeriod() == 3) {
//			vo.setShDateStart(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), -1, 3));
//			vo.setShDateEnd(UtilDateTime.nowString());
//		}
		
		int count = service.selectListCount(vo);
		
		String count2 = String.valueOf(count);
		
		vo.setParamsPaging(count); 
		
		
		if(count != 0) {
			
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
			
//		model.addAttribute("list", service.selectList());  위 두줄 대신 이렇게도 가능
			
			
			model.addAttribute("count2", count2);
			
		}
		
		List<Member> listSearch = service.selectListSearch();
		model.addAttribute("listSearch", listSearch);
		
		return "member/memberList";
	}
	
	

	@RequestMapping(value = "/member/memberView")
	public String memberView(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {


		Member rt = service.selectOne(vo);
//		Member rt1 = service.selectOnePhoneMobile(vo);
//		Member rt2 = service.selectOnePhoneHome(vo);
				
		model.addAttribute("rt", rt);
//		model.addAttribute("rt1", rt1);
//		model.addAttribute("rt2", rt2);
		
		//회원이 갖는 파생 데이터들
		model.addAttribute("listAddressOnline", service.selectListAddressOnline(vo));
		model.addAttribute("listPhone", service.selectListPhone(vo));
		model.addAttribute("noteList", service.selectNote(vo));
		model.addAttribute("listUploaded", service.selectListMemberUploaded(vo));
		

		return "member/memberView";
	}
	
	@RequestMapping(value = "/member/memberForm")
	public String memberForm(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		
		//멤버수 가져오기 -> ${fn:length(list2)+1}로 다음 ifmmSeq값을 얻음
//		List<Member> list2 = service.selectList(vo);
//		model.addAttribute("list2", list2);
		
		//멤버수 가져오기 (selectListAllMember) -> ${fn:length(list2)+1}로 다음 ifmmSeq값을 얻음
//		List<Member> list2 = service.selectListAllMember();
//		model.addAttribute("list2", list2);
		
		//코드값 가져오기
		model.addAttribute("codeTelecom", CodeServiceImpl.selectListCachedCode("9"));
		model.addAttribute("codeMemberGrade", CodeServiceImpl.selectListCachedCode("20"));
		model.addAttribute("codeEmailDomain", CodeServiceImpl.selectListCachedCode("6"));
		
		//국적 리스트
		model.addAttribute("listNation", service.selectListNation());
		
		return "member/memberForm";
	}
	
//	@RequestMapping(value = "/member/memberInst")
//	public String memberInst(MemberVo vo, Member dto) throws Exception {
//
//		// 입력을 작동시킨다.
//		service.insertMember(dto);
//		
//		/* return "redirect:/member/memberList"; */
//		return "redirect:/member/memberView?ifmmSeq=" + dto.getIfmmSeq();
//	}
	@RequestMapping(value = "/member/memberInst")
	public String memberInst(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		// 입력을 작동시킨다.
		service.insertMember(dto);
		 
//		redirectAttributes.addAttribute("ifmmSeq", dto.getIfmmSeq());
//		redirectAttributes.addAttribute("shIfmmGrade", vo.getShIfmmGrade());
//		redirectAttributes.addAttribute("shIfmmEmailConsentNy", vo.getShIfmmEmailConsentNy());
//		redirectAttributes.addAttribute("shIfmmSmsConsentNy", vo.getShIfmmSmsConsentNy());
//		redirectAttributes.addAttribute("shIfmmPushConsentNy", vo.getShIfmmPushConsentNy());
//		redirectAttributes.addAttribute("shIfscSeq", vo.getShIfscSeq());
//		redirectAttributes.addAttribute("searchBar", vo.getSearchBar());
//		redirectAttributes.addAttribute("thisPage", vo.getThisPage());
//		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());
//		redirectAttributes.addAttribute("sort", vo.getSort());
//		redirectAttributes.addAttribute("orderby", vo.getOrderby());
		
		System.out.println(vo.getIfmmSeq());	// null값 나옴..
		vo.setIfmmSeq(dto.getIfmmSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberView";
	}
	
	@RequestMapping(value = "/member/memberNoteInst")
	public String memberNoteInst(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		service.insertMemberNote(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberView";
	}
	
	@RequestMapping(value = "/member/memberEditForm")
	public String memberEditForm(Model model,@ModelAttribute("vo") MemberVo vo) throws Exception {
		
		Member rt = service.selectOne(vo);
				
		model.addAttribute("rt", rt);
		
		//코드값 가져오기
		model.addAttribute("codeMemberGrade", CodeServiceImpl.selectListCachedCode("20"));
		model.addAttribute("codeTelecom", CodeServiceImpl.selectListCachedCode("9"));
		model.addAttribute("codeEmailDomain", CodeServiceImpl.selectListCachedCode("6"));
		
		//국적 리스트
		model.addAttribute("listNation", service.selectListNation());
		//회원이 갖는 파생 데이터들
		model.addAttribute("listPhone", service.selectListPhone(vo));
		model.addAttribute("listAddressOnline", service.selectListAddressOnline(vo));
		return "member/memberEditForm";
	}
	
//	@RequestMapping(value = "/member/memberUpdt")
//	public String memberUpdt(Model model, Member dto) throws Exception {
//
//		// 업데이트 하는 구문
//		service.updateMember(dto);
//
//		return "redirect:/member/memberView?ifmmSeq=" + dto.getIfmmSeq();
//
//	}
	@RequestMapping(value = "/member/memberUpdt")
	public String memberUpdt(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		// 업데이트 하는 구문
		service.updateMember(dto);
		
//		redirectAttributes.addAttribute("ifmmSeq", dto.getIfmmSeq());
//		redirectAttributes.addAttribute("shIfmmGrade", vo.getShIfmmGrade());
//		redirectAttributes.addAttribute("shIfmmEmailConsentNy", vo.getShIfmmEmailConsentNy());
//		redirectAttributes.addAttribute("shIfmmSmsConsentNy", vo.getShIfmmSmsConsentNy());
//		redirectAttributes.addAttribute("shIfmmPushConsentNy", vo.getShIfmmPushConsentNy());
//		redirectAttributes.addAttribute("shIfscSeq", vo.getShIfscSeq());
//		redirectAttributes.addAttribute("searchBar", vo.getSearchBar());
//		redirectAttributes.addAttribute("thisPage", vo.getThisPage());
//		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());
//		redirectAttributes.addAttribute("sort", vo.getSort());
//		redirectAttributes.addAttribute("orderby", vo.getOrderby());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberView";
		
	}
	
	@RequestMapping(value = "/member/memberDele")
	public String memberDele(Model model, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.deleteMember(vo);
		
		
//		redirectAttributes.addAttribute("shIfmmGrade", vo.getShIfmmGrade());
//		redirectAttributes.addAttribute("shIfmmEmailConsentNy", vo.getShIfmmEmailConsentNy());
//		redirectAttributes.addAttribute("shIfmmSmsConsentNy", vo.getShIfmmSmsConsentNy());
//		redirectAttributes.addAttribute("shIfmmPushConsentNy", vo.getShIfmmPushConsentNy());
//		redirectAttributes.addAttribute("shIfscSeq", vo.getShIfscSeq());
//		redirectAttributes.addAttribute("searchBar", vo.getSearchBar());
//		redirectAttributes.addAttribute("thisPage", vo.getThisPage());
//		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());
//		redirectAttributes.addAttribute("sort", vo.getSort());
//		redirectAttributes.addAttribute("orderby", vo.getOrderby());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
		
	}
	
	@RequestMapping(value = "/member/updateDelNy")
	public String updateDelNy(Model model, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.updateMemberDelNy(vo);
		
		
//		redirectAttributes.addFlashAttribute("shIfmmGrade", vo.getShIfmmGrade());
//		redirectAttributes.addFlashAttribute("shIfmmEmailConsentNy", vo.getShIfmmEmailConsentNy());
//		redirectAttributes.addFlashAttribute("shIfmmSmsConsentNy", vo.getShIfmmSmsConsentNy());
//		redirectAttributes.addFlashAttribute("shIfmmPushConsentNy", vo.getShIfmmPushConsentNy());
//		redirectAttributes.addFlashAttribute("shIfscSeq", vo.getShIfscSeq());
//		redirectAttributes.addFlashAttribute("searchBar", vo.getSearchBar());
//		redirectAttributes.addFlashAttribute("thisPage", vo.getThisPage());
//		redirectAttributes.addFlashAttribute("rowNumToShow", vo.getRowNumToShow());
//		redirectAttributes.addFlashAttribute("sort", vo.getSort());
//		redirectAttributes.addFlashAttribute("orderby", vo.getOrderby());
		
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberList";

	}
	
	@RequestMapping(value = "/member/memberNoteDele")
	public String memberNoteDele(Model model, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		// 업데이트 하는 구문
		service.deleteMemberNote(vo);
		
//		redirectAttributes.addFlashAttribute("shIfmmGrade", vo.getShIfmmGrade());
//		redirectAttributes.addFlashAttribute("shIfmmEmailConsentNy", vo.getShIfmmEmailConsentNy());
//		redirectAttributes.addFlashAttribute("shIfmmSmsConsentNy", vo.getShIfmmSmsConsentNy());
//		redirectAttributes.addFlashAttribute("shIfmmPushConsentNy", vo.getShIfmmPushConsentNy());
//		redirectAttributes.addFlashAttribute("shIfscSeq", vo.getShIfscSeq());
//		redirectAttributes.addFlashAttribute("searchBar", vo.getSearchBar());
//		redirectAttributes.addFlashAttribute("thisPage", vo.getThisPage());
//		redirectAttributes.addFlashAttribute("rowNumToShow", vo.getRowNumToShow());
//		redirectAttributes.addFlashAttribute("sort", vo.getSort());
//		redirectAttributes.addFlashAttribute("orderby", vo.getOrderby());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberView";
		
	}
	
}

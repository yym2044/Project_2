package com.yym.infra.modules.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/member/memberListOracle")
	public String memberListOracle(Model model) throws Exception {
		
		model.addAttribute("listOracle", service.selectListOracle());
		
		return "/member/memberListOracle";
	}
	
	@RequestMapping(value = "/member/insertMember")
	public String insertMember(Member dto) throws Exception {
		
		service.insertMember(dto);
		
		return "redirect:/home";
	}
	

	@RequestMapping(value = "/login/loginForm")
	public String loginForm() {
		
		return "/login/loginForm";
	}
	
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

	
}

package com.culture.admin.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.admin.login.service.AdminLoginService;
import com.culture.admin.login.vo.AdminLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@Slf4j
public class AdminLoginController {

	@Setter(onMethod_ = @Autowired)
	public AdminLoginService adminLoginService;
	
	@GetMapping("/login/adminLogin")
	public String login() {
		return "/admin/login/adminLogin";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public String loginForm(AdminLoginVO alvo, String model) {
		log.info("정상 or 탈퇴 or 틀렸는지 가려보자고");
		AdminLoginVO adminLogin = adminLoginService.adminLogin(alvo);	//로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login 
		log.info("확인" +adminLogin);
		
		if(adminLogin != null) {
			model = "1";
		} else {
			model = "2";
		}	
		return model;
	}
	
	@PostMapping("/loginProcess") 
	public String loginProcess(AdminLoginVO alvo, Model model, RedirectAttributes ras) {
		log.info("관리자 로그인 세션 담기");
		AdminLoginVO adminLogin = adminLoginService.adminLogin(alvo);
		log.info("adminLogin 세션 확인 " + adminLogin);
		String url;
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			log.info("관리자 로그인 성공");
			url = "redirect:/admin/main";
		} else {
			log.info("로그인 실패");
			url = "/admin/login/adminLogin";
		}
		return url;
	}
	
	@RequestMapping("/logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("관리자 로그아웃 처리");
	      sessionStatus.setComplete();
	      return "redirect:/";
	   }

	@GetMapping("/main")
	public String main() {
		return "/admin/main/main";
	}
}

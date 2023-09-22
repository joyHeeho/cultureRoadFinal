package com.culture.admin.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.admin.login.service.AdminLoginService;
import com.culture.admin.login.vo.AdminLoginVO;
import com.culture.common.vo.PageDTO;
<<<<<<< HEAD
import com.culture.user.board.vo.MovieBoardVO;
=======
>>>>>>> refs/remotes/origin/feature/login
import com.culture.user.login.service.UserLoginService;
import com.culture.user.login.vo.UserLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@Slf4j
public class AdminLoginController {

<<<<<<< HEAD
	@Setter(onMethod_ = @Autowired)
	public AdminLoginService adminLoginService;
	
	@Setter(onMethod_ = @Autowired) 
	public UserLoginService userLoginService;
	
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
	
	@RequestMapping("logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("관리자 로그아웃 처리");
	      sessionStatus.setComplete();
	      return "redirect:/";                             
	   }
=======
   @Setter(onMethod_ = @Autowired)
   public AdminLoginService adminLoginService;
   
   @Setter(onMethod_ = @Autowired)
   public UserLoginService userLoginService;
   
   @GetMapping("/login/adminLogin")
   public String login() {
      return "/admin/login/adminLogin";
   }
   
   @ResponseBody
   @PostMapping("/login")
   public String loginForm(AdminLoginVO alvo, String model) {
      log.info("정상 or 탈퇴 or 틀렸는지 가려보자고");
      AdminLoginVO adminLogin = adminLoginService.adminLogin(alvo);   //로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login 
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
   
   @RequestMapping("logout")
      public String logout(SessionStatus sessionStatus) {
         log.info("관리자 로그아웃 처리");
         sessionStatus.setComplete();
         return "redirect:/";                             
      }
>>>>>>> refs/remotes/origin/feature/login

<<<<<<< HEAD
	@GetMapping("/main")
	public String main(Model model) {
		int userCnt = adminLoginService.userCount();
		int replyCnt = adminLoginService.replyCount();
		int commentCnt = adminLoginService.commentCount();
		int mvBoardCount = adminLoginService.mvboardCount();
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("replyCnt", replyCnt);
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("mvBoardCount", mvBoardCount);
		return "/admin/main/adminDashboard";
	}

	@GetMapping("/user/manageUsers")
	public String userList(@ModelAttribute UserLoginVO uvo, Model model) {
		log.info("사용자 관리 성공하고싶슴다,,,");
		List<UserLoginVO> userList = userLoginService.userList(uvo);
		model.addAttribute("userList", userList);
		log.info("userList 받아와라 얼른 " + userList.toString());
		int total = userLoginService.userCnt(uvo);
		
		model.addAttribute("paging", new PageDTO(uvo, total));
		log.info("영화 자유게시판 호출" + total);
		return "/admin/main/manageUsers";
		
	}

	@PostMapping("/user/userStatusUpdate")
	public String mvBoardHidden(@ModelAttribute UserLoginVO	 uvo, @RequestParam("pageNum") int pageNum) {
		log.info("유저상태 업데이트 되나요?");
		int result = userLoginService.userStatusUpdate(uvo);
		log.info("유저상태 업데이트 결과 내놔ㅏㅏㅏㅏㅏ "+result);
		return "redirect:/admin/user/manageUsers?pageNum="+ pageNum +"&amount=10";
	}
	

	@PostMapping("/user/manageUsers")
	public String managerUsers() {
		return "/admin/main/manageUsers";
	}
	
}
=======
   @GetMapping("/main")
   public String main(Model model) {
      int userCnt = adminLoginService.userCount();
      int replyCnt = adminLoginService.replyCount();
      int commentCnt = adminLoginService.commentCount();
      int mvBoardCount = adminLoginService.mvboardCount();
      model.addAttribute("userCnt", userCnt);
      model.addAttribute("replyCnt", replyCnt);
      model.addAttribute("commentCnt", commentCnt);
      model.addAttribute("mvBoardCount", mvBoardCount);
      return "/admin/main/adminDashboard";
   }
   
	/*
	 * @GetMapping("/user/userList") public String userList(@ModelAttribute
	 * UserLoginVO uvo, Model model) { log.info("여기는 오는지 궁금한데 봐줄래?");
	 * List<UserLoginVO> userInfo = userLoginService.userList(uvo);
	 * log.info("userInfo 제발 담겼는지 알려줘,, 제발,,," + userInfo); if(userInfo != null) {
	 * model.addAttribute("userInfo", userInfo); } return "/admin/user/userList"; }
	 */
	


	@GetMapping("/user/userList") 
	public String userInfo(@ModelAttribute UserLoginVO uvo, Model model) { 
		log.info("제발 되어주세요,,,,");
		
		List<UserLoginVO> userInfo = userLoginService.userInfo(uvo);
		log.info("된다구요,,?");
		model.addAttribute("userInfo", userInfo); 
		// 총 레코드 수 확인;
		log.info("된다구요,,?");
		int total = userLoginService.userCnt(uvo);
		// 페이징처리
		model.addAttribute("paging", new PageDTO(uvo, total));
		log.info("된다구요,,,,?");
		return "/admin/user/userList"; 
		}

}
>>>>>>> refs/remotes/origin/feature/login

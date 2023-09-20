package com.culture.qna.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.qna.service.QnaService;
import com.culture.qna.vo.QnaVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;


@Controller
@RequestMapping("/qna/*")
public class QnaAdminController {
	@Setter(onMethod_ = @Autowired)
	public QnaService qnaService;
	
	//글 목록 구현하기(페이징 처리 목록 조회)
	@GetMapping("/qnaAdmin")
	public String qnaList(@ModelAttribute QnaVO qvo,Model model) {
		
		//전체 레코드 조회
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		
		model.addAttribute("qnaList", qnaList);
		
		//전체 레코드 수 반환
		int total = qnaService.qnaListCnt(qvo);
		
		//페이징 처리
		model.addAttribute("pageMaker",new PageDTO(qvo, total));
		//new PageDTO(CommonVO 또는 CommonVO 하위 클래스의 인스턴스(BoardVO), 총레코드수)
		
		return "qna/qnaAdmin";
	}/**********************조회******************************/
		
	
	
	@PostMapping("/deleteQna")
	public String deleteQna(@RequestParam("qna_id") int qna_id) {
	    int result = 0;
	    String url = "";
		result = qnaService.deleteQna(qna_id);
	    
	    if (result == 1) {
	        url = "/qna/qnaAdmin";
	    } else {
	        url = "error";
	    }
	    
	    return "redirect:" + url;
	}
	/**********************삭제******************************/
	
	

	
	@GetMapping("/answerForm")
	public String answerForm(@RequestParam("qna_id") int qna_id, Model model) {
	    QnaVO qvo = qnaService.getQnaById(qna_id); // qna_id를 사용하여 해당 질문 정보를 조회합니다.
	    model.addAttribute("qvo", qvo);
	    return "qna/answer";
	}
	
	
	
	@PostMapping("/updateAnswer")
	public String updateAnswer(QnaVO qvo, Model model) throws Exception {
	    qnaService.updateAnswer(qvo);
	    
	    return "redirect:/qna/qnaAdmin";
	}
	
	
	/**************************답변/답변폼*******************************/
}

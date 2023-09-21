package com.culture.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.culture.user.board.service.MovieReplyService;
import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/reply/*")
@Slf4j
public class AdminMovieReplyController {
	
	@Setter(onMethod_ = @Autowired)
	public MovieReplyService movieReplyService;
	
	@GetMapping("/all")
	public String noticeDetail(MovieBoardVO mvo, MovieReplyVO mrvo, Model model) {
		
		List<MovieReplyVO> mvReply = movieReplyService.movieReplyAllList(mrvo);
		for(MovieReplyVO i : mvReply) {
			i.setMv_re_content(i.getMv_re_content().toString().replaceAll("\n", "<br />"));
		}
		model.addAttribute("mvReply", mvReply);

		return "admin/movieBoard/mvReplyFrame";
	}
}

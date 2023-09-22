package com.culture.api.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.api.movie.service.ApiMovieService;
import com.culture.api.movie.vo.ApiMovieCredits;
import com.culture.api.movie.vo.ApiMovieVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ApiController {
	/*
	 * @Autowired private ApiMovieService apiMovieService;
	 * 
	 * @GetMapping("/") public String nowPlayingMovie(Model model) {
	 * List<ApiMovieVO> movies = apiMovieService.getNowPlayingMovies();
	 * List<ApiMovieVO> popular = apiMovieService.getPopularMovies();
	 * List<ApiMovieVO> upcoming = apiMovieService.getUpcomingMovies();
	 * model.addAttribute("movies",movies); model.addAttribute("popular",popular);
	 * model.addAttribute("upcoming",upcoming);
	 * 
	 * return "index"; }
	 * 
	 * @PostMapping("/movieDetail/{id}") public String getDetail(@PathVariable
	 * String id, Model model) { ApiMovieVO movie =
	 * apiMovieService.getMovieDetail(id); String overview = movie.getOverview();
	 * if(overview=="") { overview = "준비중 입니다."; } movie.setOverview(overview);
	 * model.addAttribute("movie",movie);
	 * 
	 * return "userLogin/movie/template"; }
	 * 
	 * @PostMapping("/MovieSeatBooking/{id}") public String
	 * MovieSeatBooking(@PathVariable String id, Model model) throws Exception {
	 * ApiMovieVO movie = apiMovieService.MovieSeatBooking(id);
	 * 
	 * model.addAttribute("movie",movie);
	 * 
	 * return "userLogin/movie/MovieSeatBooking"; }
	 * 
	 * @PostMapping("/movieSearch") public String getMovieSearch(@RequestParam
	 * String title, Model model) { log.info("title ", title);
	 * 
	 * List<ApiMovieVO> searchMovie = apiMovieService.searchMovie(title);
	 * model.addAttribute("movies",searchMovie); return
	 * "userLogin/movie/movieSearch"; }
	 */
	
	@Autowired
	private ApiMovieService apiMovieService;
	
	@GetMapping("/")
	public String nowPlayingMovie(Model model) {
		List<ApiMovieVO> movies = apiMovieService.getNowPlayingMovies();
		List<ApiMovieVO> popular = apiMovieService.getPopularMovies();
		List<ApiMovieVO> upcoming = apiMovieService.getUpcomingMovies();
		model.addAttribute("movies",movies);
		model.addAttribute("popular",popular);
		model.addAttribute("upcoming",upcoming);
		
		return "index";
	}
	
	/*
	 * @PostMapping("/movieCredits/{id}") public String
	 * getMovieCredits(@PathVariable String id, Model model) { List<ApiMovieCredits>
	 * movies = apiMovieService.getMovieCredits(id); log.info("name 오기 성공~" );
	 * model.addAttribute("movies",movies);
	 * 
	 * return "movice/movieDetail"; }
	 */
	
	@PostMapping("/movieDetail/{id}")
	public String getDetail(@PathVariable String id, Model model) {
	    log.info("name 오기 성공~");
	    
	    // 영화 정보 가져오기
	    ApiMovieVO movie = apiMovieService.getMovieDetail(id);
	    
	    // 크레딧 정보 가져오기
	    List<ApiMovieCredits> movies = apiMovieService.getMovieCredits(id);
	    
	    
	    // 영화 개요 처리
	    String overview = movie.getOverview();
	    if (overview == null || overview.isEmpty()) {
	        overview = "준비중 입니다.";
	    }
	    movie.setOverview(overview);
	    
	    model.addAttribute("movie", movie);
	    model.addAttribute("movies", movies);
	    
	    // "movie/movieDetail" 뷰로 이동
<<<<<<< HEAD
	    return "/userLogin/movie/movieDetail";
=======
	    return "movie/movieDetail";
>>>>>>> refs/remotes/origin/feature/login
	}

	
	@PostMapping("/MovieSeatBooking/{id}")
	public String MovieSeatBooking(@PathVariable String id, Model model) throws Exception {
		ApiMovieVO movie = apiMovieService.MovieSeatBooking(id);

		model.addAttribute("movie",movie);
		
		return "/userLogin/movie/MovieSeatBooking";
	}
	
	@PostMapping("/movieSearch")
	public String getMovieSearch(@RequestParam String title, Model model) {
		log.info("title ", title);
		
		List<ApiMovieVO> searchMovie = apiMovieService.searchMovie(title);
		model.addAttribute("movies",searchMovie);
		return "/userLogin/movie/movieSearch";
	}
}

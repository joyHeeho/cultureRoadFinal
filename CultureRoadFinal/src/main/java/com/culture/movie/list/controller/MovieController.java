package com.culture.movie.list.controller;

import java.util.ArrayList;  
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.movie.list.service.MovieService;
import com.culture.movie.list.vo.MovieVO;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@GetMapping("/movie/*")
//	public String getNowPlaying(Model model) {
	public String searchPlayingMovie(Model model, @RequestParam(defaultValue = "2") int endPage) {
		
		List<MovieVO> movies = new ArrayList<>();
		List<MovieVO> movies2 = new ArrayList<>();
		
		
		// startPage부터 endPage까지의 페이지에 대한 데이터를 가져옴
	    for (int page = 1; page <= endPage; page++) {
	        List<MovieVO> pageMovies = movieService.getNowPlayingMovies(page);
	        movies.addAll(pageMovies);
	    }
	    
	    
	    for (int page = 1; page <= endPage; page++) {
	        List<MovieVO> pageMovies = movieService.getNowPlayingMovies2(page);
	        movies2.addAll(pageMovies);
	    }
	    
	    
	    model.addAttribute("movies", movies);
	    model.addAttribute("movies2", movies2);
	    
	    return "movie/movieList";
	    
	}
	
}
//	
//	@GetMapping("/movieDetail/{id}")
//	public String getDetail(@PathVariable String id, Model model) {
//		MovieVO movie = movieService.getMovieDetail(id);
//		String overview = movie.getOverview();
//		if(overview=="") {
//			overview = "준비중입니다.";
//		}
//		movie.setOverview(overview);
//		model.addAttribute("movie",movie);
//	
//		return "movie/movieDetail";
//	}
//	
//	@PostMapping("/movieSearch")
//	public String getMovieDetail(@RequestParam String title1, Model model) {
//		log.info("title ", title1);
//		
//		List<MovieVO> searchMovie = movieService.searchMovie(title1);
//		model.addAttribute("movies",searchMovie);
//		return "movie/movieSearch";
//	}
//}

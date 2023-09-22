package com.culture.user.comment.vo;



import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserCommentVO {
	private int 		mv_co_num = 0; 				//한줄평 번호
	private int 		id = 0; 					//영화 아이디(코드)
	private String 		mv_co_content = ""; 		// 댓글 내용
	private String 		mv_co_write_date = ""; 	    // 댓글 작성일
	private int 		mv_co_ratings = 0; 			// 댓글 점수
	private int			mv_co_hidden = 0; 			// 댓글 숨김
	private int 		mv_co_red = 0; 				// 댓글 신고
	private int 		user_no = 0; 				// 사용자 번호
	private String 		user_name = "";				// 사용자명
	private String 		title = "";					// 영화 제목
	
	
	// 현재사용자가 좋아요 누른건지 아닌지
<<<<<<< HEAD
	private int comment_like_cnt;
=======
	private String hno;
>>>>>>> refs/remotes/origin/feature/login
	
}

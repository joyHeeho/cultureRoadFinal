<<<<<<< HEAD
package com.culture.user.board.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MovieReplyVO extends CommonVO{
	private int mv_re_num;
	private String mv_re_content = "";
	private String mv_re_write_date;
	private int mv_re_hidden = 0;
	private int mv_re_red = 0;
	private int user_no;
	private int mv_bo_num;
	private int rereply = 0;	//대댓글일시 부모 댓글 mv_re_num 입력 
	private String user_name;
}
=======
package com.culture.user.board.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MovieReplyVO extends CommonVO{
	private int mv_re_num;
	private String mv_re_content = "";
	private String mv_re_write_date;
	private int mv_re_hidden = 0;
	private int mv_re_red = 0;
	private int user_no;
	private int mv_bo_num;
	private int rereply = 0;	//대댓글일시 부모 댓글 mv_re_num 입력 
	private String user_name;
}
>>>>>>> refs/remotes/origin/feature/login

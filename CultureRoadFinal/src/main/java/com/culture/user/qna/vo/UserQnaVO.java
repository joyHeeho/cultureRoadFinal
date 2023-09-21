package com.culture.user.qna.vo;


import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserQnaVO extends CommonVO {
		
		private int category; //말머리
	    private String user_id;
	    private int qna_id; 
	    private String question;
	    private String answer;
	    private String question_date;
	    private String answer_date;
	    private int readcnt = 0;
	    
//	    private MultipartFile file; //파일 업로드를 위한 필드(실제 파일)
//		private String q_file ="";  //실제 서버에 저장할 파일명 (경로 파일명)

}

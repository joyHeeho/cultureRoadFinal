package com.culture.qna.service;




import java.util.List;

import com.culture.qna.vo.QnaVO;

public interface QnaService {
	
	public List<QnaVO> qnaList(QnaVO qvo); //글 목록
	
	public int deleteQna(int qna_id);//글 삭제
	
	public int insertQna(QnaVO qvo); //질문글 입력

	public int qnaListCnt(QnaVO qvo); //페이징
	
	public void updateAnswer(QnaVO qvo); //관리자 답변
	
	
	public QnaVO getQnaById(int qna_id);

	
	public void updateQna(QnaVO qvo);  //사용자 수정



	












}

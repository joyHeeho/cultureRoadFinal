package com.culture.qna.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.qna.vo.QnaVO;

@Mapper
public interface QnaDAO {

	public List<QnaVO> qnaList(QnaVO qvo);   //목록
	public int insertQna(QnaVO qvo); //글쓰기
	public int deleteQna(int qna_id); //삭제
	
	public int qnaListCnt(QnaVO qvo); //페이징
	public void updateAnswer(QnaVO qvo); //관리자답변

	QnaVO getQnaById(int qna_id);
	
	public void updateQna(QnaVO qvo); //수정
	
	/*******아직 안한 거************/
	
	
	public QnaVO search(int qna_id);
	


}

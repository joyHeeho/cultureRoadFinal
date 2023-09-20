package com.culture.qna.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.qna.dao.QnaDAO;
import com.culture.qna.vo.QnaVO;

import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_ = @Autowired)
	public QnaDAO qnaDAO;

	

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = qnaDAO.qnaList(qvo);
		return list;
	}

	@Override
	public int insertQna(QnaVO qvo) {
		int result = 0;
		result = qnaDAO.insertQna(qvo);
		return result;
	}
	
	
	@Override
	public int qnaListCnt(QnaVO qvo) {
		return qnaDAO.qnaListCnt(qvo);
	}
	/*********************답변 입력,삭제****************************/


	  @Override
	    public void updateAnswer(QnaVO qvo) {
	        qnaDAO.updateAnswer(qvo);
	    }

		@Override
		public int deleteQna(int qna_id) {
			return qnaDAO.deleteQna(qna_id);
		}

	
		/********************사용자 수정 ***************************/
		
		@Override
		public void updateQna(QnaVO qvo) {
			qnaDAO.updateQna(qvo);
		}

		@Override
		public QnaVO getQnaById(int qna_id) {
			return qnaDAO.getQnaById(qna_id);
		}

		

		






	  




	
	

	
	
}

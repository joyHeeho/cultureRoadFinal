package com.culture.api.payment.service;

import com.culture.api.payment.DAO.PaymentRepository;
import com.culture.api.payment.vo.MvorderdetailVO;
import com.culture.api.payment.vo.PaymentVO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private MvorderdetailService mvorderdetailService;  // 추가

    @Override
    public Map<String, Object> savePaymentAndReturn(PaymentVO paymentVO) {
        Map<String, Object> resultMap = new HashMap<>();
        log.info("paymentVO - " + paymentVO);

        //  로그인 정보를 세션에서 받아와 넣어야 함
//        paymentVO.setUserNo(1);
        paymentVO.setMvPaymentId(paymentRepository.paymentNumber());
        int result = paymentRepository.insertPayment(paymentVO);
        if(result == 1) {
            // MVORDERDETAIL에 데이터를 추가하는 부분
            MvorderdetailVO mvorderdetailVO = new MvorderdetailVO();

            //PaymentVO seq = paymentRepository.seq(paymentVO);
            //if (seq != null) {
                mvorderdetailVO.setMvPaymentId(paymentVO.getMvPaymentId());
                log.info(" 받아와라 " + mvorderdetailVO.getMvPaymentId());
            //} else {
            //    log.error("mvPaymentId를 가져올 수 없습니다."); // 오류 로그
           //}
            // 필드 설정
            // mvOrderId는 DB에서 자동으로 생성되므로 설정하지 않음
            mvorderdetailVO.setMvPaymentId(paymentVO.getMvPaymentId());	//결제번호
            mvorderdetailVO.setUserNo(paymentVO.getUserNo());			//유저번호
            mvorderdetailVO.setMvHeadcnt(paymentVO.getMvHeadcnt());		//인원
            mvorderdetailVO.setMvPrice(paymentVO.getMvPrice());			//가격
            mvorderdetailVO.setMvDate(paymentVO.getMvDate()); 			// 현재 날짜를 설정 영화상영날짜 불러와야됨

            // MVORDERDETAIL에 데이터를 추가
            mvorderdetailService.insertOrderDetail(mvorderdetailVO);  // 추가

            resultMap.put("status", "success");
            resultMap.put("message", "결제가 성공적으로 완료되었습니다");
            resultMap.put("paymentDetail", paymentVO);
        } else {
            resultMap.put("status", "fail");
            resultMap.put("message", "결제가 취소되었습니다");
        }
        return resultMap;
    }
    
    @Override
    public boolean cancelPayment(PaymentVO payment) {
        int rowsAffected = paymentRepository.cancelPayment(payment.getMvPaymentId());  // 2는 취소 상태를 의미
        return rowsAffected > 0;
    }
    @Override
    public PaymentVO getPaymentInfo(int mvPaymentId) {  // New method
        return paymentRepository.getPaymentInfo(mvPaymentId);
    }

}

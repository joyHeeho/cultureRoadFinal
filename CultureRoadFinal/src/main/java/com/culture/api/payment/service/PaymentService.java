package com.culture.api.payment.service;

import java.util.Map;

import com.culture.api.payment.vo.PaymentVO;

public interface PaymentService {
    Map<String, Object> savePaymentAndReturn(PaymentVO paymentVO);

    boolean cancelPayment(PaymentVO payment);	//취소

    PaymentVO getPaymentInfo(int mvPaymentId);  // vo저장

}

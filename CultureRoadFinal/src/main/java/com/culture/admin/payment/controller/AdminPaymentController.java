package com.culture.admin.payment.controller;

import com.culture.admin.login.vo.AdminLoginVO;
import com.culture.api.payment.controller.PaymentCommonController;
import com.culture.api.payment.service.MvorderdetailService;
import com.culture.api.payment.service.PaymentService;
import com.culture.api.payment.vo.PaymentVO;
//import com.spring.admin.login.vo.AdminVO;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminpay/*")
@RequiredArgsConstructor
@Slf4j
public class AdminPaymentController extends PaymentCommonController {

    private final MvorderdetailService mvorderdetailService;

    private final PaymentService paymentService;


    @RequestMapping("/paymentList")
    public String paymentList(HttpServletRequest request, ModelMap model) {
    	AdminLoginVO adminLogin = (AdminLoginVO) request.getSession().getAttribute("adminLogin");

        if(adminLogin == null) {
            return "redirect:/admin/login/adminLogin";
        }
        log.info("관리자 결제관리 페이지 호출 성공");

        //mvorderdetailService를 사용하여 결제 내역을 조회하고, 이를 details라는 이름으로 모델에 추가하고
        //이렇게 모델에 데이터를 추가하면 해당 데이터를 뷰에서 사용가능
        model.addAttribute("details", mvorderdetailService.getAllOrderDetails());
        return "/client/admin/adminOrderDetails";
    }

    @PostMapping("/paymentCancel")
    public void cancelPayment(HttpServletResponse response, PaymentVO payment) throws IOException {
        if(payment == null || payment.getMvPaymentId() == 0) {
            log.error("MvPaymentId 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        String accessToken = getPaymentAccessToken();

        // payment 유효성 확인 AccessToken 없는 경우
        /*
         * 결제 취소를 진행하기 위해서는 취소할 결제에 대한 정보가 필요하므로, 
         * payment 객체가 null이거나 mvPaymentId가 0이면 유효하지 않은 데이터로 간주하고 
         * 오류 처리를함
         */
        if(accessToken == null || accessToken.isEmpty()) {
            log.error("accessToken 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        if(doCancelPayment(accessToken, String.valueOf(payment.getMvPaymentId()))) { // 결제 취소 성공
            log.info("결제 취소 성공");
            if(paymentService.cancelPayment(payment)) {
                alertMessage(response, ADMIN_CANCEL_SUCCESS_MESSAGE);
            } else {
                alertMessage(response, CANCEL_FAIL_MESSAGE);
            }
        } else { // 결제 취소 실패
            log.error("결제 취소 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
        }
    }
}

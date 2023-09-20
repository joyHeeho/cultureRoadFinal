package com.culture.api.payment.controller;

import com.culture.api.payment.service.PaymentService;
import com.culture.api.payment.vo.PaymentVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller  // @RestController 대신 @Controller를 사용
@RequestMapping("/payment/*")  // 맵핑 주소
@Slf4j
@RequiredArgsConstructor
public class PaymentController extends PaymentCommonController{

    private final PaymentService paymentService;

    @PostMapping("/ajax/save")  // 데이터 vo에 저장
    public @ResponseBody Map<String, Object> savePayment(@RequestBody PaymentVO paymentVO) {
        return paymentService.savePaymentAndReturn(paymentVO);
    }

    @GetMapping("/page")  // 결제 페이지 클릭시 .jsp 호출 맵핑
    public String paymentPage(/*@RequestParam("movieId") String movieId requ,*/ ModelMap model) {
        // TODO : 로그인 검증 및 영화정보 있는지 검증

        // 영화 정보(지금은 기능이 아직 없으므로 더미 데이터로 대체)
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Map<String, Object> dummyMovieData = new HashMap<>();
//        dummyMovieData.put("movieId", movieId);
//        dummyMovieData.put("movieTitle", "영화제목");
//        dummyMovieData.put("price", 100);
//        dummyMovieData.put("mvDate", sdf.format(new Date()));
////        dummyMovieData.put("userNo", 1);
//        log.info("결제페이지 호출 + 데이터");
//        log.info("dummyMovieData : {}", dummyMovieData);
//        model.addAttribute("movie", dummyMovieData);
        return "payment/payment";
    }

    /**
     * 환불하기
     * @param response
     * @param payment
     * @throws IOException
     */
    @PostMapping("/cancel")
    public void cancelPayment(HttpServletResponse response, PaymentVO payment) throws IOException {
        //  사용자 검증 추가

        if(payment == null || payment.getMvPaymentId() == 0) {
            log.error("MvPaymentId 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        String accessToken = getPaymentAccessToken();

        // AccessToken 없는 경우
        if(accessToken == null || accessToken.isEmpty()) {
            log.error("accessToken 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
            return;
        }

        if(doCancelPayment(accessToken, String.valueOf(payment.getMvPaymentId()))) { // 결제 취소 성공
            log.info("결제 취소 성공");
            if(paymentService.cancelPayment(payment)) {
                alertMessage(response, CANCEL_SUCCESS_MESSAGE);
            } else {
                alertMessage(response, CANCEL_FAIL_MESSAGE);
            }
        } else { // 결제 취소 실패
            log.error("결제 취소 오류");
            alertMessage(response, CANCEL_FAIL_MESSAGE);
        }
    }
}

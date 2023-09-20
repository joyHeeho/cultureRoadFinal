package com.culture.api.payment.vo;


import lombok.Data;

@Data
public class MvorderdetailVO {
    private int mvOrderId;
    private int mvPaymentId;
    private int userNo;
    private int mvHeadcnt;
    private int mvPrice;
    private String mvDate;
    private int mvPayStatus;
}

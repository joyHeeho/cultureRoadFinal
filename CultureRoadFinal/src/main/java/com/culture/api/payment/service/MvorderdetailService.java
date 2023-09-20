package com.culture.api.payment.service;

import java.util.List;

import com.culture.api.payment.vo.MvorderdetailVO;
import com.culture.user.login.vo.UserLoginVO;

public interface MvorderdetailService {
	int insertOrderDetail(MvorderdetailVO orderDetail);
	
	// 특정 사용자의 결제 내역
	List<MvorderdetailVO> getSelectedOrderDetails(UserLoginVO user);

	// 모든 사용자의 결제 내역
	List<MvorderdetailVO> getAllOrderDetails();


}

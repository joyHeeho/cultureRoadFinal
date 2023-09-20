package com.culture.api.payment.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.api.payment.vo.MvorderdetailVO;
import com.culture.user.login.vo.UserLoginVO;

@Mapper 
public interface MvorderdetailDAO {
    int insertOrderDetail(MvorderdetailVO orderDetail);
    //특정 사용자 영수증
    List<MvorderdetailVO> getSelectedOrderDetails(UserLoginVO uvo);
    //관리자용 사용자 전 체영수증
    List<MvorderdetailVO> getAllOrderDetails();
}


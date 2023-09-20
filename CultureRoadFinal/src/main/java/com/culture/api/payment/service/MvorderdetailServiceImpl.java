package com.culture.api.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.api.payment.DAO.MvorderdetailDAO;
import com.culture.api.payment.vo.MvorderdetailVO;
import com.culture.user.login.vo.UserLoginVO;

@Service
public class MvorderdetailServiceImpl implements MvorderdetailService {

    @Autowired
    private MvorderdetailDAO mvorderdetailDAO;
    
    @Override
    public int insertOrderDetail(MvorderdetailVO orderDetail) {
        return mvorderdetailDAO.insertOrderDetail(orderDetail);
    }
    
    @Override
    public List<MvorderdetailVO> getSelectedOrderDetails(UserLoginVO uvo) {
        return mvorderdetailDAO.getSelectedOrderDetails(uvo);
    }

    @Override
    public List<MvorderdetailVO> getAllOrderDetails() {
        return mvorderdetailDAO.getAllOrderDetails();
    }
}

package com.culture.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.admin.login.dao.AdminLoginDAO;
import com.culture.admin.login.vo.AdminLoginVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Setter(onMethod_ = @Autowired)
	private AdminLoginDAO adminLoginDAO;

	@Override
	public AdminLoginVO adminLogin(AdminLoginVO alvo) {
		return adminLoginDAO.adminLogin(alvo);
	}

}

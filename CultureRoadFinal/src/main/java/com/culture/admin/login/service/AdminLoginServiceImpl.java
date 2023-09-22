package com.culture.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.admin.login.dao.AdminLoginDAO;
import com.culture.admin.login.vo.AdminLoginVO;
import com.culture.user.login.dao.UserLoginDAO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Setter(onMethod_ = @Autowired)
	private AdminLoginDAO adminLoginDAO;
	
	@Setter(onMethod_ = @Autowired)
	private UserLoginDAO userLoginDAO;

	@Override
	public AdminLoginVO adminLogin(AdminLoginVO alvo) {
		return adminLoginDAO.adminLogin(alvo);
	}

	@Override
	public int userCount() {
		int userCnt = adminLoginDAO.userCount();
		return userCnt;
	}

	@Override
	public int replyCount() {
		int userCnt = adminLoginDAO.replyCount();
		return userCnt;
	}

	@Override
	public int commentCount() {
		int userCnt = adminLoginDAO.commentCount();
		return userCnt;
	}

	@Override
	public int mvboardCount() {
		int userCnt = adminLoginDAO.mvboardCount();
		return userCnt;
	}
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/feature/login
}

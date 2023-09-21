package com.culture.admin.login.service;


import com.culture.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {
	public AdminLoginVO adminLogin(AdminLoginVO alvo);
	public int userCount();
	public int replyCount();
	public int commentCount();
	public int mvboardCount();

}

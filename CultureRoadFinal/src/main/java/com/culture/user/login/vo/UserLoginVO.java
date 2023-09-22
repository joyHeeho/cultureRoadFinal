package com.culture.user.login.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/feature/login

@Data
<<<<<<< HEAD
@EqualsAndHashCode(callSuper = false)
public class UserLoginVO extends CommonVO{

=======
@EqualsAndHashCode(callSuper=false)
public class UserLoginVO extends CommonVO{
>>>>>>> refs/remotes/origin/feature/login
	private int userNo;
	private String userId;
	private String userPw ="";
	private String userName;
	private String userEmail="";
	private String userPhone="";
	private String userBirth;
	private String userDate;
	private int userDelete;
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/feature/login
	private String userStatus;
}

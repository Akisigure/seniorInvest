package com.invest.user.dto;

import lombok.Data;

@Data
public class Findpwd {
	private String currentPassword;
	private String newPassword;
	private UpdatePassword updatePassword;
	private String userName;
	private String email;
	private String password;
	private String userid;
	}

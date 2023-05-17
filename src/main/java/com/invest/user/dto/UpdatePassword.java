package com.invest.user.dto;

import lombok.Data;

@Data
public class UpdatePassword {
	private String password;
	private String passwordCheck;
}
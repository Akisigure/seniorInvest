package com.invest.user.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	
	private String userid;
	private String accountid;
	private String password;
	private String userName;
	private String phoneNumber;
	private String email;
	private String address;
	private Date joinedDate;
	private Role role;
	private char enabled;
	private char restrictStock;
	private char alert;

}

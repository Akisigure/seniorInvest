package com.invest.user.dto;

import java.util.Date;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.NoArgsConstructor;

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
	private Role roleid;
	private char enabled;
	private char restrictStock;
	private char alert;

}

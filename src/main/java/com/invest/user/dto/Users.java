package com.invest.user.dto;

import java.util.Date;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Users {
	
	@NotEmpty(message = "아이디를 적어주세요")
	private String userid;
	@NotEmpty(message = "계좌번호를 적어주세요(-제외)")
	private String accountid;
	@NotEmpty(message = "비밀번호를 적어주세요")
	private String password;
	@NotEmpty(message = "이름을 적어주세요")
	private String userName;
	@NotEmpty(message = "핸드폰번호를 적어주세요(-제외)")
	private String phoneNumber;
	@Email
	private String email;
	private String address;
	
	private Date joinedDate;
	private Role role;
	private char enabled;
	private char restrictStock;
	private char alert;

}

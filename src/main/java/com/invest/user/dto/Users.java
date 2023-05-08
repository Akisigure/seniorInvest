package com.invest.user.dto;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Users {
	
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	private String userid;
	
	private String accountid;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Length(min = 4, max = 16, message = "비밀번호는 4자 이상, 16자 이하로 입력해주세요.")
	private String password;
	
	private String userName;
	
	private String phoneNumber;
	
	@Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	private String email;
	
	private String address;
	
	private Date joinedDate;
	
	private Role roleid;
	
	private char enabled;
	
	private char restrictStock;
	
	private char alert;

}

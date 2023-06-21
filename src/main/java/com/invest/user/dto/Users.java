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
	
	@NotBlank(message = "아이디는 필수 입력 사항입니다.")
	private String userid;
	
	private String accountid;
	 
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Length(min = 6, max = 15, message="6글자 이상 15글자 이하로 해주세요")
	private String password;
	
	@Pattern(regexp = "^[가-힣]*$", message = "한글만 입력해주세요")
	@Length(min =2, message = "한글만 입력해주세요")
	private String userName;
	
	@Pattern(regexp = "^010[0-9]{4}[0-9]{4}$", message = "핸드폰 번호를 입력해주세요.")
	private String phoneNumber;
	
	@Pattern(regexp = "!/^\\w+@\\w+\\.com$/", message = "이메일 형식이 올바르지 않습니다.")
	@NotBlank(message = "")
	private String email;
	
	private String address;
	
	private String addressDetail;
	
	private String addressNumber;
	
	private Date joinedDate;
	
	private Role roleid;
	
	private char enabled;
	
	private UpdatePassword updatePassword;
	

}
   
package com.invest.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
	
	@Autowired
	private InvestUserDetailsService investUserDetailsService;
	
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity security) throws Exception {
		 
		security.authorizeHttpRequests()
        .requestMatchers("/stockBuy").authenticated()
        .requestMatchers("/Mypage").authenticated()
        .requestMatchers("/admin/**").hasRole("ADMIN")
        .requestMatchers("/adminhome").hasRole("ADMIN")
        .requestMatchers("/updatePassword").authenticated()
        .requestMatchers("/qa/**").authenticated()
        .requestMatchers("/StocksellDc").authenticated()
        .requestMatchers("/notice/**").authenticated()
        .anyRequest().permitAll()
        .and().formLogin().loginPage("/login").defaultSuccessUrl("/", true).usernameParameter("userid").failureUrl("/login?error=true").permitAll()
        .and().exceptionHandling().accessDeniedPage("/account/accessDenied")
        .and().logout().logoutSuccessUrl("/").invalidateHttpSession(true);
		
		security.userDetailsService(investUserDetailsService);
		security.csrf().disable();
		
		return security.build(); 
	}
	
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
		
	
}
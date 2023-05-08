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
        .requestMatchers("/user/**").authenticated()
        .requestMatchers("/admin/**").hasRole("ADMIN")
        .anyRequest().permitAll()
        .and().formLogin().loginPage("/login").defaultSuccessUrl("/loginSuccess", true)
        .and().exceptionHandling().accessDeniedPage("/accessDenied")
        .and().logout().invalidateHttpSession(true).logoutSuccessUrl("/login");
		
		security.csrf().disable();
		security.formLogin().loginPage("/login").defaultSuccessUrl("/loginSuccess", true);
		
		return security.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
}

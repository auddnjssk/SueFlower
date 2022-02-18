package com.suflower.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.suflower.security.CustomLoginSuccessHandler;

import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@Log4j
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
   
   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      log.info("configure.....................");
      auth.inMemoryAuthentication().withUser("admin").password("{noop}12345!").roles("ADMIN");
      auth.inMemoryAuthentication().withUser("test").password("{noop}12345").roles("MEMBER");
   }
   
   @Bean
   public AuthenticationSuccessHandler loginSuccessHandler() {
      return new CustomLoginSuccessHandler();
   }
   
   @Override
   protected void configure(HttpSecurity http) throws Exception {
      http.csrf().disable();
      http.authorizeRequests()
         .antMatchers("/sample/all").permitAll()
         .antMatchers("/sample/admin").access("hasRole('ROLE_ADMIN')")
         .antMatchers("/sample/member").access("hasRole('ROLE_MEMBER')");
//         .antMatchers("/member/update").permitAll()
//         .antMatchers("/member/login").permitAll();
      
      http.formLogin()
      .loginPage("/customlogin")
      .loginProcessingUrl("/ogin")
      .successHandler(loginSuccessHandler());
      
   }
   
   
}
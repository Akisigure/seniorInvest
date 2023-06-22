/*
 * package com.invest.config;
 * 
 * import org.springframework.ui.Model; import
 * org.springframework.web.bind.MethodArgumentNotValidException; import
 * org.springframework.web.bind.annotation.ControllerAdvice; import
 * org.springframework.web.bind.annotation.ExceptionHandler;
 * 
 * @ControllerAdvice public class GlobalExceptionHandler {
 * 
 * 
 * @ExceptionHandler(MethodArgumentNotValidException.class) public String
 * handleException(MethodArgumentNotValidException e, Model m) {
 * System.out.println("MethodArgumentNotValidException 처리" );
 * m.addAttribute("exception", e); return "errors/globalError"; }
 * 
 * @ExceptionHandler(Exception.class) public String handleException(Exception e,
 * Model m) { m.addAttribute("exception", e); return "errors/globalError"; } }
 */

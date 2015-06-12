package com.haohe.srm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * This is the FE call entry.
 * FE call these web service and get data to display in UI
 */ 
@Controller
public class LoginController {
  
	@RequestMapping(value="/login_page", method= RequestMethod.GET )
 
	public String loginPage( String failure){
 
		 return "page_login";
	}

     
}

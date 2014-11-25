/**
 * 
 */
package com.gennady.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author owner
 *
 */
@Controller 
public class Login {
	private static String rn1 = "Sturgeon";
	private static String rn2 = "InterLakes";
	private static String rn1User = "sturguser";
	private static String rn2User = "interuser";
	private static String rn1Pass = "p@ssw0rd1";
	private static String rn2Pass = "p@ssw0rd2";
	
	@RequestMapping("/Interlakes")  
    public String loginInter() {
		return "redirect:/login?company=interlakes";
	}
	
	@RequestMapping("/Sturgeon")  
    public String loginStur() {
		return "redirect:/login?company=sturgeon";
	}

	
	@RequestMapping("/login")  
    public ModelAndView loginUser(WebRequest webRequest) {
		ModelAndView model = new ModelAndView("login");
		String company = webRequest.getParameter("company");
		model.addObject("company", company);
		if (webRequest.getParameter("valid") != null) {
			model.addObject("valid", webRequest.getParameter("valid"));
		}
		return model;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)  
    public String loginUser(@RequestParam("company") String company, @RequestParam("username") String username, @RequestParam("password") String password) {
		boolean valid = false;
		String company1 = company;

		if (rn2User.equals(username) && rn2Pass.equals(password)) {
			valid = true;
			company1 = rn2;
		} 
		else if (rn1User.equals(username) && rn1Pass.equals(password)) {
			valid = true;
			company1 = rn1;
		}
		
		return (valid)? "redirect:/show?company=" + company1 : "redirect:/login?valid="+ valid;
	}
	
	@RequestMapping("/logout")  
    public String logoutUser(WebRequest webRequest) {		
		String company = webRequest.getParameter("company");
		String result = "redirect:/login";
		if (company != null && company != "") 
			result += "?company="+company;
		return result;
	}

}

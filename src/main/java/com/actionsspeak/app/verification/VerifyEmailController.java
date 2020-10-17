package com.actionsspeak.app.verification;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/")
public class VerifyEmailController {

	@RequestMapping("/email-verification")
	public String verifyEmail(ModelMap map) {
		map.put("currentDate", new Date());
		return "email-verification";
	}
}
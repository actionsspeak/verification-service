package com.actionsspeak.app.verification;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reset")
public class PasswordResetController {
    @RequestMapping("/reset-password")
    public String verifyEmail(ModelMap map) {
        map.put("currentDate", new Date());
        return "password-reset";
    }
}

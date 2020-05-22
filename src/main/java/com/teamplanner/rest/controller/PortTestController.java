package com.teamplanner.rest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("porttest")
public class PortTestController {

    @GetMapping("/test")
    public String porttest(HttpServletRequest request){
	System.out.println("This can't be true");
        return "Application is running. Request from origin: "+request.getHeader("origin");
    }
}

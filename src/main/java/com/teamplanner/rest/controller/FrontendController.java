package com.teamplanner.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontendController {

    @GetMapping("/")
    public String index(){
         System.out.println("inside frontend controller");
         return "/resources/index";
    }
}

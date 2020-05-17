package com.teamplanner.rest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("porttest")
public class PortTestController {

    @GetMapping("/test")
    public String porttest(){
        return "Application is running";
    }
}

package com.teamplanner.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class FrontendController {

    @GetMapping({"/", "/games","/game/*", "/editPlan/*", "/friends", "/chooseNickname", "/addFriend", "/createPlan"})
    public String noroute(){

        return ("forward:/index.html");
    }

    @GetMapping("/unauthorized")
    public String unauthorized() {

        return ("redirect:/index.html");
    }

}

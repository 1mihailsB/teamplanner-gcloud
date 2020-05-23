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

    @GetMapping("/")
    public void noroute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @GetMapping("/games")
    public void games(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @GetMapping("/friends")
    public void friends(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @GetMapping("/chooseNickname")
    public void chooseNickname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("index.html").forward(request, response);
    }

}

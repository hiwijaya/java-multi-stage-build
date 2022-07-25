package com.hiwijaya.javamultistagebuild;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String index(){

        System.out.println("[java-multi-stage-build]");

        return "java-multi-stage-build";
    }

}

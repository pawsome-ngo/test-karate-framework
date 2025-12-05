package com.example.karate_project;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
import java.util.Collections;

@RestController
public class GreetingController {

    @GetMapping("/hello")
    public Map<String, String> getGreeting(@RequestParam(defaultValue = "World") String name) {
        return Collections.singletonMap("greeting", "Hello, " + name + "!");
    }
}
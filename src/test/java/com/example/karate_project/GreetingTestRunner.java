package com.example.karate_project;

import com.intuit.karate.junit5.Karate;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;

// Note: This runner must still start the Spring context to test the local endpoint!
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class GreetingTestRunner {

    @LocalServerPort
    int serverPort;

    @Karate.Test
    Karate testGreetingFeature() {
        // 1. Pass the dynamic port to config
        System.setProperty("server.port", String.valueOf(serverPort));
        String defaultEnv = "qa";
        // 2. Specify ONLY the greeting.feature file
        // Since both the runner and the feature file are in the same package, 
        // we only need to provide the name.
        return Karate.run("greeting").karateEnv(defaultEnv).relativeTo(getClass());
    }
}
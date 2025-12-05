package com.example.karate_project;

import com.intuit.karate.junit5.Karate;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class KarateProjectApplicationTests {

	@Karate.Test
	Karate runKarateTests() {

		// Tells Karate to run all .feature files in the same package (or sub-packages)
		return Karate.run().tags("@local-print").relativeTo(getClass());

	}
}
package apiexamples;

import com.intuit.karate.junit5.Karate.Test;
import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Test
	public Karate runTest() {
		//return Karate.run("getapi");
		return Karate.run("classpath:Karate/src/test/java/apiexamples/getapi.feature");
	}
}

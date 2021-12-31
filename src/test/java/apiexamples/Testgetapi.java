package apiexamples;

//import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.intuit.karate.junit5.Karate;

class Testgetapi {

	@Test
	public Karate runTest() {
		return Karate.run("getapi");
		//return Karate.run("classpath:Karate/src/test/java/apiexamples/getapi.feature");
	}

}

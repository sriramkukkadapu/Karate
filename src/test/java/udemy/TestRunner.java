package udemy;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	/*
	 @Karate.Test
	Karate getAPITest() {
		return Karate.run("getapi").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate postAPITest() {
		return Karate.run("postapi_random").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate putAPITest() {
		return Karate.run("putapi").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate deleteAPITest() {
		return Karate.run("delete").relativeTo(getClass());
	}
	*/

	
/*	@Karate.Test
	Karate runAll() {
		return Karate.run().relativeTo(getClass());
	}
*/

//	@Karate.Test
//	Karate debugMethod() {
//		return Karate.run().tags("@debug").relativeTo(getClass());
//	}
//	
//	
	
	@Karate.Test
	Karate executeRunner() {
		return Karate.run("asserts").relativeTo(getClass());
	}
}

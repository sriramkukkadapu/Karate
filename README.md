# Karate

#To start Angular Realworld app
Go to /Users/thw5795/eclipse-workspace/angular-realworld-example-app
do yarn start

#To debug a specific test in Karate
TestRunner => File name of runner class i.e TestRunner.java <br>
debugMethod => in TestRunner file method that invokes debug tags <br>
@debug => add this in feature file for scenario which you want to debug

@debug 	
Scenario: Create new article

mvn test -Dtest=TestRunner#debugMethod

#Background
This is like BeforeTest in TestNG this is executed before each scenario
Background: Define URL 
	Given url 'https://api.realworld.io/api/'

In this example this url variable will be defined before each scenario

#calling a feature class in another feature => call keyword
Example:
* def createTokenResponse = call read('classpath:helpers/Createtoken.feature')
* def token =  createTokenResponse.token

#calling a feature class in another feature => callonce keyword
using this method will be called once before 1st scenario and response is cached and reused for other scenarios.
Example:
* def createTokenResponse = callonce read('classpath:helpers/Createtoken.feature')
* def token =  createTokenResponse.token

#calling a feature in another feature with parameters passed.
Example:
In main feature:

   * def createTokenResponse = call read('classpath:helpers/CreateTokenParam.feature'){"email": "sriramkukkadapu@gmail.com","password": "sriramk1"}
   * def token =  createTokenResponse.token	
   
In sub feature:
	* def body = """ 	{"user":{"email":"#(email)","password":"#(password)"}}	"""
	

#running karate tests with diff env
mvn test -Dkarate.env=qa	

Karate-conf.js file will look like this:

if (env == 'dev') { 
// customize 
// e.g. config.foo = 'bar'; 
config.userEmail = 'sriramkukkadapu@gmail.com'
config.userPassword = 'sriramk1'
 
} else if (env == 'qa') { 
// customize 
config.userEmail = 'invalid@gmail.com'
config.userPassword = 'invalid'
} 
	
#Setting a token as Authorization header in global config
CreateTokenConfigVariables => this feature file creates a token and returns that. 

var accessToken = karate.callSingle('classpath:helpers/CreateTokenConfigVariables.feature',config).token
karate.configure('headers', {Authorization: 'Token '+ accessToken})






	
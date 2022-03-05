Feature: GET API Feature - angular real world example

#Like BeforeTest
Background: Define URL 
	Given url 'https://api.realworld.io/api/'

Scenario: GET tags
	Given path 'tags'
	When method Get
	Then status 200
	And match response.tags contains 'welcome'
	And match response.tags contains [ 'welcome', 'implementations' ]
	And match response.tags !contains [ 'invalid', 'invalid2' ]
	And match response.tags == "#array"
	And match response.tags != "#string"
	And match each response.tags == "#string"
	
Scenario: GET articles with params separated from url
	Given params { limit:10, offset:0 }
	Given path 'articles'
	When method Get
	Then status 200	
	And match response.articles == '#[3]'   
	And match response.articlesCount == 3 
	
	


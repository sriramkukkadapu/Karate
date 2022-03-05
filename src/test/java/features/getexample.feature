Feature: GET API Feature - angular real world example

#Like BeforeTest
Background: Define URL 
	Given url 'https://api.realworld.io/api/'

Scenario: GET tags
	Given path 'tags'
	When method Get
	Then status 200
	And match response.tags contains 'welcome'

Scenario: GET articles with url
	Given url 'https://api.realworld.io/api/articles?limit=10&offset=0'
	When method Get
	Then status 200
	
Scenario: GET articles with url & path
	#Given url 'https://api.realworld.io/api/'
	Given path 'articles'
	When method Get
	Then status 200

Scenario: GET articles with params separated from url
#	Given param limit = 10
#	Given param offset = 0
	Given params { limit:10, offset:0 }
#	Given url 'https://api.realworld.io/api/articles'
	Given path 'articles'
	When method Get
	Then status 200
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
	#And match response.tags !contains any [ 'invalid', 'invalid2' ] - this fails not sure why
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
	And match response == { "articles": "#array", "articlesCount" : 3}  
	And match response.articles[0].createdAt contains '2021'
	#And match response.articles[*].favoritesCount contains 1102
	And match response.articles[*].author.bio contains null
	And match response..bio contains null
	And match each response..following == false
	And match each response..following == '#boolean'
	And match each response..favoritesCount == '#number'
	# '##string' checks if it is a sentence and also it is optional in below 1st line passes, 2nd will fails
	And match each response..bio == '##string'
	#And match each response..bio == '#string'
	
	


Feature: GET API Feature - angular real world example

#Like BeforeTest
Background: Define URL 
	Given url 'https://api.realworld.io/api/'

@debug 	
Scenario: Create new article
	Given path 'users/login'
	And request {"user":{"email":"sriramkukkadapu@gmail.com","password":"sriramk1"}}
	When method post
	Then status 200
	* def token = response.user.token	

@ignore	
Scenario:
	Given header Authorization = 'Token ' + token
	Given path 'articles'
	And request {"article":{"tagList":[],"title":"test","description":"test","body":"etst"}}
	When method post
	Then status 200
	And match response.article.title == 'test'
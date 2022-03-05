Feature: GET API Feature - angular real world example

#Like BeforeTest
Background: Define URL 
	Given url 'https://api.realworld.io/api/'
	Given path 'users/login'
	And request {"user":{"email":"sriramkukkadapu@gmail.com","password":"sriramk1"}}
	When method post
	Then status 200
	* def token = response.user.token	
	
	 	
Scenario: Create new article and Delete

	Given header Authorization = 'Token ' + token
	Given path 'articles'
	And request {"article":{"tagList":[],"title":"test","description":"test","body":"etst"}}
	When method post
	Then status 200
	And match response.article.title == 'test'
	* def slug = response.article.slug
	 
	Given header Authorization = 'Token ' + token
	Given path 'articles/' + slug
	When method delete
	Then status 204

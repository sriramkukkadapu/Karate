#Here username and pwd coming from karate conf.js
Feature: GET API Feature - angular real world example

#Like BeforeTest
Background: Define URL 
	Given url udemyUrl
	* def createTokenResponse = call read('classpath:helpers/CreateTokenConfigVariables.feature')
	* def token =  createTokenResponse.token
	 	
Scenario: Create new article

	#Given header Authorization = 'Token ' + token
	Given path 'articles'
	And request {"article":{"tagList":[],"title":"test","description":"test","body":"test"}}
	When method post
	Then status 200
	And match response.article.title == 'test'
	* def slug = response.article.slug

	#Delete article	 
	#Given header Authorization = 'Token ' + token
	Given path 'articles/' + slug
	When method delete
	Then status 204
	
  #Get deleted article	
	#Given header Authorization = 'Token ' + token
	Given params { limit:10, offset:0 }
	Given path 'articles/' 
	When method get
	Then status 200
	And match response.articles[0].title != 'test'

Feature: Create token

Scenario:
	Given url 'https://api.realworld.io/api/'
	Given path 'users/login'
	And request {"user":{"email":"sriramkukkadapu@gmail.com","password":"sriramk1"}}
	When method post
	Then status 200
	* def token = response.user.token
	
		
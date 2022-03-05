Feature: Create token

Scenario:
	* def body = 
	"""
	{"user":{"email":"#(email)","password":"#(password)"}}
	"""
	* print body
	* print body
	Given url 'https://api.realworld.io/api/'
	Given path 'users/login'
	And request body
	#And request {"user":{"email":"sriramkukkadapu@gmail.com","password":"sriramk2"}}
	#And request {"user":{"email":"#{email}","password":"#{password}"}}
	When method post
	Then status 200
	* def token = response.user.token	
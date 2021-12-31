Feature: POST API Feature

Background:
	* url 'https://gorest.co.in'
	* def body =  
	"""{
            "name": "Sriram K",
            "email": "sriramkukkadapu@gmail.com",
            "gender": "male",
            "status": "active"
					}""" 
					
Scenario: Create user with given data
Given path '/public/v1/users'
And request body
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 422
And match $.data.id == "#present"
And match $.data.email == "sriramkukkadapu@gmail.com"



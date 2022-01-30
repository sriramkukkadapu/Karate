Feature: PUT API Feature

Background:
	* url 'https://gorest.co.in'
	* def body =  
	"""{

            "status": "inactive",
            "email" : "test94@gmail.com"
					}""" 
					
Scenario: Create user with given data
Given path '/public/v1/users/2613'
And request body
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200
And match $.data.id == "#present"
And match $.data.name == "#present"
And match $.data.name == "Sriram K"
And match $.data.email == "test94@gmail.com"



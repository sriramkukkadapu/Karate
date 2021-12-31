Feature: GET API Feature

Scenario: GET user details
* print tokenID
Given header Authorization = 'Bearer ' + tokenID 
And header connection = 'keep-alive'
When url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
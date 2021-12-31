Feature: GET API Feature

Scenario: GET user details
Given url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print baseUrl+'/public/v1/users'
* print response
* def res = response
* print res
* def actName = res.data.name
* def actId = res.data.id
* def actEmail = res.data.email
* print actName
* match actName == 'Bilwa Kaul II'
* match actId == 30
* match actEmail == 'ii_bilwa_kaul@harvey.info'

Scenario: GET user details - User not found
Given url 'https://gorest.co.in/public/v1/users'
And path '0'
When method GET
Then status 404
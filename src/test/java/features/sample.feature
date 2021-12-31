Feature: JSON feature testing

# ============ Scenario 1 ==============
Scenario: JSON reader parser 
	
* def jsonObject = 
"""
[
{
	"name" : "sriram",
	"city" : "kakinada",
	"age"  : 32
},
{
	"name" : "manju",
	"city" : "bangalore",
	"age"  : 32
}
]
"""
* print jsonObject
* print jsonObject[0]
* print jsonObject[0].name + " " + jsonObject[0].city + " " + jsonObject[0].age


# ============ Scenario 2 ==============
Scenario: Complex JSON reader

* def jsonObject = 
"""
{
"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}
"""

* print jsonObject
* print jsonObject.menu
* print jsonObject.menu.id
* print jsonObject.menu.popup
* print jsonObject.menu.popup.menuitem
* print jsonObject.menu.popup.menuitem[0]
* print jsonObject.menu.popup.menuitem[0].onclick;
# Flutter Assignments
2106657815 Raizaz Achmad Asyraf

## Assignment 7: Flutter Basic Elements

### Explain what is meant by stateless widget and stateful widget and explain the difference between them.
If a widget can change it is a stateful widget. It works dynamicly. It appearances are dependent to the events by user interactions. Such as Checkbox, Radio, etc. While stateless widget never changes (static). Icon, and Text are couple of examples of stateless widgets.

### Mention what widgets you use in this project and explain their functions.
Text, to show string. Icon, to display icons. 

### What is the function of setState()? Explain what variables can be affected by the function.
setState() function applies the changes from variables to the UI. If setState() not called, it only changes the variable's value.

Basically any variable that can change the value, can be affected by the function (int, bool, etc).

### Explain the difference between const and final.
const means its initial value is fixed, and cannot be dynamic. While final means its initial value is fixed, but can be dynamic.

### Explain how you implement the checklist above.
Decrement: reduce counter and setState if counter not zero using if and counter--.
Even/Odd: use ternary operator to condition.
Icon: use row class to align horizontaly and visibility to hide if counter is 0.

## Assignment 8: Flutter Form

### Explain the difference between Navigator.push and Navigator.pushReplacement.
Navigator.push, pushes the page in to the stack. While, Navigator.pushReplacement pushes the page and also pop the page before out of the stack.

### List all the widgets you used in this project and explain their functions.
Widgets that I felt are the most usable in this project:
- Text: Used for diplaying string
- Padding: Used for spaces between the edge and element
- Drawer: Used to make a drawer for accesibility to other pages
- Form: Used to take input and save it into a model
- Card: Used to display info on a card format.

### Name the types of events that exist in Flutter (example: onPressed).
- onPressed: Events when a button is pressed
- onChanged: Events when there is a change on something
- onTap: Events when a field is tapped
- onSaved: Events when data is saved

### Explain how the Navigator works in "switching" pages of a Flutter application.
It is simmilar to the concept of stack and is called navigator. When a page is pushed to the navigator (Navigator.push), it will be push to the front of navigator and it will be on top of the previous page. Thus the page switched.

### Explain how you implement the checklist above.
- Drawer: I used the Drawer widget to make the drawer. And have a route to other pages in it. After that I put it into an external .dart file as a class file. And I can call it to all of the pages without rewriting it on every pages.
- Navigation Button: On the drawer I put navigation button as a button to route to other pages. I used onTap events to initiate the Navigator.pushReplacement
- Form Page: With form key and the appropriate variables. Also with the model class. Then I have an input that can take it according to the model and put it into a list.
- Data Page: Import the list of created data from form page. And then, I display it with Card Widget.

## Assignment 9: Flutter Web Service Integration

### Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?
You can retrieve JSON data without model with the jsonDecode() function from dart:convert. But it will take a longer time to parse the JSON data rather than just have a model. Therefore it is better to create a model first before retrieving the data.

### List the widgets that you used in this project and explain their functions.
Widgets that I felt are the most usable in this project:
- FutureBuilder: A widget that can build from future classes.
- GestureDetector: Widget that can detect gesture. I used this with onTap function to go to next page with Navigator.push

###  Explain the mechanism of retrieving data from json so it can be shown in Flutter.
Fetch JSON file async-ly from the web with flutter get http function with class Future. Then in the show page, use FutureBuilder to iterate the list that contains Future variables, and show accordingly. 

### Explain how you implement the checklist above.
- Navigation/Drawer: I add mywatchlist page to the drawer widget.
- Model: By using quicktype, I was able to transform the JSON data into a model class that is acceptable to .dart file.
- Fetch: Fetch async-ly using the parse JSON and http get from flutter. Then, list the JSON file.
- Navigate to details: By using GestureDetector widget and onTap function, I was able to navigate it to the detail page.
- Detail page: I used row and text widget to display the detail of individual watchlist.
- Back button: With function onPressed and Navigator.pop, I was able to implement a back feature.
- For the bonus, I tried but it is still buggy and not work with the checklist.

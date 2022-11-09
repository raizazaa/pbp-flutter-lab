# Assignment 7: Flutter Basic Elements

## Explain what is meant by stateless widget and stateful widget and explain the difference between them.
If a widget can change it is a stateful widget. It works dynamicly. It appearances are dependent to the events by user interactions. Such as Checkbox, Radio, etc. While stateless widget never changes (static). Icon, and Text are couple of examples of stateless widgets.

## Mention what widgets you use in this project and explain their functions.
Text, to show string. Icon, to display icons. 

## What is the function of setState()? Explain what variables can be affected by the function.
setState() function applies the changes from variables to the UI. If setState() not called, it only changes the variable's value.

Basically any variable that can change the value, can be affected by the function (int, bool, etc).

## Explain the difference between const and final.
const means its initial value is fixed, and cannot be dynamic. While final means its initial value is fixed, but can be dynamic.

## Explain how you implement the checklist above.
Decrement: reduce counter and setState if counter not zero using if and counter--.
Even/Odd: use ternary operator to condition.
Icon: use row class to align horizontaly and visibility to hide if counter is 0.
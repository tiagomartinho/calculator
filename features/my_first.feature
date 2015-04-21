Feature: Assignment 1 

Scenario: Adding two numbers 
  When I touch the "1" button
  And I touch the "+" button
  And I touch the "2" button
  And I touch the "Enter" button
  Then I see the text "3.0"

Scenario: Insert floating point number of type x.y 
  When I touch the "1" button
  And I touch the "." button
  And I touch the "2" button
  Then I see the text "1.2"
  And I touch the "." button
  Then I see the text "1.2"

Scenario: Insert floating point number of type 0.x 
  When I touch the "." button
  And I touch the "5" button
  Then I see the text "0.5"
  And I touch the "." button
  Then I see the text "0.5"

Scenario: Multiplying two floating point number of type x.y and 0.x 
  When I touch the "1" button
  And I touch the "." button
  And I touch the "2" button
  Then I see the text "1.2"
  And I touch the "." button
  Then I see the text "1.2"
  And I touch the "*" button
  When I touch the "." button
  And I touch the "5" button
  Then I see the text "0.5"
  And I touch the "." button
  Then I see the text "0.5"
  And I touch the "Enter" button
  Then I see the text "0.6"

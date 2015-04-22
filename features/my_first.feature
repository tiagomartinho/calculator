Feature: Assignment 1 

Scenario: Adding two numbers 
  When I touch the "1" button
  And I touch the "+" button
  And I touch the "2" button
  And I touch the "Enter" button
  Then I see the text "3.0"
  Then I read "1+2="

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
  Then I read "1.2*.5="

Scenario: Calculation of the sine
  When I touch the "sin" button
  And I touch the "4" button
  And I touch the "2" button
  And I touch the "Enter" button
  Then I read "-0.916521547"
  Then I read "sin42"

Scenario: Calculation of the cosine
  When I touch the "cos" button
  And I touch the "4" button
  And I touch the "2" button
  And I touch the "Enter" button
  Then I read "-0.399985314"
  Then I read "cos42"

Scenario: Calculation of PI 
  When I touch the "π" button
  And I touch the "3" button
  And I touch the "Enter" button
  Then I read "9.424777960"
  Then I read "π3="
 
Scenario: Calculation of PI inverted
  When I touch the "3" button
  And I touch the "π" button
  And I touch the "Enter" button
  Then I read "9.424777960"
  Then I read "3π="

Scenario: Clear button clears interface 
  When I touch the "1" button
  And I touch the "+" button
  And I touch the "2" button
  And I touch the "Enter" button
  Then I see the text "3.0"
  Then I read "1+2="
  Then I touch "C"
  Then I see the text "0.0"
  Then I don't read "1+2="

Scenario: Backspace button clears number inserted
  When I touch the "1" button
  And I touch the "2" button
  And I touch the "3" button
  Then I see the text "123"
  Then I touch the "Backspace" button
  Then I see the text "12"
  Then I touch the "Backspace" button
  Then I touch the "Backspace" button
  Then I see the text "0.0"
  Then I don't read "12"
  Then I don't read "123"

Scenario: Invert sign operation
  When I touch the "5" button
  And I touch the "Invert sign" button
  When I touch the "/" button
  When I touch the "2" button
  And I touch the "Enter" button
  Then I see the text "-2.5"
  Then I read "5+/-/2="

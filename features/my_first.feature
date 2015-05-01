Feature: Assignment 1 

Scenario: Testing all assignemnt 1 requirements 
#Scenario: Adding two numbers 
  When I click the "Enter" button
  Then I don't read "="
  When I click the "1" button
  And I click the "+" button
  And I click the "2" button
  And I click the "Enter" button
  Then I have "3.0"
  Then I read "1+2="
  And I click the "Enter" button
  Then I don't read "1+2=="
  And I click the "Enter" button
  Then I don't read "3.0"

  Then I click "C"
#Scenario: Insert floating point number of type x.y 
  When I click the "1" button
  And I click the "." button
  And I click the "2" button
  Then I have "1.2"
  And I click the "." button
  Then I have "1.2"

  Then I click "C"
#Scenario: Insert floating point number of type 0.x 
  When I click the "." button
  And I click the "5" button
  Then I have "0.5"
  And I click the "." button
  Then I have "0.5"

  Then I click "C"
#Scenario: Clear button clears interface 
  When I click the "1" button
  And I click the "+" button
  And I click the "2" button
  And I click the "Enter" button
  Then I have "3.0"
  Then I read "1+2="
  Then I click "C"
  Then I have "0"
  Then I don't read "1+2="
  When I click the "1" button
  And I click the "." button
  And I click the "2" button
  Then I have "1.2"
  Then I click "C"
  Then I have "0"
  Then I don't read "1.2"

  Then I click "C"
#Scenario: Multiplying two floating point number of type x.y and 0.x 
  When I click the "1" button
  And I click the "." button
  And I click the "2" button
  Then I have "1.2"
  And I click the "." button
  Then I have "1.2"
  And I click the "*" button
  When I click the "." button
  And I click the "5" button
  Then I have "0.5"
  And I click the "." button
  Then I have "0.5"
  And I click the "Enter" button
  Then I have "0.6"
  Then I read "1.2*.5="

  Then I click "C"
#Scenario: Calculation of the sine
  When I click the "sin" button
  And I click the "4" button
  And I click the "2" button
  And I click the "Enter" button
  Then I read "-0.91652"
  Then I read "sin42"

  Then I click "C"
#Scenario: Calculation of the cosine
  When I click the "cos" button
  And I click the "4" button
  And I click the "2" button
  And I click the "Enter" button
  Then I read "-0.39998"
  Then I read "cos42"

  Then I click "C"
#Scenario: Calculation of PI 
  When I click the "π" button
  And I click the "3" button
  And I click the "Enter" button
  Then I read "9.4247"
  Then I read "π3="
 
  Then I click "C"
#Scenario: Calculation of PI inverted
  When I click the "3" button
  And I click the "π" button
  And I click the "Enter" button
  Then I read "9.4247"
  Then I read "3π="


  Then I click "C"
#Scenario: Backspace button clears number inserted
  When I click the "1" button
  And I click the "2" button
  And I click the "3" button
  Then I have "123"
  Then I click the "Backspace" button
  Then I have "12"
  Then I click the "Backspace" button
  Then I click the "Backspace" button
  Then I have "0"
  Then I don't read "12"
  Then I don't read "123"

  Then I click "C"
#Scenario: Invert sign operation on first operand
  When I click the "5" button
  And I click the "Invert sign" button
  When I click the "/" button
  When I click the "2" button
  And I click the "Enter" button
  Then I have "-2.5"
  Then I read "5+/-/2="

  Then I click "C"
#Scenario: Invert sign operation on second operand
  When I click the "5" button
  When I click the "-" button
  When I click the "2" button
  And I click the "Invert sign" button
  And I click the "Enter" button
  Then I have "7.0"
  Then I read "5-2+/-="

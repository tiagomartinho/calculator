//
//  ViewController.swift
//  Calculator
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var history: UILabel!
    @IBOutlet weak var display: UILabel!
    
    var userInMiddleOfTypingNumber:Bool = false
    var clearHistory:Bool = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        if let digit = sender.currentTitle{
            display.text = (userInMiddleOfTypingNumber ? display.text!+digit : digit)
            userInMiddleOfTypingNumber=true
            
            if clearHistory {
                historyValue = digit
                clearHistory=false
            }
            else {
                historyValue += digit
            }
            
        }
    }
    
    @IBAction func appendFloatingPoint() {
        if !userInMiddleOfTypingNumber {
            display.text = "0."
            userInMiddleOfTypingNumber=true
            
            if clearHistory {
                historyValue = "."
                clearHistory=false
            }
            else {
                historyValue += "."
            }
        }
        else {
            if display.text!.rangeOfString(".")==nil{
                display.text=display.text!+"."
                userInMiddleOfTypingNumber=true
                
                if clearHistory {
                    historyValue = "."
                    clearHistory=false
                }
                else {
                    historyValue += "."
                }
            }
        }
    }
    
    @IBAction func undoDigit() {
        if var displayString = display.text, var historyString = history.text{
            if(count(displayString)==1)
            {
                displayString="0.0"
                historyString=""
                userInMiddleOfTypingNumber=false
            }
            else{
                displayString=dropLast(displayString)
                historyString=dropLast(historyString)
            }
            display.text=displayString
            history.text=historyString
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        displayValue=0
        historyValue = ""
        brain.clearOpStack()
    }
    
    @IBAction func enter() {
        if(userInMiddleOfTypingNumber){
            userInMiddleOfTypingNumber=false
            brain.pushOperand(displayValue)
        }
        if let result=brain.evaluate(){
            displayValue=result
            historyValue += "="
            clearHistory = true
        }
        else{
            display.text = "Error"
            brain.clearOpStack()
            clearHistory = true
        }
    }
    
    @IBAction func posOperation(sender: UIButton) {
        if let operation=sender.currentTitle{
            brain.pushOperand(displayValue)
            brain.pushOperation(operation)
            displayValue=0
            
            if clearHistory {
                historyValue = operation
                clearHistory=false
            }
            else {
                historyValue += operation
            }
        }
    }
    
    @IBAction func preOperation(sender: UIButton) {
        if let operation=sender.currentTitle{
            brain.pushOperation(operation)
            
            if clearHistory {
                historyValue = operation
                clearHistory=false
            }
            else {
                historyValue += operation
            }
        }
    }
    
    var displayValue:Double{
        get{
            return display.text!.doubleValue
        }
        set{
            display.text="\(newValue)"
            userInMiddleOfTypingNumber=false
        }
    }
    
    var historyValue:String{
        get{
            if let text = history.text {
                return text
            }
            else{
                return ""
            }
        }
        set{
            history.text=newValue
            history.accessibilityValue=newValue
        }
    }
}

extension String {
    var doubleValue: Double {
        var formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        return formatter.numberFromString(self)!.doubleValue
    }
}


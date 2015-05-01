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
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        if let digit = sender.currentTitle{
            display.text = (userInMiddleOfTypingNumber ? display.text!+digit : digit)
            userInMiddleOfTypingNumber=true
            
            historyValue = (historyValue ?? "") + digit
        }
    }
    
    @IBAction func appendFloatingPoint() {
        if display.text!.rangeOfString(".")==nil{
            display.text=display.text!+"."
            historyValue = (historyValue ?? "") + "."
            userInMiddleOfTypingNumber=true
        }
    }
    
    @IBAction func undoDigit() {
        if var displayString = display.text, var historyString = historyValue{
            if(count(displayString)==1)
            {
                displayValue=0
                historyString=""
                userInMiddleOfTypingNumber=false
            }
            else{
                displayString=dropLast(displayString)
                historyString=dropLast(historyString)
            }
            display.text=displayString
            historyValue=historyString
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
            if let value = displayValue {
                brain.pushOperand(value)
            }
        }
        if let result=brain.evaluate(){
            displayValue=result
            historyValue = (historyValue ?? "") + "="
        }
        else{
            display.text = "Error"
            brain.clearOpStack()
        }
    }
    
    @IBAction func posOperation(sender: UIButton) {
        if let operation=sender.currentTitle{
            if let value = displayValue {
                brain.pushOperand(value)
            }
            brain.pushOperation(operation)
            displayValue=0
            
            historyValue = (historyValue ?? "") + operation
        }
    }
    
    @IBAction func preOperation(sender: UIButton) {
        if let operation=sender.currentTitle{
            brain.pushOperation(operation)
            
            historyValue = (historyValue ?? "") + operation
        }
    }
    
    var displayValue:Double?{
        get{
            return display.text?.doubleValue
        }
        set{
            if newValue == nil {
                display.text=""
            }
            else{
                if(newValue == 0.0){
                    display.text="0"
                }
                else{
                    display.text="\(newValue!)"
                }
            }
            userInMiddleOfTypingNumber=false
        }
    }
    
    var historyValue:String?{
        get{
            return history.text
        }
        set{
            if history.text?.rangeOfString("=") != nil || newValue == "" || history.text==nil{
                history.text = ""
            }
            
            history.text = (newValue ?? "")
        }
    }
}

extension String {
    var doubleValue: Double? {
        var formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        return formatter.numberFromString(self)?.doubleValue
    }
}
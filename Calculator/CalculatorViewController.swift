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
        }
    }
    
    @IBAction func appendFloatingPoint() {
        if display.text!.rangeOfString(".")==nil{
            display.text=display.text!+"."
            userInMiddleOfTypingNumber=true
        }
    }
    
    @IBAction func undoDigit() {
        if var displayString = display.text{
            if(count(displayString)==1)
            {
                displayString="0"
                userInMiddleOfTypingNumber=false
            }
            else{
                displayString=dropLast(displayString)
            }
            display.text=displayString
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        displayValue=0
        brain.clearOpStack()
    }
    
    @IBAction func enter() {
        if(userInMiddleOfTypingNumber){
            userInMiddleOfTypingNumber=false
            brain.pushOperand(displayValue)
            if let result=brain.evaluate(){
                displayValue=result}
            else{
                displayValue=0.0
            }
        }
    }
    
    @IBAction func posOperation(sender: UIButton) {
        if let operation=sender.currentTitle{
            brain.pushOperand(displayValue)
            brain.pushOperation(operation)
            displayValue=0
        }
    }
    
    @IBAction func preOperation(sender: UIButton) {
        if let operation=sender.currentTitle{
            brain.pushOperation(operation)
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
}

extension String {
    var doubleValue: Double {
        var formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        return formatter.numberFromString(self)!.doubleValue
    }
}


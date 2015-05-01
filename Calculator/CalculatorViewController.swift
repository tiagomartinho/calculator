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
    
    var brain = CalculatorBrain()
    
    var userIsTypingNumber:Bool = false
    
    // MARK: Add Digits, Floating Points and Operations Methods
    
    @IBAction func appendDigit(sender: UIButton) {
        if let digit = sender.currentTitle{
            display.text = (userIsTypingNumber ? display.text!+digit : digit)
            userIsTypingNumber=true
        }
    }
    
    @IBAction func appendFloatingPoint() {
        if display.text!.rangeOfString(".")==nil{
            display.text=display.text!+"."
            userIsTypingNumber=true
            historyValue = (historyValue ?? "") + "."
        }
    }
    
    @IBAction func posOperation(sender: UIButton) {
        pushOperand()
        pushOperation(sender)
    }
    
    @IBAction func preOperation(sender: UIButton) {
        pushOperation(sender)
    }
    
    func pushOperand(){
        if let value = displayValue {
            brain.pushOperand(value)
            displayValue=0
        }
    }
    
    func pushOperation(sender: UIButton){
        if let operation=sender.currentTitle{
            brain.pushOperation(operation)
        }
    }
    
    // MARK: Enter Method
    
    @IBAction func enter() {
        pushOperand()

        if let result=brain.evaluate(){
            displayValue=result
            addEqualSign()
        }
        else{
            display.text = "Error"
        }
        
        brain.clearOpStack()
    }
    
    func addEqualSign(){
        if count(historyValue ?? "")>1 {
            historyValue = (historyValue ?? "") + "="
        }
    }
    
    // MARK: Clear Methods
    
    @IBAction func undoDigit() {
        if let displayString = display.text, let historyString = historyValue{
            if(count(displayString)==1)
            {
                clearDisplayAndHistory()
            }
            else{
                display.text=dropLast(displayString)
                historyValue=dropLast(historyString)
            }
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        clearDisplayAndHistory()
        brain.clearOpStack()
    }
    
    func clearDisplayAndHistory(){
        displayValue=0
        userIsTypingNumber=false
        historyValue = ""
    }
    
    // MARK: Computed Properties
    
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
            userIsTypingNumber=false
        }
    }
    
    
    @IBAction func addToHistory(sender: UIButton) {
        if let op = sender.currentTitle{
            historyValue = (historyValue ?? "") + op
        }
    }
    
    var historyValue:String?{
        get{
            return history.text
        }
        set{
            if history.text?.rangeOfString("=") != nil{
                history.text = ""
                displayValue = 0
            } else{
                history.text = (newValue ?? "")
            }
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
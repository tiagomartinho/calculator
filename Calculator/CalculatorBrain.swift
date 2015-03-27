//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    init()
    {
        knownOps = CalculatorOperations().learnOperations()
    }
    
    func pushOperand(operand:Double){
        opStack.append(Op.Operand(operand))
    }
    
    func pushOperation(symbol:String){
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
    
    func evaluate()->Double?{
        
        filterOpStack()
        
        var expression=""
        while(!opStack.isEmpty){
            let op = opStack.removeAtIndex(0)
            expression+=op.description
        }
        
        let expn = NSExpression(format:expression)
        
        clearOpStack()
        
        var result:Double?
        
        result=Double(expn.expressionValueWithObject(nil, context: nil) as NSNumber)
        
        return result
    }
    
    func clearOpStack(){
        opStack = [Op]()
    }
    
    func filterOpStack(){
        var newOpStack = [Op]()
        while(!opStack.isEmpty){
            let op = opStack.removeAtIndex(0)
            switch op{
            case .Constant(_,let constant):
                if let previous = newOpStack.last{
                    if let value = getValue(previous){
                        newOpStack.removeLast()
                        newOpStack.append(Op.Operand(constant*value))
                    }
                }
                else{
                    if let following = opStack.first {
                        if let value = getValue(following){
                            opStack.removeAtIndex(0)
                            newOpStack.append(Op.Operand(constant*value))
                        }
                    }
                    else{
                        newOpStack.append(Op.Operand(constant))
                    }
                }
            case .UnaryPreOperation(_,let operation):
                if let following = opStack.first {
                    if let value = getValue(following){
                        opStack.removeAtIndex(0)
                        newOpStack.append(Op.Operand(operation(value)))
                    }
                }
            case .UnaryPosOperation(_,let operation):
                if let previous = newOpStack.last{
                    if let value = getValue(previous){
                        newOpStack.removeLast()
                        newOpStack.append(Op.Operand(operation(value)))
                    }
                }
            default:
                newOpStack.append(op)
            }
        }
        opStack=newOpStack
    }
    
    private func getValue(operation:Op)->Double?{
        switch operation{
        case .Operand(let operand):
            return operand
        case .Constant(_,let constant):
            return constant
        default:
            return nil
        }
    }
}
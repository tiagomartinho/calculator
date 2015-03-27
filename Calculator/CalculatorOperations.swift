//
//  CalculatorOperations.swift
//  Calculator
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import Foundation

class CalculatorOperations{
    
    private var knownOps = [String:Op]()
    
    func learnOperations()->[String:Op]{
        knownOps = [String:Op]()
        learnConstantOp()
        learnUnaryPreOp()
        learnUnaryPosOp()
        learnBinaryOp()
        return knownOps
    }
    
    private func learnOp(op:Op){
        knownOps[op.description]=op
    }
    
    private func learnConstantOp(){
        learnOp(Op.Constant("π",M_PI))
        learnOp(Op.Constant("e",M_E))
    }
    
    private func learnUnaryPreOp(){
        learnOp(Op.UnaryPreOperation("√",sqrt))
        learnOp(Op.UnaryPreOperation("abs",abs))
        learnOp(Op.UnaryPreOperation("sin",sin))
        learnOp(Op.UnaryPreOperation("cos",cos))
        learnOp(Op.UnaryPreOperation("+/-",{-1*$0}))
    }
    
    private func learnUnaryPosOp(){
        learnOp(Op.UnaryPosOperation("^2",{$0*$0}))
        learnOp(Op.UnaryPosOperation("^-1",{1/$0}))
    }
    
    private func learnBinaryOp(){
        learnOp(Op.BinaryOperation("*",*))
        learnOp(Op.BinaryOperation("/",{$1/$0}))
        learnOp(Op.BinaryOperation("-",{$1-$0}))
        learnOp(Op.BinaryOperation("+",+))
    }
}
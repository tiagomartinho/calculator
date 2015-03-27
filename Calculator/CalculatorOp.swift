//
//  CalculatorOp.swift
//  Calculator
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import Foundation

enum Op: Printable{
    case Operand(Double)
    case Constant(String,Double)
    case UnaryPreOperation(String,Double->Double)
    case UnaryPosOperation(String,Double->Double)
    case BinaryOperation(String,(Double,Double)->Double)
    
    var description:String{
        get{
            switch self{
            case .Operand(let operand):
                return "\(operand)"
            case .Constant(let symbol,_):
                return symbol
            case .UnaryPreOperation(let symbol,_):
                return symbol
            case .UnaryPosOperation(let symbol,_):
                return symbol
            case .BinaryOperation(let symbol,_):
                return symbol
            }
        }
    }
}
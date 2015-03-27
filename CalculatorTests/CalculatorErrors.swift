//
//  CalculatorErrors.swift
//  Calculator
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import UIKit
import XCTest

class CalculatorErrors: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testEmpty(){
        XCTAssertNil(calculatorBrain!.evaluate())
    }
    
    func testOneUnaryOperation(){
        calculatorBrain!.pushOperation("^2")
        XCTAssertNil(calculatorBrain!.evaluate())
    }
    
    func testTwoOperands(){
        calculatorBrain!.pushOperand(8)
        calculatorBrain!.pushOperand(7)
        XCTAssertNil(calculatorBrain!.evaluate())
    }
    
    func testOneOperandAndBinaryOperation(){
        calculatorBrain!.pushOperand(8)
        calculatorBrain!.pushOperation("+")
        XCTAssertNil(calculatorBrain!.evaluate())
    }
}
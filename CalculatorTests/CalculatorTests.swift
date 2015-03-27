//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import UIKit
import XCTest

class CalculatorTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOneOperand(){
        calculatorBrain!.pushOperand(5)
        XCTAssertEqual(5.0, calculatorBrain!.evaluate()!)
        calculatorBrain!.pushOperand(3)
        XCTAssertEqual(3.0, calculatorBrain!.evaluate()!)
    }
    
    func testOneConstant(){
        calculatorBrain!.pushOperation("π")
        XCTAssertEqualWithAccuracy(M_PI, calculatorBrain!.evaluate()!, 0.001)
        calculatorBrain!.pushOperation("e")
        XCTAssertEqualWithAccuracy(M_E, calculatorBrain!.evaluate()!, 0.001)
    }
    
    func testTwoConstant(){
        calculatorBrain!.pushOperation("e")
        calculatorBrain!.pushOperation("π")
        XCTAssertEqualWithAccuracy(M_E*M_PI, calculatorBrain!.evaluate()!, 0.001)
    }
    
    func testOneConstantWithOneOperand(){
        calculatorBrain!.pushOperand(3)
        calculatorBrain!.pushOperation("π")
        XCTAssertEqualWithAccuracy(3*M_PI, calculatorBrain!.evaluate()!, 0.001)
        calculatorBrain!.pushOperation("e")
        calculatorBrain!.pushOperand(5)
        XCTAssertEqualWithAccuracy(M_E*5, calculatorBrain!.evaluate()!, 0.001)
    }
    
    func testOneOperandWithUnaryOperation(){
        calculatorBrain!.pushOperand(2)
        calculatorBrain!.pushOperation("^2")
        XCTAssertEqual(4.0, calculatorBrain!.evaluate()!)
        calculatorBrain!.pushOperation("√")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(2.0, calculatorBrain!.evaluate()!)
    }
    
    func testTwoOperandsWithBinaryOperation(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(2)
        XCTAssertEqual(3.0, calculatorBrain!.evaluate()!)
        
        calculatorBrain!.pushOperand(3)
        calculatorBrain!.pushOperation("*")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(12.0, calculatorBrain!.evaluate()!)
    }
    
    func testSumOfTwoOperandsPlusMultiplication(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(2)
        calculatorBrain!.pushOperation("*")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(9.0, calculatorBrain!.evaluate()!)
    }
    
    func testMultiplicationOfTwoOperandsPlusSum(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("*")
        calculatorBrain!.pushOperand(2)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(6.0, calculatorBrain!.evaluate()!)
    }
}
//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Tiago Martinho on 27/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testOneOperand(){
        calculatorBrain!.pushOperand(5)
        XCTAssertEqual(5.0, calculatorBrain!.evaluate()!)
        calculatorBrain!.pushOperand(3)
        XCTAssertEqual(3.0, calculatorBrain!.evaluate()!)
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
    
    func testPreUnaryFollowByBinaryOperation(){
        calculatorBrain!.pushOperation("√")
        calculatorBrain!.pushOperand(4)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(6.0, calculatorBrain!.evaluate()!)
    }
    
    func testBinaryOperationFollowByPreUnary(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperation("√")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(3.0, calculatorBrain!.evaluate()!)
    }
    
    func testPosUnaryFollowByBinaryOperation(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("^2")
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(4)
        XCTAssertEqual(5.0, calculatorBrain!.evaluate()!)
    }
    
    func testBinaryOperationFollowByPosUnary(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(4)
        calculatorBrain!.pushOperation("^2")
        XCTAssertEqual(17.0, calculatorBrain!.evaluate()!)
    }
    
    func testMultipleOperations(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(2)
        calculatorBrain!.pushOperation("*")
        calculatorBrain!.pushOperand(4)
        calculatorBrain!.pushOperation("/")
        calculatorBrain!.pushOperand(8)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(5)
        XCTAssertEqual(7.0, calculatorBrain!.evaluate()!)
    }
}
import UIKit
import XCTest

class CalculatorErrorsTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testEmpty(){
        XCTAssertNil(calculatorBrain?.evaluate())
    }
    
    func testOneUnaryOperation(){
        calculatorBrain!.pushOperation("^2")
        XCTAssertNil(calculatorBrain?.evaluate())
    }
    
    func testTwoOperands(){
        calculatorBrain!.pushOperand(8)
        calculatorBrain!.pushOperand(7)
        XCTAssertNil(calculatorBrain?.evaluate())
    }
    
    func testOneOperandAndBinaryOperation(){
        calculatorBrain!.pushOperand(8)
        calculatorBrain!.pushOperation("+")
        XCTAssertNil(calculatorBrain?.evaluate())
    }
}
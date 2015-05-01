import XCTest

class CalculatorOperationTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testOneOperand(){
        calculatorBrain!.pushOperand(5)
        calculatorBrain?.assertItEvaluatesTo(5.0)
    }

    func testOneOperandWithPosUnaryOperation(){
        calculatorBrain!.pushOperand(2)
        calculatorBrain!.pushOperation("^2")
        calculatorBrain?.assertItEvaluatesTo(4.0)
    }
    
    func testOneOperandWithPreUnaryOperation(){
        calculatorBrain!.pushOperation("√")
        calculatorBrain!.pushOperand(4)
        calculatorBrain?.assertItEvaluatesTo(2.0)
    }
    
    func testTwoOperandsWithBinaryOperation(){
        calculatorBrain!.pushOperand(1)
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(2)
        XCTAssertEqual(3.0, calculatorBrain!.evaluate()!)
        
        calculatorBrain!.clearOpStack()

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
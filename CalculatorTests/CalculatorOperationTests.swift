import XCTest

class CalculatorOperationTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testOneOperand(){
        calculatorBrain?.pushOperand(5)
        calculatorBrain?.assertItEvaluatesTo(5.0)
    }

    func testOneOperandWithPosUnaryOperation(){
        calculatorBrain?.pushOperand(2)
        calculatorBrain?.pushOperation("^2")
        calculatorBrain?.assertItEvaluatesTo(4.0)
    }
    
    func testOneOperandWithPreUnaryOperation(){
        calculatorBrain?.pushOperation("√")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.assertItEvaluatesTo(2.0)
    }
    
    func testTwoOperandsWithBinaryOperation(){
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.pushOperation("-")
        calculatorBrain?.pushOperand(2)
        calculatorBrain?.assertItEvaluatesTo(-1.0)
    }
    
    func testMultiplicationOfTwoOperandsPlusSum(){
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.pushOperation("*")
        calculatorBrain?.pushOperand(2)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.assertItEvaluatesTo(6.0)
    }
    
    func testPreUnaryFollowByBinaryOperation(){
        calculatorBrain?.pushOperation("√")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.assertItEvaluatesTo(6.0)
    }
    
    func testBinaryOperationFollowByPreUnary(){
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperation("√")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.assertItEvaluatesTo(3.0)
    }
    
    func testPosUnaryFollowByBinaryOperation(){
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.pushOperation("^2")
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.assertItEvaluatesTo(5.0)
    }
    
    func testBinaryOperationFollowByPosUnary(){
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.pushOperation("^2")
        calculatorBrain?.assertItEvaluatesTo(17.0)
    }
    
    func testMultipleOperations(){
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(2)
        calculatorBrain?.pushOperation("*")
        calculatorBrain?.pushOperand(4)
        calculatorBrain?.pushOperation("/")
        calculatorBrain?.pushOperand(8)
        calculatorBrain?.pushOperation("-")
        calculatorBrain?.pushOperand(1)
        calculatorBrain?.assertItEvaluatesTo(1.0)
    }
    
    func testInvertSignOperation(){
        calculatorBrain?.pushOperand(5)
        calculatorBrain?.pushOperation("/")
        calculatorBrain?.pushOperation("+/-")
        calculatorBrain?.pushOperand(2)
        calculatorBrain?.assertItEvaluatesTo(-2.5)
    }
}
import XCTest

class CalculatorAPITests: XCTestCase {

    var calculatorBrain:CalculatorBrain?

    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }

    func testPushVariableWithoutValue() {
        calculatorBrain?.pushOperand("x")
        XCTAssertNil(calculatorBrain!.evaluate())
    }
    
    func testPushVariableAndAfterValue() {
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.variableValues["x"] = 35.0
        calculatorBrain?.assertItEvaluatesTo(35.0)
    }
    
    func testPushValueAndAfterVariable() {
        calculatorBrain?.variableValues["x"] = 35.0
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.assertItEvaluatesTo(35.0)
    }
    
    func testOneVariableWithPosUnaryOperation(){
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.variableValues["x"] = 35.0
        calculatorBrain?.pushOperation("^2")
        calculatorBrain?.assertItEvaluatesTo(1225.0)
    }
    
    func testOneVariableWithPreUnaryOperation(){
        calculatorBrain?.pushOperation("√")
        calculatorBrain?.variableValues["x"] = 35.0
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.assertItEvaluatesTo(5.916)
    }
    
    func testOneOperandAddVariableWithOneOperand(){
        calculatorBrain?.variableValues["M_E"] = M_E
        calculatorBrain?.pushOperand(3)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(5)
        calculatorBrain?.pushOperand("M_E")
        calculatorBrain?.assertItEvaluatesTo(3+5*M_E)
    }
}

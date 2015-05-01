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
    
    func testOneVariableWithUnaryOperation(){
        calculatorBrain?.variableValues["x"] = 35.0
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.pushOperation("^2")
        calculatorBrain?.assertItEvaluatesTo(1225.0)
    }
}

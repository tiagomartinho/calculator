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
        assertEvaluatesTo(35.0)
    }
    
    func testPushValueAndAfterVariable() {
        calculatorBrain?.variableValues["x"] = 35.0
        calculatorBrain?.pushOperand("x")
        assertEvaluatesTo(35.0)
    }
    
    func assertEvaluatesTo(expectedResult:Double){
        if let result = calculatorBrain?.evaluate() {
            XCTAssertEqual(expectedResult, result)
        }
        else {
            XCTAssertTrue(false)
        }
    }
}

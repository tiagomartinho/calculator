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
    
    func testPushVariableWithValue() {
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.variableValues["x"] = 35.0
        XCTAssertEqual(35.0, calculatorBrain!.evaluate()!)
    }
}

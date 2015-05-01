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
}

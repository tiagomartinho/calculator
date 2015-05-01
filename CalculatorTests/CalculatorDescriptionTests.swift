import XCTest

class CalculatorDescriptionTests: XCTestCase {

    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testFunctionNotationForPreUnaryOperation() {
        calculatorBrain?.pushOperation("cos")
        calculatorBrain?.pushOperand(10.0)
        XCTAssertEqual("cos(10)", calculatorBrain?.description ?? "")
    }
    
    func testFunctionNotationForPosUnaryOperation() {
        calculatorBrain?.pushOperand(2)
        calculatorBrain?.pushOperation("^2")
        XCTAssertEqual("(2)^2", calculatorBrain?.description ?? "")
    }
}

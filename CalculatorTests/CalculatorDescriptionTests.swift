import XCTest

class CalculatorDescriptionTests: XCTestCase {

    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testFunctionNotation() {
        calculatorBrain?.pushOperation("cos")
        calculatorBrain?.pushOperand(10.0)
        XCTAssertEqual("cos(10)", calculatorBrain?.description ?? "")
    }
}

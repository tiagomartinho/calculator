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
        XCTAssertEqual("cos(10.0)", calculatorBrain?.description ?? "")
    }
    
//    func testFunctionNotationForPosUnaryOperation() {
//        calculatorBrain?.pushOperand(2)
//        calculatorBrain?.pushOperation("^2")
//        XCTAssertEqual("(2.0)^2", calculatorBrain?.description ?? "")
//    }
    
    func testBinaryOperation() {
        calculatorBrain?.pushOperand(3.0)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(5.0)
        XCTAssertEqual("3.0+5.0", calculatorBrain?.description ?? "")
    }
    
    func testSingleOperand() {
        calculatorBrain?.pushOperand(23.5)
        XCTAssertEqual("23.5", calculatorBrain?.description ?? "")
    }
    
    func testSingleConstant() {
        calculatorBrain?.pushOperation("π")
        XCTAssertEqual("π", calculatorBrain?.description ?? "")
    }
    
    func testSingleVariable() {
        calculatorBrain?.pushOperand("x")
        calculatorBrain?.variableValues["x"] = 35.0
        XCTAssertEqual("x", calculatorBrain?.description ?? "")
    }
    
    func testMultipleCombination() {
        calculatorBrain?.pushOperation("√")
        calculatorBrain?.pushOperand(10.0)
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(3.0)
        XCTAssertEqual("√(10.0)+3.0", calculatorBrain?.description ?? "")
    }
}

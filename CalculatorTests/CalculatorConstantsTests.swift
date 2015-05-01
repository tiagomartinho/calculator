import XCTest

class CalculatorConstantsTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testOneConstant(){
        calculatorBrain!.pushOperation("π")
        XCTAssertEqualWithAccuracy(M_PI, calculatorBrain!.evaluate()!, 0.001)
        
        calculatorBrain!.clearOpStack()
        
        calculatorBrain!.pushOperation("e")
        XCTAssertEqualWithAccuracy(M_E, calculatorBrain!.evaluate()!, 0.001)
    }
    
//    func testOneConstantWithUnaryOperation(){
//        calculatorBrain!.pushOperation("π")
//        calculatorBrain!.pushOperation("^2")
//        XCTAssertEqualWithAccuracy(M_PI*M_PI, calculatorBrain!.evaluate()!, 0.001)
//    }
    
    func testTwoConstant(){
        calculatorBrain!.pushOperation("e")
        calculatorBrain!.pushOperation("π")
        XCTAssertEqualWithAccuracy(M_E*M_PI, calculatorBrain!.evaluate()!, 0.001)
    }
    
    func testOneConstantWithOneOperand(){
        calculatorBrain!.pushOperand(3)
        calculatorBrain!.pushOperation("π")
        XCTAssertEqualWithAccuracy(3*M_PI, calculatorBrain!.evaluate()!, 0.001)

        calculatorBrain!.clearOpStack()

        calculatorBrain!.pushOperation("e")
        calculatorBrain!.pushOperand(5)
        XCTAssertEqualWithAccuracy(M_E*5, calculatorBrain!.evaluate()!, 0.001)
    }

//    func testOneConstantWithOneOperandAddConstant(){
//        calculatorBrain!.pushOperand(3)
//        calculatorBrain!.pushOperation("π")
//        calculatorBrain!.pushOperation("+")
//        calculatorBrain!.pushOperation("e")
//        XCTAssertEqualWithAccuracy(3*M_PI+M_E, calculatorBrain!.evaluate()!, 0.001)
//    }
    
    func testOneConstantWithOneOperandAddOneOperandAndOneConstant(){
        calculatorBrain!.pushOperand(3)
        calculatorBrain!.pushOperation("π")
        calculatorBrain!.pushOperation("+")
        calculatorBrain!.pushOperand(5)
        calculatorBrain!.pushOperation("e")
        XCTAssertEqualWithAccuracy(3*M_PI+5*M_E, calculatorBrain!.evaluate()!, 0.001)
    }
    
    func testOneConstantWithOneOperandMultipliedByNumber(){
        calculatorBrain!.pushOperand(3)
        calculatorBrain!.pushOperation("π")
        calculatorBrain!.pushOperation("*")
        calculatorBrain!.pushOperand(5)
        XCTAssertEqualWithAccuracy(3*M_PI*5, calculatorBrain!.evaluate()!, 0.001)
    }
}

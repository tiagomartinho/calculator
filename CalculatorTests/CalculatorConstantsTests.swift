import XCTest

class CalculatorConstantsTests: XCTestCase {
    
    var calculatorBrain:CalculatorBrain?
    
    override func setUp() {
        super.setUp()
        calculatorBrain = CalculatorBrain()
    }
    
    func testOneConstant(){
        calculatorBrain?.pushOperation("π")
        calculatorBrain?.assertItEvaluatesTo(M_PI)
    }
    
//    func testOneConstantWithUnaryOperation(){
//        calculatorBrain?.pushOperation("π")
//        calculatorBrain?.pushOperation("^2")
//        XCTAssertEqualWithAccuracy(M_PI*M_PI, calculatorBrain?.evaluate()?, 0.001)
//    }
    
    func testTwoConstant(){
        calculatorBrain?.pushOperation("e")
        calculatorBrain?.pushOperation("π")
        calculatorBrain?.assertItEvaluatesTo(M_E*M_PI)
    }
    
    func testOneConstantWithPreOperand(){
        calculatorBrain?.pushOperand(3)
        calculatorBrain?.pushOperation("π")
        calculatorBrain?.assertItEvaluatesTo(3*M_PI)
    }
    
    func testOneConstantWithPosOperand(){
        calculatorBrain?.pushOperation("e")
        calculatorBrain?.pushOperand(5)
        calculatorBrain?.assertItEvaluatesTo(M_E*5)
    }

//    func testOneConstantWithOneOperandAddConstant(){
//        calculatorBrain?.pushOperand(3)
//        calculatorBrain?.pushOperation("π")
//        calculatorBrain?.pushOperation("+")
//        calculatorBrain?.pushOperation("e")
//        XCTAssertEqualWithAccuracy(3*M_PI+M_E, calculatorBrain?.evaluate()?, 0.001)
//    }
    
    func testOneConstantWithOneOperandAddOneOperandAndOneConstant(){
        calculatorBrain?.pushOperand(3)
        calculatorBrain?.pushOperation("π")
        calculatorBrain?.pushOperation("+")
        calculatorBrain?.pushOperand(5)
        calculatorBrain?.pushOperation("e")
        calculatorBrain?.assertItEvaluatesTo(3*M_PI+5*M_E)
    }
    
    func testOneConstantWithOneOperandMultipliedByNumber(){
        calculatorBrain?.pushOperand(3)
        calculatorBrain?.pushOperation("π")
        calculatorBrain?.pushOperation("*")
        calculatorBrain?.pushOperand(5)
        calculatorBrain?.assertItEvaluatesTo(3*M_PI*5)
    }
}

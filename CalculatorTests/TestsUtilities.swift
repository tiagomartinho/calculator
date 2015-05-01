import XCTest

extension CalculatorBrain {
    func assertItEvaluatesTo(expectedResult:Double){
        if let result = self.evaluate() {
            XCTAssertEqualWithAccuracy(expectedResult, result, 0.001)
        }
        else {
            XCTAssertTrue(false)
        }
    }
}
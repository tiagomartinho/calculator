import Foundation

class CalculatorBrain{
    
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    var variableValues = [String:Double]()
    
    var description:String? {
        return opStackToString(opStack)
    }

    init(){
        knownOps = CalculatorOperations().learnOperations()
    }
    
    func pushOperand(symbol:String)->Double?{
        opStack.append(Op.Variable(symbol, variableValues[symbol]))
        return evaluate()
    }
    
    func pushOperand(operand:Double)->Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func pushOperation(symbol:String){
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
    
    func evaluate()->Double?{
        var result:Double?
        if let expression=opStackToString(filteredOpStack){
            TryCatch.try { () -> Void in
                var expn = NSExpression(format:expression)
                result=Double(expn.expressionValueWithObject(nil, context: nil) as! NSNumber)
            };
        }
        return result
    }
    
    func clearOpStack(){
        opStack = [Op]()
    }
    
    private func opStackToString(opStack:[Op]) -> String?{
        var auxOpStack = opStack
        var expression=""
        var nextShouldCloseParathenses=false
        while(!auxOpStack.isEmpty){
            let op = auxOpStack.removeAtIndex(0)
            switch op{
            case .UnaryPreOperation:
                expression+=op.description + "("
                nextShouldCloseParathenses=true
            default:
                if nextShouldCloseParathenses {
                    expression+=op.description + ")"
                    nextShouldCloseParathenses=false
                }
                else{
                    expression+=op.description
                }
            }
            
        }
        return expression
    }
    
    private var filteredOpStack:[Op]{
        var auxOpStack = opStack
        var newOpStack = [Op]()
        while(!auxOpStack.isEmpty){
            let op = auxOpStack.removeAtIndex(0)
            switch op{
            case .Variable(let symbol,let constant):
                let finalConstant:Double
                if let constantValue = constant {
                    finalConstant = constantValue
                }
                else if let constantValue = variableValues[symbol] {
                    finalConstant = constantValue
                } else{
                    break
                }
                
                if let previous = newOpStack.last{
                    if let value = getValue(previous){
                        newOpStack.removeLast()
                        newOpStack.append(Op.Operand(finalConstant*value))
                    }
                    else{
                        newOpStack.append(Op.Operand(finalConstant))
                    }
                }
                else{
                    if let following = auxOpStack.first {
                        if let value = getValue(following){
                            auxOpStack.removeAtIndex(0)
                            newOpStack.append(Op.Operand(finalConstant*value))
                        }
                        else{
                            newOpStack.append(Op.Operand(finalConstant))
                        }
                    }
                    else{
                        newOpStack.append(Op.Operand(finalConstant))
                    }
                }
            case .UnaryPreOperation(_,let operation):
                if let following = auxOpStack.first {
                    if let value = getValue(following){
                        auxOpStack.removeAtIndex(0)
                        newOpStack.append(Op.Operand(operation(value)))
                    }
                }
            case .UnaryPosOperation(_,let operation):
                if let previous = newOpStack.last{
                    if let value = getValue(previous){
                        newOpStack.removeLast()
                        newOpStack.append(Op.Operand(operation(value)))
                    }
                }
            default:
                newOpStack.append(op)
            }
        }
        return newOpStack
    }
    
    private func getValue(operation:Op)->Double?{
        switch operation{
        case .Operand(let operand):
            return operand
        case .Variable(_,let constant):
            return constant
        default:
            return nil
        }
    }
}
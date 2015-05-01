import Foundation

enum Op: Printable{
    case Operand(Double)
    case Variable(String,Double?)
    case UnaryPreOperation(String,Double->Double)
    case UnaryPosOperation(String,Double->Double)
    case BinaryOperation(String,(Double,Double)->Double)
    
    var description:String{
        get{
            switch self{
            case .Operand(let operand):
                return "\(operand)"
            case .Variable(let symbol,_):
                return symbol
            case .UnaryPreOperation(let symbol,_):
                return symbol
            case .UnaryPosOperation(let symbol,_):
                return symbol
            case .BinaryOperation(let symbol,_):
                return symbol
            }
        }
    }
}
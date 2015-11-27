//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 2014-104 on 15/11/26.
//  Copyright © 2015年 ninerec. All rights reserved.
//

import Foundation

class CalculatorBrain {
    // Internal helper data structure helps to differentiate between inputs
    private enum Op: CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, Int, (Double, Double) -> Double)
        
        var description: String {
            switch self {
            case .Operand(let operand):
                return "\(operand)"
            case .UnaryOperation(let symbol, _):
                return symbol
            case .BinaryOperation(let symbol, _, _):
                return symbol
            }
        }
        
        var precedence: Int {
            switch self {
            case .BinaryOperation(_, let precedence, _):
                return precedence
            default:
                return Int.max
            }
        }
    }
    
    // known oprations used to translate operation symbol into an Op
    private var knownOps = [String:Op]()
    private var postorderOpStack = [Op]()    // operation & operand
    private var inorderOpStack = [Op]()    // operation & operand
    
    init() {
        knownOps["+"] = Op.BinaryOperation("+", 1, +)
        knownOps["−"] = Op.BinaryOperation("−", 1, { $1 - $0 })
        knownOps["×"] = Op.BinaryOperation("×", 2, *)
        knownOps["÷"] = Op.BinaryOperation("÷", 2, { $1 / $0 })
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }

    func evalute(calculation: String) -> Double? {
        transferInorderToPostorder()
        return 0.0
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps:[Op]){
        return (nil, [])
    }
    
    private func transferInorderToPostorder() -> [Op] {
        return []
    }
    
    func pushOperand(operand: Double) {
        inorderOpStack.append(Op.Operand(operand))
    }
    
    func pushOperation(symbol: String) {
        if let operation = knownOps[symbol] {
            inorderOpStack.append(operation)
        }
    }
}

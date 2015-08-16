//
//  CalculatorBrain.swift
//  cs193p-Calculator
//
//  Created by Livio Bieri on 16/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import Foundation

class CalculatorBrain {

    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }


    private var opStack = [Op]()
    private var knownOps = [String:Op]()

    init() {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷", {$1 / $0})
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−", {$1 - $0})
		knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }

    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
		return evaluate()
    }

    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        if !ops.isEmpty {
            // need to get local mutable copy of ops
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return(operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }

    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack);
		print("Result: \(result) Remainder: \(remainder) -> \(opStack)")
        return result;
    } 

    func performOperation(symbol: String) -> Double? {
		if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
		return evaluate()
	}
}

//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation
class CalculatorBrain {
    private var accumulator: Double = 0
    
    var result: Double {
        get {
            return accumulator
        }
    }

    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }

        switch operation {
        case "√":
            accumulator = sqrt(result)
        case "=":
            operations(perviousNumber: UserDefaults.standard.double(forKey: "PreviousNumber"), accumulator: result, operation: UserDefaults.standard.string(forKey: "PreviousOperation")!)
            UserDefaults.standard.set("none", forKey: "PreviousOperation")
        case "+":
            if UserDefaults.standard.string(forKey: "PreviousOperation") != "none"{
                operations(perviousNumber: UserDefaults.standard.double(forKey: "PreviousNumber"), accumulator: result, operation: UserDefaults.standard.string(forKey: "PreviousOperation")!)
                UserDefaults.standard.set("plus", forKey: "PreviousOperation")
                
            }else {
                UserDefaults.standard.set("plus", forKey: "PreviousOperation")

            }
        case "-" :
            if UserDefaults.standard.string(forKey: "PreviousOperation") != "none"{
                operations(perviousNumber: UserDefaults.standard.double(forKey: "PreviousNumber"), accumulator: result, operation: UserDefaults.standard.string(forKey: "PreviousOperation")!)
                UserDefaults.standard.set("minus", forKey: "PreviousOperation")
                
            }else {
                UserDefaults.standard.set("minus", forKey: "PreviousOperation")
            }
            
        case "*" :
            if UserDefaults.standard.string(forKey: "PreviousOperation") != "none"{
                operations(perviousNumber: UserDefaults.standard.double(forKey: "PreviousNumber"), accumulator: result, operation: UserDefaults.standard.string(forKey: "PreviousOperation")!)
                UserDefaults.standard.set("multiply", forKey: "PreviousOperation")
                
            }else {
                UserDefaults.standard.set("multiply", forKey: "PreviousOperation")

            }
           
           
        case "/" :
            if UserDefaults.standard.string(forKey: "PreviousOperation") != "none"{
                operations(perviousNumber: UserDefaults.standard.double(forKey: "PreviousNumber"), accumulator: result, operation: UserDefaults.standard.string(forKey: "PreviousOperation")!)
                UserDefaults.standard.set("divide", forKey: "PreviousOperation")
                
            }else {
                UserDefaults.standard.set("divide", forKey: "PreviousOperation")

            }
            
           
        case "%" :
            accumulator = result / 100
        case "C" :
            accumulator = 0
            UserDefaults.standard.set("none", forKey: "PreviousOperation")
            UserDefaults.standard.set(0.0 , forKey: "PreviousNumber")
        case "CE":
            accumulator = 0
        case "log" :
            accumulator = log2(result)
        default:
            break
        }
    }

    func setOperand(_ value: Double) {
        accumulator = value
        
        if UserDefaults.standard.double(forKey: "PreviousNumber") != 0.0 {
            
        }else {
            UserDefaults.standard.set(value, forKey: "PreviousNumber")
        }
    }
    func operations(perviousNumber: Double , accumulator : Double , operation : String ){
        switch operation{
    case "plus" :
            self.accumulator  = perviousNumber + accumulator
            UserDefaults.standard.set(self.accumulator, forKey: "PreviousNumber")
    case "minus" :
            self.accumulator  = perviousNumber - accumulator
            UserDefaults.standard.set(self.accumulator, forKey: "PreviousNumber")
    case "multiply" :
            self.accumulator  = perviousNumber * accumulator
            UserDefaults.standard.set(self.accumulator, forKey: "PreviousNumber")
    case "divide" :
            self.accumulator  = perviousNumber / accumulator
            UserDefaults.standard.set(self.accumulator, forKey: "PreviousNumber")
        default : break
        
        }
    }
    
}

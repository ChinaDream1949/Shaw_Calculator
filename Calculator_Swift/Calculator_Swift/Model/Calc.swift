//
//  Calc.swift
//  Calculator_Swift
//
//  Created by MR.Sahw on 2020/11/11.
//

import Foundation

struct Calc {
    private var temp : (num1:Double , oper:String)? // 元组 Tuple (？ 可选型)
    
    mutating func calc(opreate : String, displayVal: Double) -> Double? {
        if opreate == "+/-" {
            return displayVal * -1
        }else if opreate == "AC" {
            return 0
        }else if opreate == "%" {
            return displayVal * 0.01
        }else if opreate == "=" {
            // 防止初次点击 = 符号
            if let num1 = temp?.num1,let oper = temp?.oper {
                switch oper {
                case "+":
                    return num1 + displayVal
                case "-":
                    return num1 - displayVal
                case "x":
                    return num1 * displayVal
                case "÷":
                    return num1 / displayVal
                default:
                    return nil
                }
            }
        }else{
            temp = (num1:displayVal,oper:opreate)
        }
        return nil
    }
}

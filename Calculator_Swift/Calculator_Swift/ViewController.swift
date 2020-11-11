//
//  ViewController.swift
//  Calculator_Swift
//
//  Created by MR.Sahw on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNum = true // 首次点击
//    var isResultsTypingNum = false // 记录结果
    private var displayVal : Double {
        get{
            guard let num = Double(displayLabel.text!) else {
                fatalError("不能解包为数字")
            }
            return num
        }
        set{
            // 当值发生变化 触发set
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNum = true
        // guard 方便调试 本质和 if let 一样
        
        
        if sender.currentTitle == "+/-" {
            displayVal *= -1
        }else if sender.currentTitle == "AC" {
            displayLabel.text = "0"
        }else if sender.currentTitle == "%" {
            displayVal *= 0.01
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if isFinishedTypingNum {
            displayLabel.text = sender.currentTitle
            isFinishedTypingNum = false
        }else{
            if sender.currentTitle == "." {
                let isInt = floor(displayVal) == displayVal
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + sender.currentTitle!
        }
    }
}


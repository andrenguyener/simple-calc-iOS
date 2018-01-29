//
//  ViewController.swift
//  simple-calc
//
//  Created by Andre Nguyen on 1/28/18.
//  Copyright © 2018 Andre Nguyen. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }


    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
        print("running number:\(runningNumber) left value:\(leftValue) right value: \(rightValue) current operation:\(currentOperation) result:\(result)")
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }

    @IBAction func modPressed(_ sender: RoundButton) {
    }
    
    @IBAction func factorialPressed(_ sender: RoundButton) {
    }
    
    @IBAction func countPressed(_ sender: RoundButton) {
    }
    
    @IBAction func averagePressed(_ sender: RoundButton) {
    }
    
    func operation(operation: Operation) {
                print("running number:\(runningNumber) left value:\(leftValue) right value: \(rightValue) current operation:\(currentOperation) result:\(result)")
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                switch currentOperation {
                case .Add:
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                case .Subtract:
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                case .Multiply:
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                case .Divide:
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                default:
                    result = ""
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
                rightValue = ""
                currentOperation = .NULL
            } else {
                currentOperation = operation
            }
            
            
        } else if(runningNumber == "" && leftValue != ""){
            currentOperation = operation

        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
        print("running number:\(runningNumber) left value:\(leftValue) right value: \(rightValue) current operation:\(currentOperation) result:\(result)")

    }
    
}


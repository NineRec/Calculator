//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 2014-104 on 15/11/26.
//  Copyright © 2015年 ninerec. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var displayLabel: UILabel!
    
    var hasCharacterBefore = false
    var brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions
    
    // cancel all input
    @IBAction func cancel() {
        displayLabel.text = "0"
        hasCharacterBefore = false
    }
    
    // delete one character
    @IBAction func delete() {
        let calculation = displayLabel.text!
        if calculation.characters.count > 1 {
            let endIndex = calculation.endIndex.predecessor()
            displayLabel.text = calculation.substringToIndex(endIndex)
        } else {
            displayLabel.text = "0"
            hasCharacterBefore = false
        }
    }
    
    // calculate the result
    @IBAction func calculate() {
        brain.evalute("")
    }
    
    // append number in the text
    @IBAction func appendOperand(sender: UIButton) {
        let character = sender.currentTitle!
        
        if hasCharacterBefore {
            displayLabel.text = displayLabel.text! + character
        } else if character != "0" {
            displayLabel.text = character
            hasCharacterBefore = true
        }
    }
    
    // append operation & brackets
    @IBAction func appendOperation(sender: UIButton) {
        let operation = sender.currentTitle!
        displayLabel.text = displayLabel.text! + operation
        hasCharacterBefore = true
    }
}


//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var zeroPcButton: UIButton!
    var tipPercentage = "10%"
    var results: Double?
    var percentage = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.titleLabel?.text == "0%"{
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
            tipPercentage = "0%"
            percentage = 0
        }
        
        if sender.titleLabel?.text == "10%"{
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
            tipPercentage = "10%"
            percentage = 0.1
        }
        
        if sender.titleLabel?.text == "20%"{
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
            tipPercentage = "20%"
            percentage = 0.2
        }
    }
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        results = ((Double(billTextField.text!) ?? 0) + (percentage*(Double(billTextField.text!) ?? 0))) / (Double(splitNumberLabel.text!) ?? 0)
        self.performSegue(withIdentifier: "resultView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.numberOfPeople = splitNumberLabel.text!
            resultViewController.tipPercentage = tipPercentage
            resultViewController.totalResult = String(format: "%.2f", results!)
    
        }
    }
    
    
}


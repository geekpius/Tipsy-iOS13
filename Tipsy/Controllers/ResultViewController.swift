//
//  ResultViewController.swift
//  Tipsy
//
//  Created by T.K Pius on 30/01/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople = ""
    var tipPercentage = ""
    var totalResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage) tip."
        totalLabel.text = totalResult
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}

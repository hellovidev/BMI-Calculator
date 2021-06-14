//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        heightValueLabel.text = "\(valueRound(sender.value, precision: .hundredths))m"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        weightValueLabel.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    
    // Specify the decimal place to round to using an enum
    public enum RoundingPrecision {
        case ones
        case tenths
        case hundredths
    }
    
    // Round to the specific decimal place
    public func valueRound(_ value: Float, precision: RoundingPrecision = .ones) -> Float {
        switch precision {
        case .ones:
            return round(value)
        case .tenths:
            return round(value * 10) / 10.0
        case .hundredths:
            return round(value * 100) / 100.0
        }
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / pow(height, 2)
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%0.1f", bmi)
        self.present(secondVC, animated: true, completion: nil)
        
    }
}


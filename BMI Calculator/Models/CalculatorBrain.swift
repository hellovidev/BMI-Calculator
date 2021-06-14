//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sergey Romanchuk on 14.06.21.
//

import UIKit

struct CalculatorBrain {
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float)  {
        let bmiValue = weight / pow(height, 2)
        checkBMI(bmiValue)
    }
    
    func getBMIValue() -> Float {
        return valueRound(bmi?.value ?? 0.0, precision: .tenths)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColorBMI() -> UIColor {
        return bmi?.color ?? .white
    }
    
    private mutating func checkBMI(_ value: Float) {
        if value < 18.5 {
            bmi = BMI(value: valueRound(value, precision: .tenths), advice: "Underweight", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if value < 24.9 {
            bmi = BMI(value: valueRound(value, precision: .tenths), advice: "Normal", color: .green)
        } else {
            bmi = BMI(value: valueRound(value, precision: .tenths), advice: "Overweight", color: .red)
        }
    }
    
    //MARK: - Round decimal
    
    private enum RoundingPrecision {
        case ones
        case tenths
        case hundredths
    }
    
    /* Round to the specific decimal place */
    
    private func valueRound(_ value: Float, precision: RoundingPrecision = .ones) -> Float {
        switch precision {
        case .ones:
            return round(value)
        case .tenths:
            return round(value * 10) / 10.0
        case .hundredths:
            return round(value * 100) / 100.0
        }
    }
    
}

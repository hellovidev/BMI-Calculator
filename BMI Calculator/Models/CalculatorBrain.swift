//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sergey Romanchuk on 14.06.21.
//

import Foundation

struct CalculatorBrain {
    private var bmi: Float?
    
    mutating func calculateBMI(height: Float, weight: Float)  {
        bmi = weight / pow(height, 2)
    }
    
    func getBMIValue() -> Float {
        return valueRound(bmi ?? 0.0, precision: .tenths)
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

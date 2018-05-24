//
//  CalculatorBrain.swift
//  GPACalculator
//
//  Created by Omar AlKhamis on 09/09/1439 AH.
//  Copyright © 1439 Omar AlKhamis. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    var gpaScale:GPAScale?
    var earnedCreditHours:Int?
    var earnedQualityPoints:Double?
    var semesterPerformance = [String:Int]()
    
    func CalculatorBrain(){
        
    }
    
    struct LetterGrades {
        static let outOf4 = ["A+":4.00,
                             "A":3.75,
                             "B+":3.50,
                             "B":3.00,
                             "C+":2.50,
                             "C":2.00,
                             "D+":1.50,
                             "D":1.00]
        
        static let outOf5 = ["A+":5.00,
                             "A":4.75,
                             "B+":4.50,
                             "B":4.00,
                             "C+":3.50,
                             "C":3.00,
                             "D+":2.50,
                             "D":2.00]
    }
    enum GPAScale {
        case outOf4
        case outOf5
    }
}

//
//  CalculatorBrain.swift
//  GPACalculator
//
//  Created by Omar AlKhamis on 09/09/1439 AH.
//  Copyright © 1439 Omar AlKhamis. All rights reserved.
//

import Foundation

class CalculatorBrain{
    var semester:Semester
    init(semester:Semester) {
        self.semester = semester
    }
}

class Semester{
    private var courses:[Course]
    private var gpaScale:GPAScale
    private var attemptedCreditHours:Int{
        get{
            var ch = 0
            for course in self.courses{
                ch = ch + course.creditHours
            }
            return ch
        }
    }
    private var attemptedQualityPoints:Double{
        get{
            switch self.gpaScale {
            case .outOf4:
                return Double(self.attemptedCreditHours)*LetterGrades.outOf4["A+"]!
            case .outOf5:
                return Double(self.attemptedCreditHours)*LetterGrades.outOf5["A+"]!
            }
        }
    }
    private var earnedQualityPoints:Double{
        get{
            var qp = 0.0
            for course in self.courses{
                switch self.gpaScale{
                case .outOf4:
                    qp = qp + Double(course.creditHours)*LetterGrades.outOf4[course.letterGrade]!
                case .outOf5:
                    qp = qp + Double(course.creditHours)*LetterGrades.outOf5[course.letterGrade]!
                }
            }
            return qp
        }
    }
    var semesterGPA:Double{
        get{
            return earnedQualityPoints/Double(attemptedCreditHours)
        }
    }
    init(courses:[Course],gpaScale:GPAScale){
        self.courses = courses
        self.gpaScale = gpaScale
    }
}

class Course{
    var creditHours:Int
    var letterGrade:String

    init (creditHours:Int,letterGrade:String){
        self.creditHours = creditHours
        self.letterGrade = letterGrade
    }
}

struct LetterGrades {
    static let outOf4 = ["A+":4.00,
                         "A":3.75,
                         "B+":3.50,
                         "B":3.00,
                         "C+":2.50,
                         "C":2.00,
                         "D+":1.50,
                         "D":1.00,
                         "F":0.00]
    
    static let outOf5 = ["A+":5.00,
                         "A":4.75,
                         "B+":4.50,
                         "B":4.00,
                         "C+":3.50,
                         "C":3.00,
                         "D+":2.50,
                         "D":2.00,
                         "F":0.00]
}

enum GPAScale {
    case outOf4
    case outOf5
}

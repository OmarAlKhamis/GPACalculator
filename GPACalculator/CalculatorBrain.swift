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
    private var courses:[Course]                                                                    // An array holding courses which are represented by course letter grade and course credit hours
    private var gpaScale:GPAScale                                                                   // Enum selecting the gpaSclae, out of 4 or out of 5
    private var previousCreditHours:Int                                                             // previously earned credit hours, prior to this semester
    private var previousGPA:Double                                                                  // previous achieved GPA, prior to this semester
    private var previousQualityPoints:Double{get{return previousGPA*Double(previousCreditHours)}}   // Previuosely earned quality poinst, prior to this semester
    private var totalQualityPoints:Double{get{return previousQualityPoints+attemptedQualityPoints}} // Total number of quality points for all semesters
    private var totalCreditHours:Int{get{return previousCreditHours+attemptedCreditHours}}          // Total number of credit hours, for all sesemter
    private var attemptedCreditHours:Int{ get{var CH = 0; for course in self.courses{ CH = CH + course.creditHours }; return CH } }  // The total number of attapted credit hourst in this semester
    private var attemptedQualityPoints:Double{      // Quality points of this semester
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
    var semesterGPA:Double{get{return attemptedQualityPoints/Double(attemptedCreditHours)}}         // This semester's GPA
    var cumulativeGPA:Double{get{return totalQualityPoints/Double(totalCreditHours)}}               // Cumulative GPA for all semester
    
    // Constructor of the class, prevoius values will default to 0 if not entered
    init(courses:[Course],gpaScale:GPAScale,previousCreditHours:Int=0, previousGPA:Double=0.0){
        self.courses = courses
        self.gpaScale = gpaScale
        self.previousGPA = previousGPA
        self.previousCreditHours = previousCreditHours
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
                         "F":1.00,]
}

enum GPAScale {
    case outOf4
    case outOf5
}

//
//  RoundData.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 08/08/2022.
//

import Foundation

class RoundData: Identifiable {
    let id = UUID()
    var courseName: String
    var date: Date
    var yellowTee: Bool = false
    var blueTee: Bool = false
    var whiteTee: Bool = false
    var redTee: Bool = false
    
    
    
    init(courseName: String, handicap: Int, date: Date, points: Int, yellowTee: Bool, blueTee: Bool, whiteTee: Bool, redTee: Bool) {
        self.courseName = courseName
        self.date = date
        self.yellowTee = yellowTee
        self.blueTee = blueTee
        self.whiteTee = whiteTee
        self.redTee = redTee
    }

}

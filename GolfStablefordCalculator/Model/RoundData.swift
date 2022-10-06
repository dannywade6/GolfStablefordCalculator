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
    var selectedTee: Tee
    
    
    
    init(courseName: String, handicap: Int, date: Date, points: Int, selectedTee: Tee) {
        self.courseName = courseName
        self.date = date
        self.selectedTee = selectedTee
    }

}

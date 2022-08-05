//
//  HoleData.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import Foundation

class HoleData: Identifiable {
    let id = UUID()
    let holeNumber: Int
    var par: Int
    var strokeIndex: Int
    var strokesPlayed: Int = 3
    var points: Int = 0
    
    init(holeNumber: Int, par: Int, strokeIndex: Int) {
        self.holeNumber = holeNumber
        self.par = par
        self.strokeIndex = strokeIndex
    }
}

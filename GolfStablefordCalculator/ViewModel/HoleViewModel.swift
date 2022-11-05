//
//  HoleViewModel.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import Foundation

import Foundation

class HoleViewModel: ObservableObject {
    @Published var allHoles: [HoleData] = [
        HoleData(holeNumber: 1, par: 3, strokeIndex: 1),
        HoleData(holeNumber: 2, par: 4, strokeIndex: 2),
        HoleData(holeNumber: 3, par: 5, strokeIndex: 3),
        HoleData(holeNumber: 4, par: 3, strokeIndex: 4),
        HoleData(holeNumber: 5, par: 4, strokeIndex: 5),
        HoleData(holeNumber: 6, par: 5, strokeIndex: 6),
        HoleData(holeNumber: 7, par: 3, strokeIndex: 7),
        HoleData(holeNumber: 8, par: 4, strokeIndex: 8),
        HoleData(holeNumber: 9, par: 5, strokeIndex: 9),
        HoleData(holeNumber: 10, par: 3, strokeIndex: 10),
        HoleData(holeNumber: 11, par: 4, strokeIndex: 11),
        HoleData(holeNumber: 12, par: 5, strokeIndex: 12),
        HoleData(holeNumber: 13, par: 3, strokeIndex: 13),
        HoleData(holeNumber: 14, par: 4, strokeIndex: 14),
        HoleData(holeNumber: 15, par: 5, strokeIndex: 15),
        HoleData(holeNumber: 16, par: 3, strokeIndex: 16),
        HoleData(holeNumber: 17, par: 4, strokeIndex: 17),
        HoleData(holeNumber: 18, par: 5, strokeIndex: 18),
    ]
    
    @Published var whichHole: Int = 1
    @Published var handicap: Int = 0
    
    var totalScore: Int {
        allHoles.map { $0.points }.reduce(0, +)
    }
    
    func clearScore() {
        allHoles = [
            HoleData(holeNumber: 1, par: 3, strokeIndex: 1),
            HoleData(holeNumber: 2, par: 4, strokeIndex: 2),
            HoleData(holeNumber: 3, par: 5, strokeIndex: 3),
            HoleData(holeNumber: 4, par: 3, strokeIndex: 4),
            HoleData(holeNumber: 5, par: 4, strokeIndex: 5),
            HoleData(holeNumber: 6, par: 5, strokeIndex: 6),
            HoleData(holeNumber: 7, par: 3, strokeIndex: 7),
            HoleData(holeNumber: 8, par: 4, strokeIndex: 8),
            HoleData(holeNumber: 9, par: 5, strokeIndex: 9),
            HoleData(holeNumber: 10, par: 3, strokeIndex: 10),
            HoleData(holeNumber: 11, par: 4, strokeIndex: 11),
            HoleData(holeNumber: 12, par: 5, strokeIndex: 12),
            HoleData(holeNumber: 13, par: 3, strokeIndex: 13),
            HoleData(holeNumber: 14, par: 4, strokeIndex: 14),
            HoleData(holeNumber: 15, par: 5, strokeIndex: 15),
            HoleData(holeNumber: 16, par: 3, strokeIndex: 16),
            HoleData(holeNumber: 17, par: 4, strokeIndex: 17),
            HoleData(holeNumber: 18, par: 5, strokeIndex: 18),
        ]
    }
    
    
    func holeScore(forHoleNumber holeNumber: Int) -> Int {
        
        let differential: Int = handicap % 18 >= allHoles[whichHole - 1].strokeIndex ? 1 : 0
        let points: Int = allHoles[whichHole - 1].par + 2 - allHoles[whichHole - 1].strokesPlayed + differential + handicap / 18
       
        let holeToUpdate = allHoles.first(where: { hole in
            hole.holeNumber == holeNumber
        })
        holeToUpdate?.points = points
        
        return points < 0 ? 0 : points
    }
}

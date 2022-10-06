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
        
        var net: Int = 0
        var points: Int = 0
        
        
        if handicap <= 18 {
            if handicap - allHoles[whichHole - 1].strokeIndex >= 0 {
                net = (allHoles[whichHole - 1].strokesPlayed - 1)
            }
            else {
                net = allHoles[whichHole - 1].strokesPlayed
            }
        }

        if handicap > 18 {
            if (handicap - 18) - allHoles[whichHole - 1].strokeIndex >= 0 {
                net = (allHoles[whichHole - 1].strokesPlayed - 2)
            }
            else {
                net = (allHoles[whichHole - 1].strokesPlayed - 1)
            }
        }

        switch net {
        case _ where net >= allHoles[whichHole - 1].par + 2:
            points = 0

        case _ where net == allHoles[whichHole - 1].par + 1:
            points = 1

        case _ where net == allHoles[whichHole - 1].par:
            points = 2

        case _ where net == allHoles[whichHole - 1].par - 1:
            points = 3

        case _ where net == allHoles[whichHole - 1].par - 2:
            points = 4

        case _ where net == allHoles[whichHole - 1].par - 3:
            points = 5

        case _ where net == allHoles[whichHole - 1].par - 4:
            points = 6

        default:
            points = 0
            
        }
        let holeToUpdate = allHoles.first(where: { hole in
            hole.holeNumber == holeNumber
        })
        holeToUpdate?.points = points
        
        return points
    }
}

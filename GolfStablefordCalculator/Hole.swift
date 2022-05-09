//
//  Hole.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 09/05/2022.
//

import Foundation

struct Hole: Identifiable {
    var id = UUID()
    var holeNumber: Int
    var par: Int
    var strokeIndex: Int
    var gross: Int
    var handicap: Int

    mutating func calculatePoints() -> Int {

        var net: Int = 0
        var points: Int = 0

        if handicap <= 18 {
            if handicap - strokeIndex >= 0 {
                net = (gross - 1)
            }
            else {
                net = gross
            }
        }

        if handicap > 18 {
            if (handicap - 18) - strokeIndex >= 0 {
                net = (gross - 2)
            }
            else {
                net = (gross - 1)
            }
        }

        switch net {
        case _ where net >= par + 2:
            points = 0
            return points

        case _ where net == par + 1:
            points = 1
            return points

        case _ where net == par:
            points = 2
            return points

        case _ where net == par - 1:
            points = 3
            return points

        case _ where net == par - 2:
            points = 4
            return points

        case _ where net == par - 3:
            points = 5
            return points
        case _ where net == par - 4:
            points = 6
            return points

        default:
            points = 0
            return points
        }
    }

    init(holeNumber: Int, par: Int, strokeIndex: Int, gross: Int, handicap: Int) {
        self.holeNumber = holeNumber
        self.par = par
        self.strokeIndex = strokeIndex
        self.gross = gross
        self.handicap = handicap
    }
}


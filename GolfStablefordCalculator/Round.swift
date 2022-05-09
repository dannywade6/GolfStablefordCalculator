//
//  Round.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 09/05/2022.
//

import Foundation

struct Round: Identifiable, Codable {
    var id = UUID()
    var points: Int
    var course: String
    var date: Date
    //    var handicap: Int
    //    var tee: String

    init(points: Int, course: String, date: Date /*handicap: Int, tee: String*/) {
        self.points = points
        self.course = course
        self.date = date
        //        self.handicap = handicap
        //        self.tee = tee
    }
}

class RoundStorage: ObservableObject {
    @Published var rounds = [Round]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(rounds), forKey: "round")
        }
    }

    init() {
        if let data = UserDefaults.standard.value(forKey: "round") as? Data {
            if let userDefaultScores = try? PropertyListDecoder().decode(Array<Round>.self, from: data) {
                rounds = userDefaultScores
            }
        }
    }
}

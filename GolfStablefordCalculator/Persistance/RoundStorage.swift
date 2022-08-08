//
//  RoundStorage.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import Foundation

struct Round: Identifiable, Codable {
    var id = UUID()
    var points: Int
    var courseName: String
    var date: Date
    var handicap: Int
    
    var yellowTee: Bool = false
    var blueTee: Bool = false
    var whiteTee: Bool = false
    var redTee: Bool = false
    
    init(points: Int, courseName: String, date: Date, handicap: Int, yellowTee: Bool, blueTee: Bool, whiteTee: Bool, redTee: Bool) {
        self.points = points
        self.courseName = courseName
        self.date = date
        self.handicap = handicap
        self.yellowTee = yellowTee
        self.blueTee = blueTee
        self.whiteTee = whiteTee
        self.redTee = redTee
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

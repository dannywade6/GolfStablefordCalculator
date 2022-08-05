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
    
    init(points: Int) {
        self.points = points
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

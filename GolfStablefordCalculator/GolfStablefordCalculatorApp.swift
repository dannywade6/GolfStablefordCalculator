//
//  GolfStablefordCalculatorApp.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 22/03/2022.
//

import SwiftUI

@main
struct GolfStablefordCalculatorApp: App {
    var body: some Scene {

        let scoreStorage = RoundStorage()

        WindowGroup {
            ScoreList().environmentObject(scoreStorage)
        }
    }
}

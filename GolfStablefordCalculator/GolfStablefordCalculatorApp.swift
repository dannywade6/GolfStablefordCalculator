//
//  GolfStablefordCalculatorApp.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 22/03/2022.
//

import SwiftUI

@main
struct StablefordSandboxApp: App {
    var body: some Scene {
        WindowGroup {
//            LogInView()
            HomeView()
                .environmentObject(HoleViewModel())
                .environmentObject(RoundStorage())
                .environmentObject(RoundViewModel())
        }
    }
}

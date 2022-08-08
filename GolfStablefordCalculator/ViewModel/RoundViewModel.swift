//
//  RoundViewModel.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 08/08/2022.
//

import Foundation



class RoundViewModel: ObservableObject {
    @Published var courseName: String = ""
    @Published var date: Date = Date()
    @Published var points: Int = 0
    @Published var yellowTee: Bool = false
    @Published var blueTee: Bool = false
    @Published var whiteTee: Bool = false
    @Published var redTee: Bool = false
}

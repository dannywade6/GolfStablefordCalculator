//
//  RoundViewModel.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 08/08/2022.
//

import Foundation
import SwiftUI

class RoundViewModel: ObservableObject {
    @Published var courseName: String = ""
    @Published var date: Date = Date()
    @Published var points: Int = 0
    @Published var selectedTee: Tee = .red
    
    let dateFormatter = DateFormatter()
    
    func dateShortened() -> String {
        let initialDate = date
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: initialDate)
    }
}
//
//extension Date {
//    static var dateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        return formatter
//    }()
//}


enum Tee: String, CaseIterable, Identifiable, Equatable, Codable {
    case red = "Red"
    case yellow = "Yellow"
    case white = "White"
    case blue = "Blue"
    
    var id: String {
        rawValue
    }
    
    var color: Color {
        switch self {
        case .red:
            return Color("teeRed1")
        case .yellow:
            return Color("teeYellow1")
        case . white:
            return .white
        case .blue:
            return Color("teeBlue1")
        }
    }
}

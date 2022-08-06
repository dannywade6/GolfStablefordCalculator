//
//  ListDropDownView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 06/08/2022.
//

import SwiftUI

struct ListDropDownView: View {
    
    //    var fruit: String
    let round: [String] = ["Maylands", "01/08/2022", "22 Points", "🟡 Tee", "Handicap: 20"]
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Round") {
                ForEach(0..<round.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    
                    HStack {
                        Group {
//                            Image(systemName: "info.circle")
                            Text(round[item])
                                .bold()
                                
                                
                        }
                        .multilineTextAlignment(.leading)
                    }
                    
                }
            }
        }
        
    }
}

struct ListDropDownView_Previews: PreviewProvider {
    static var previews: some View {
        ListDropDownView()
    }
}

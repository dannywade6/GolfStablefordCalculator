//
//  ScoreListView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 30/03/2022.
//

import SwiftUI

struct ScoreListView: View {

    @State var rounds = ["Augusta", "Pebble Beach", "St Andrews", "Royal Troon"]

    var body: some View {
        List {
            ForEach(rounds, id: \.self) { round in

                HStack {

                    Text(round)
                    Spacer()
                    Text("03/03/2022")
                        .fontWeight(.light)
                    
                    Text("36 Points")
                        .fontWeight(.bold)
                }


            }
        }
    }
}

struct ScoreListView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreListView()
    }
}

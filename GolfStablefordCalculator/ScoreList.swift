//
//  ScoreList.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 09/05/2022.
//

import SwiftUI

struct ScoreList: View {

    @EnvironmentObject var roundStorage: RoundStorage

    var body: some View {

        NavigationView {
            List {
                ForEach(self.roundStorage.rounds) { round in
                    HStack {
                        Text("\(round.points) Points")
                            .bold()
                        Spacer()
                        Text(round.course)
                    }
                }
                .onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        self.roundStorage.rounds.remove(at: index)
                    }
                })
            }
            .navigationBarTitle("Scores")
            .navigationBarItems(trailing: NavigationLink(destination: CreateScore()){
                Text("New Round")
            .navigationBarBackButtonHidden(true)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreList().environmentObject(RoundStorage())
    }
}

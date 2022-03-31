//
//  ScoreListView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 30/03/2022.
//

import SwiftUI

struct Round: Identifiable {
    var id = UUID()
    var course: String
    var date: String
    var points: Int
}

struct RoundRow: View {
    var round: Round
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(round.course)
                Text(round.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(round.points) Points")
        }
    }
}

struct ScoreListView: View {
    
    let previousRounds = [
    Round(course: "Augusta", date: "20/03/2022", points: 31),
    Round(course: "Pebble Beach", date: "23/03/2022", points: 35),
    Round(course: "St Andrews", date: "27/03/2022", points: 27),
    Round(course: "Royal Troon", date: "31/03/2022", points: 36),
    ]
    
    var body: some View {
        NavigationView {
            List(previousRounds) { round in
                NavigationLink(destination: DetailView(round: round)) {
                RoundRow(round: round)
                }
            }
            .navigationBarTitle("My Rounds")
        }
        
    }
}

struct DetailView: View {
    
    var round: Round
    
    var body: some View {
        VStack {
            Text(round.course)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 3)

            HStack {
                Text("\(round.date) - \(round.points) Points.")
            }
            Spacer()
        }
    }
}


struct ScoreListView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreListView()
    }
}

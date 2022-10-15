//
//  HomeChartView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 03/10/2022.
//

import SwiftUI
import Charts

struct HomeChartView: View {
    
    @EnvironmentObject var roundStorage: RoundStorage
    @EnvironmentObject var roundViewModel: RoundViewModel
    @EnvironmentObject var viewModel: HoleViewModel
    
    var body: some View {
        VStack {
            Text("Previous Rounds")
                .font(.title2)
                .bold()
                .padding(.bottom)
            Chart {
                ForEach(roundStorage.rounds.suffix(5)) {
                    LineMark (
                        x: .value("Date", $0.date),
                        y: .value("Score", $0.points))
                }
                .interpolationMethod(.catmullRom)
                
            }
            .chartYAxis() {
                AxisMarks(position: .leading)
            }
            .foregroundColor(Color("green1"))
        }
        .padding(.horizontal)
        .padding(.bottom)
        
    }
}

struct HomeChartView_Previews: PreviewProvider {
    static var previews: some View {
        HomeChartView()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundStorage())
            .environmentObject(RoundViewModel())
    }
}

//
//  ButtonView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct ButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: HoleViewModel
    @EnvironmentObject var roundStorage: RoundStorage
    @EnvironmentObject var roundViewModel: RoundViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                viewModel.whichHole = 1
                viewModel.clearScore()
            }, label: {
                Text("Discard Score")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.red, lineWidth: 2.0))
            })
            .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                roundStorage.rounds.append(Round(points: viewModel.totalScore, courseName: roundViewModel.courseName, date: roundViewModel.dateShortened(), handicap: viewModel.handicap, yellowTee: roundViewModel.yellowTee, blueTee: roundViewModel.redTee, whiteTee: roundViewModel.whiteTee, redTee: roundViewModel.blueTee))
                
                self.presentationMode.wrappedValue.dismiss()
                viewModel.whichHole = 1
                viewModel.clearScore()
            }, label: {
                Text("Save Score")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.green, lineWidth: 2.0))
            })
            .padding(.bottom)

                Spacer()
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .environmentObject(RoundStorage())
            .environmentObject(HoleViewModel())
            .environmentObject(RoundViewModel())
    }
}

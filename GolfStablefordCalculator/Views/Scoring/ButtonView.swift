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
                    .foregroundColor(Color("red1"))
                    .fontWeight(.semibold)
                    .font(.title3)
                    .frame(width: 159, height: 53)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .strokeBorder(LinearGradient(colors: [Color("red2"), Color("red3")], startPoint: .leading, endPoint: .top), lineWidth: 1.5)
                    )
//                    .font(.headline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.red)
//                    .padding()
//                    .padding(.horizontal, 10)
//                    .background(
//                        Capsule()
//                            .stroke(Color.red, lineWidth: 2.0))
            })
            .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                roundStorage.rounds.append(Round(points: viewModel.totalScore, courseName: roundViewModel.courseName, date: roundViewModel.dateShortened(), handicap: viewModel.handicap))
                
                self.presentationMode.wrappedValue.dismiss()
                viewModel.whichHole = 1
                viewModel.clearScore()
            }, label: {
                Text("Save Score")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(.title3)
                    .frame(width: 159, height: 53)
                    .background(
                        LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top))
                    .cornerRadius(18)
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

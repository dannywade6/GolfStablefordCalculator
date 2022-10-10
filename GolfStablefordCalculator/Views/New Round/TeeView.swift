//
//  TeeView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 06/10/2022.
//

import SwiftUI

struct TeeView: View {
//    @StateObject var roundViewModel = RoundViewModel()
    @EnvironmentObject var roundViewModel: RoundViewModel
    
    var body: some View {
        HStack {
            ForEach(Tee.allCases) { tee in
                Button {
                    roundViewModel.selectedTee = tee
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(tee.color)
                            .frame(width: 51, height: 49)
                            .shadow(radius: 3)
                            .padding(.horizontal)
                        if tee == roundViewModel.selectedTee {
                            let checkmarkColor: Color = roundViewModel.selectedTee == .white ? .black : .white
                            Image(systemName: "checkmark")
                                .font(.headline)
                                .foregroundColor(checkmarkColor)
                        }
                    }
                }
                
            }
        }
    }
}

struct TeeView_Previews: PreviewProvider {
    static var previews: some View {
        TeeView()
            .environmentObject(RoundViewModel())
    }
}

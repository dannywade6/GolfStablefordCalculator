//
//  HoleSelectionView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct HoleSelectionView: View {
    
    @EnvironmentObject var viewModel: HoleViewModel
    
    var body: some View {
        HStack {
                Spacer()
                Button {
                    
                    guard viewModel.whichHole > 1 else {
                        return viewModel.whichHole = 1
                    }
                        viewModel.whichHole -= 1
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                }
                .foregroundColor(.green)
                Spacer()
                
                Text("Hole \(viewModel.whichHole)")
                    .font(.headline)
                
                Spacer()
                
                Button {
                    
                    guard viewModel.whichHole < 18 else {
                        return viewModel.whichHole = 18
                    }
                    viewModel.whichHole += 1
                
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                }
                Spacer()
        }
    }
}

struct HoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HoleSelectionView()
            .environmentObject(HoleViewModel())
    }
}

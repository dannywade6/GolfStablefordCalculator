//
//  ContentView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            // Background
            Color.green.ignoresSafeArea()
            
            // Content
            MenuView()
        }
    }
}

struct MenuView: View {
    
    @State var showCreateScreen:Bool = false
    @State var showViewScreen:Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("golfer")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Stableford Calculator")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                showCreateScreen.toggle()
            } label: {
                Text("Create Round")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .shadow(radius: 10)
                    .background(
                        Capsule()
                            .stroke(Color.white, lineWidth: 2.0)
                    )
                    .padding(.bottom, 5)
            }
            .fullScreenCover(isPresented: $showCreateScreen) {
                CreateNewRound()
            }
            
            Button {
                showViewScreen.toggle()
            } label: {
                Text("View Rounds")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.white, lineWidth: 2.0)
                    )
            }
            .fullScreenCover(isPresented: $showViewScreen) {
                PreviousRoundsView()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundStorage())
        //        ViewRounds()
    }
}

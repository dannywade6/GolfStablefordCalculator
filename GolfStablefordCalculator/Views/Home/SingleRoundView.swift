//
//  SingleRoundView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 11/10/2022.
//

import SwiftUI

struct SingleRoundView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("Add Another Round!")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.regular)
                    .padding()
                
                
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .overlay {
                        LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top
                        )
                    }
                    .mask(
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            
                    )
                    .padding()
                
                Text("Great! You've added your first round. Add another round to view your previous rounds.")
                    .font(.headline)
                    .fontWeight(.light)
                    .padding()
                
                Button {
                    print("NavigationLink to CreateNewRound()")
                } label: {
                    NavigationLink(destination: CreateNewRound()) {
                        Text("New Round")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.title2)
                            .frame(width: 150, height: 60)
                            .padding(.horizontal, animate ? 30 : 50)
                            .background(
                                LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top))
                            .cornerRadius(18)
                            
                    }
                    .padding(.top)
                    .onAppear(perform: addAnimation)
                }
            }
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct SingleRoundView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRoundView()
    }
}

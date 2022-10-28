//
//  HomeView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 01/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var showCreateScreen:Bool = false
    @State var showViewScreen:Bool = false
    
    @EnvironmentObject var roundStorage: RoundStorage
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                LinearGradient(colors: [Color("backgroundgradient1"), Color("backgroundgradient2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                // Content
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hey!")
                                .font(.title)
                                .bold()
                                .overlay {
                                    LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top
                                    )
                                    .mask(
                                        Text("Hey!")
                                            .font(.title)
                                            .bold()
                                    )
                                }
                            
                            Text("Welcome to StablefordGolf")
                                .font(.title2)
                                .fontWeight(.regular)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        Spacer()
                    }
                    
                    HStack {
                        
                        Button {
                            print("NavigationLink to CreateNewRound()")
                        } label: {
                            NavigationLink(destination: CreateNewRound()) {
                                Text("New Round")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 162, height: 53)
                                    .background(
                                        LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top))
                                    .cornerRadius(18)
                            }
                        }
                        
                        Button {
                            showViewScreen.toggle()
                        } label: {
                            Text("Previous Rounds")
                                .foregroundColor(Color("text3"))
                                .fontWeight(.semibold)
                                .font(.headline)
                                .frame(width: 162, height: 53)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .strokeBorder(LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top), lineWidth: 1.5))
                        }
                        .fullScreenCover(isPresented: $showViewScreen) {
                            PreviousRoundsView()
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("frameBackground1"))
                            .padding(.top)
                            .padding(.horizontal)
                        
                        if roundStorage.rounds.isEmpty {
                            RoundsEmptyView()
                                .frame(width: 350, height: 400)
                                .padding(.top, 40)
                                .padding(.bottom, 100)
                        } else if roundStorage.rounds.count == 1 {
                            SingleRoundView()
                                .frame(width: 350, height: 400)
                                .padding(.top, 40)
                                .padding(.bottom, 100)
                        } else {
                            HomeChartView()
                                .frame(width: 350, height: 400)
                                .padding(.top, 40)
                                .padding(.bottom, 100)
                        }
                    }
                    
                }
//                .toolbar {
//                    Button {
//                        print("iCloud Profile")
//                    } label: {
//                        Image(systemName: "person.crop.circle.fill")
//                            .foregroundColor(Color("green1"))
//                            .font(.title3)
//                    }
//                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundStorage())
            .environmentObject(RoundViewModel())
    }
}

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
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // Background
                LinearGradient(colors: [Color("background1"), Color("background2")], startPoint: .topLeading, endPoint: .bottomTrailing)
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
                            
                            Text("Welcome Danny")
                                .font(.title)
                                .fontWeight(.regular)
                        }
                        .padding(.leading, 30)
                        Spacer()
                        
                    }
                    
                    HStack {
                        Button {
                            showCreateScreen.toggle()
                        } label: {
                            Text("New Round")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .font(.headline)
                                .fullScreenCover(isPresented: $showCreateScreen) {
                                    CreateNewRound()
                        }
                        
                        .frame(width: 162, height: 53)
                        .background(
                            LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top))
                        .cornerRadius(18)
                        
                        
                        }
                        
                        Button {
                            showViewScreen.toggle()
                        } label: {
                            Text("Previous Scores")
                                .foregroundColor(Color.black)
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
                    
                    //
                    //                LineChart1()
                    //                    .frame(width: 350, height: 400)
                    //                    .padding(.top, 40)
                    //                    .padding(.bottom, 100)
                }
                .toolbar {
                    Button {
                        print("iCloud Profile")
                    } label: {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color("green1"))
                            .font(.title3)
                    }
                }
            }
        }
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

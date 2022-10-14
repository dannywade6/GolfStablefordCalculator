//
//  FormView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject var viewModel: HoleViewModel
    @EnvironmentObject var roundStorage: RoundStorage
    
    @Environment(\.presentationMode) var presentationMode
    
    let strokeIndexArray = Array(1...18)
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color("backgroundgradient1"), Color("backgroundgradient2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                HoleSelectionView()
                
                TabView(selection: $viewModel.whichHole) {
                    ForEach(1..<(viewModel.allHoles.count + 1), id: \.self) { hole in
                        ZStack {
                            VStack {
                                VStack {
                                    Spacer()
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .foregroundColor(.white.opacity(0))
                                            .frame(width: 141)
                                            .overlay(
                                            Circle()
                                                .strokeBorder(LinearGradient(colors: [Color("green1"), Color("green2")], startPoint: .leading, endPoint: .top), lineWidth: 1.5)
                                        )
                                        Circle()
                                            .overlay(
                                                LinearGradient(colors: [Color("green3"), Color("green4")], startPoint: .top, endPoint: .bottom))
                                            .mask(
                                                Circle()
                                            )
                                            .frame(width: 120)
                                        VStack {
                                            Text("\(viewModel.totalScore)")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
//                                                .padding(.bottom, 0.75)
                                            Text("\(viewModel.totalScore == 1 ? "Point" : "Points")")
                                        }
                                        .foregroundColor(.white)
                                    }
                                    .padding(.bottom)
                                    
                                    Spacer()
                                    
                                    Text("Playing Handicap: \(viewModel.handicap)")
                                        .font(.body)
                                        .foregroundColor(Color("grey1"))
                                        
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Divider()
                                    
                                    HStack {
                                        
                                        Text("Current Hole:")
                                            .bold()
                                            .font(.title3)
                                            .foregroundColor(Color("grey1"))
                                            .padding()
                                        
                                        Spacer()
                                        
                                        Text("\(viewModel.holeScore(forHoleNumber: viewModel.whichHole)) \(viewModel.holeScore(forHoleNumber: viewModel.whichHole) == 1 ? "Point" : "Points")")
                                            .foregroundColor(Color("green1"))
                                            .font(.title3)
                                        
                                        
                                        
                                            
                                    }
                                    .frame(width: 250, height: 60)
                                    
                                    Divider()
                                    
                                    HStack {
                                        Picker("Select Par:", selection: $viewModel.allHoles[viewModel.whichHole - 1].par, content: {
                                            Text("Par 3").tag(3)
                                            Text("Par 4").tag(4)
                                            Text("Par 5").tag(5)
                                        })
                                        .pickerStyle(.segmented)
                                        .frame(width: 250, height: 35)
                                        .padding()


                                    }
                                    
                                }
                                
                                VStack {
                                    Divider()
                                        .padding()
                                    
                                    HStack {
                                        Text("Stroke Index")
                                            .font(.title3)
                                            .foregroundColor(Color("grey1"))
                                            .bold()
                                            .padding()
                                        
                                        Picker("Stroke Index", selection: $viewModel.allHoles[viewModel.whichHole - 1].strokeIndex)
                                        {
                                            ForEach(Array(strokeIndexArray), id: \.self) {
                                                Text("\($0)")
                                            }
                                        }
                                        .frame(width: 110, height: 80)
                                        .clipped()
                                        .pickerStyle(WheelPickerStyle())
                                        
                                    }
                                    
                                    Divider()
                                        .padding()
                                    
                                    
                                    HStack {
                                        Text("Strokes Played")
                                            .bold()
                                            .font(.title3)
                                            .foregroundColor(Color("grey1"))
                                            .padding()
                                        Stepper("\(viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed)", value: $viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed, in: 1...11)
                                            .frame(width: 130, height: 40)
                                    }
                                    Spacer()
                                    Divider()
                                        .padding()
                                }
                            }
                            .padding(.top)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("", displayMode: .inline)
                
                ButtonView()
            }
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundStorage())
    }
}

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
        VStack {
            HoleSelectionView()
            
            TabView(selection: $viewModel.whichHole) {
                ForEach(0..<(viewModel.allHoles.count + 1), id: \.self) { hole in
                    ZStack {
                        VStack {
                            VStack {
                                Spacer()
                                
                                Text("\(viewModel.holeScore(forHoleNumber: viewModel.whichHole))")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 0.75)
                                Text("Points")
                                    .font(.title)
                                Spacer()
                                
                                Text("Total Points: \(viewModel.totalScore)")
                                    .font(.title2)
                                    .foregroundColor(Color.gray)
                                    .bold()
                                Text("Playing Handicap: \(viewModel.handicap)")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                            VStack {
                                Divider()
                                
                                HStack {
                                    Picker("Select Par:", selection: $viewModel.allHoles[viewModel.whichHole - 1].par, content: {
                                        Text("Par 3").tag(3)
                                        Text("Par 4").tag(4)
                                        Text("Par 5").tag(5)
                                    })
                                    .pickerStyle(.segmented)
                                    .frame(width: 250, height: 80)
                                }
                            }
                            
                            VStack {
                                Divider()
                                    .padding()
                                
                                
                                HStack {
                                    Text("Stroke Index")
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
                                        .padding()
                                    Stepper("\(viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed)", value: $viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed, in: 1...11)
                                        .frame(width: 130, height: 80)
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


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundStorage())
    }
}

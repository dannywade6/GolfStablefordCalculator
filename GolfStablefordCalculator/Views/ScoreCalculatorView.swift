//
//  ScoreCalculatorView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 23/03/2022.
//

import SwiftUI

struct ScoreCalculatorView: View {

    @State private var strokeIndexNumber = ""
    @State private var pickerBind = 11
    let strokeIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]

    @State var holes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
    @State private var holeParNumber = ["3", "4", "5"]
    @State private var par: Int = 1
    @State private var strokes = 1

    var body: some View {

        TabView {
            ForEach(holes, id: \.self) { hole in

                ZStack {

                    VStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                print("Previous Hole")
                            }, label: {
                                Image(systemName: "arrow.left")
                            })
                            Text("Hole \(hole)")
                                    .font(.headline)
                            Button(action: {
                                print("Next Hole")
                            }, label: {
                                Image(systemName: "arrow.right")
                            })


                        }
                        Spacer()
                        VStack {
                            Spacer()
                            Text("2")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom)
                            Text("Points")
                                .font(.title)
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            Divider()
                            HStack {
                                Text("Par")
                                    .bold()

                                Picker("Par",selection: $par) {
                                    ForEach(0..<holeParNumber.count) {
                                        Text(holeParNumber[$0])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
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

                                Picker("Stroke Index", selection: $pickerBind)
                                {
                                    ForEach(Array(strokeIndex), id: \.self)
                                        {Text("\($0)")}
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
                                    .padding(.horizontal, 40)
                                Stepper("\(strokes)", value: $strokes, in: 1...15)
                                    .frame(width: 130, height: 80)
                            }
                            Spacer()

                            Divider()
                                .padding()
                        }

                            Button(action: {
                                print("Save Score")
                            }, label: {
                                Text("Save Score")
                            })
                        }
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
    }
}

struct ScoreCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCalculatorView()
    }
}

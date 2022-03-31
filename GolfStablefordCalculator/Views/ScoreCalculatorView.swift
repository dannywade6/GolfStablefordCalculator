//
//  ScoreCalculatorView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 23/03/2022.
//

import SwiftUI

struct ScoreCalculatorView: View {

    @State private var pickerBind = 11
    let strokeIndex = Array(1...18)
    @State var holes = Array(1...18)

    @State private var holeParNumber = ["3", "4", "5"]
    @State private var par: Int = 1
    @State private var strokes = 1

    @State var selection = 1

    var body: some View {

        TabView(selection: $selection) {

            ForEach(holes, id: \.self) { hole in

                ZStack {

                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                guard selection > 1 else {
                                    return selection = 1
                                }
                                selection -= 1
                            }, label: {
                                Image(systemName: "arrow.left")
                            })
                            .foregroundColor(.green)
                            Spacer()
                            Text("Hole \(hole)")
                                    .font(.headline)
                            Spacer()
                            Button(action: {
                                guard selection < 18 else {
                                    return selection = 18
                                }
                                selection += 1
                            }, label: {
                                Image(systemName: "arrow.right")
                            })
                            .foregroundColor(.green)
                            Spacer()
                        }

                        Spacer()
                        VStack {
                            Spacer()
                            Text("2")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 0.75)
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
                                    ForEach(0..<3, id: \.self) { holePar in
                                        Text(holeParNumber[holePar])
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
                            .foregroundColor(.green)
                    }
                    .padding(.top)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
    }
}

struct ScoreCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCalculatorView()
    }
}

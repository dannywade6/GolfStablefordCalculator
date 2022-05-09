//
//  HoleScoreCalculator.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 09/05/2022.
//

import SwiftUI

struct HoleScoreCalculator: View {

    @State private var selectedParIndex = 4
    @State private var inputGross = 3

    @State private var selectedStrokeIndex = 9
    let strokeIndexArray = Array(1...18)

    @State var holes = Array(1...18)
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
                            Text("21")
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
                                Picker("Select Par:", selection: $selectedParIndex, content: {
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

                                Picker("Stroke Index", selection: $selectedStrokeIndex)
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
                                Stepper("\(inputGross)", value: $inputGross, in: 1...11)
                                    .frame(width: 130, height: 80)
                            }

                            Spacer()

                            Divider()
                                .padding()
                        }

                        HStack {
                            Spacer()
                            Button(action: {
                                print("Save Score")
                            }, label: {
                                Text("Save Score")
                            })
                            .foregroundColor(.green)
                            Spacer()
                            Button(action: {
                                print("Exit View")
                            }, label: {
                                Text("Exit")
                            })
                            .foregroundColor(.red)
                            Spacer()

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

    }
}

struct HoleScore_Previews: PreviewProvider {
    static var previews: some View {
        HoleScoreCalculator()
    }
}


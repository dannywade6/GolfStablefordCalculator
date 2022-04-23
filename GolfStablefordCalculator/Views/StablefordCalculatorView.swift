//
//  StablefordView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 23/04/2022.
//

import SwiftUI

struct StablefordCalculatorView: View {

    @State private var selectedParIndex = 4
    @State private var inputGross = 1

    @State private var selectedStrokeIndex = 9
    let strokeIndexArray = Array(1...18)

    @State var holes = Array(1...18)
    @State var selection = 1

    let handicap = 21

    var calculatePoints: Int {

        let gross = Int(inputGross)
        let strokeIndex = Int(selectedStrokeIndex)
//        let handicap = Int(inputHandicap)
        let par = Int(selectedParIndex)

        var net: Int = 0
        var points: Int = 0

        if handicap <= 18 {
                if handicap - strokeIndex >= 0 {
                    net = (gross - 1)
                }
                else {
                    net = gross
                }
            }

        if handicap > 18 {
                if (handicap - 18) - strokeIndex >= 0 {
                    net = (gross - 2)
                }
                else {
                    net = (gross - 1)
                }
            }

            switch net {
            case _ where net >= par + 2:
                points = 0
                return points

            case _ where net == par + 1:
                points = 1
                return points

            case _ where net == par:
                points = 2
                return points

            case _ where net == par - 1:
                points = 3
                return points

            case _ where net == par - 2:
                points = 4
                return points

            case _ where net == par - 3:
                points = 5
                return points

            case _ where net == par - 4:
                points = 6
                return points

            default:
                points = 0
                return points
    }
}

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
                            Text("\(calculatePoints)")
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
    }
}

struct StablefordView_Previews: PreviewProvider {
    static var previews: some View {
        StablefordCalculatorView()
    }
}

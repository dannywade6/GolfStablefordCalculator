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

    @State private var gamesAmount = ["3", "4", "5"]
    @State private var game: Int = 1
    @State private var number = 1

    var body: some View {

        VStack {
            Spacer()
            HStack {
                Image(systemName: "arrow.left")
                Text("Hole 1")
                    .font(.headline)
                Image(systemName: "arrow.right")
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

                    Picker("Par",selection: $game) {
                        ForEach(0..<gamesAmount.count) {
                            Text(gamesAmount[$0])
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
                    Stepper("\(number)", value: $number, in: 1...15)
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



























struct ScoreCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCalculatorView()
    }
}

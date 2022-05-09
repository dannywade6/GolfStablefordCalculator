//
//  CreateScore.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 09/05/2022.
//

import SwiftUI

struct CreateScore: View {

    @State var pointsTitle = 0
    @State var courseTitle = ""

    @State var selectedDate = Date()

    @State var inputHandicap = 0

    @State var whiteScale: CGFloat = 1
    @State var yellowScale: CGFloat = 1
    @State var redScale: CGFloat = 1
    @State var blueScale: CGFloat = 1

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var roundStorage: RoundStorage

    @State var isShown = false

    var body: some View {
        List {
            Section {
                TextField("Golf Course Name:", text: $courseTitle)
            }
            Section {
                HStack {
                    Text("Select Date:")
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    Spacer()
                }
            }
            Section {
                HStack {
                    Text("Handicap:")
                    Spacer()
                    TextField("Handicap", value: $inputHandicap, formatter: NumberFormatter())
                }
            }

            Section {
                HStack {
                    Text("Select Tee: ")
                    Spacer()

                    Button(action: {
                        whiteScale += 2
                    }) {
                        Circle()
                            .strokeBorder(Color.black, lineWidth: whiteScale)
                            .background(Circle().foregroundColor(Color.white))
                            .frame(width: 40, height: 30)
                    }
                    Button(action: {
                        yellowScale += 2
                    }) {
                        Circle()
                            .strokeBorder(Color.black, lineWidth: yellowScale)
                            .background(Circle().foregroundColor(Color.yellow))
                            .frame(width: 40, height: 30)
                    }
                    Button(action: {
                        redScale += 2
                    }) {
                        Circle()
                            .strokeBorder(Color.black, lineWidth: redScale)
                            .background(Circle().foregroundColor(Color.red))
                            .frame(width: 40, height: 30)
                    }
                    Button(action: {
                        blueScale += 2
                    }) {
                        Circle()
                            .strokeBorder(Color.black, lineWidth: blueScale)
                            .background(Circle().foregroundColor(Color.blue))
                            .frame(width: 40, height: 30)
                    }
                }
            }

            Section {
                NavigationLink(destination: HoleScoreCalculator()) {
                    Text("Start Scoring")
                }
            }

            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        self.roundStorage.rounds.append(Round(points: self.pointsTitle, course: self.courseTitle, date: self.selectedDate))
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    //                    .disabled(pointsTitle.isEmpty)
                    Spacer()
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

    }
}

struct CreateScore_Previews: PreviewProvider {
    static var previews: some View {
        CreateScore().environmentObject(RoundStorage())
    }
}


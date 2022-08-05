//
//  CreateNewRound.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct CreateNewRound: View {
    
    @EnvironmentObject var viewModel: HoleViewModel

    @State var golfCourseName: String = ""
    @State var selectedDate = Date()
    @State var inputHandicap: Int = 0

    @State var yellowTee: Bool = false
    @State var blueTee: Bool = false
    @State var whiteTee: Bool = false
    @State var redTee: Bool = false

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()

    @Environment(\.presentationMode) var presentationMode
    @State var showScoringSheet: Bool = false

    var body: some View {

        NavigationView {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 15) {


                    Text("Golf Course Name:")
                        .font(.title)
                        .fontWeight(.semibold)


                    TextField("Enter Golf Course", text: $golfCourseName)


                    HStack {
                        Text("Date:")
                            .font(.title)
                        .fontWeight(.semibold)
                        
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    }
                    .padding(.vertical, 2)

                    HStack {
                        Text("Handicap:")
                            .font(.title)
                        .fontWeight(.semibold)

                        TextField("Handicap", value: $viewModel.handicap, formatter: NumberFormatter())
                            .font(.title2)
                            .padding(.top, 2)
                    }

                    Text("Tee:")
                        .font(.title)
                        .fontWeight(.semibold)

                    HStack {
                        Button {
                            redTee.toggle()
                            yellowTee = false
                            whiteTee = false
                            blueTee = false
                            
                        } label: {
                            if redTee {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    )
                            } else {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }


                        Button {
                            yellowTee.toggle()
                            redTee = false
                            whiteTee = false
                            blueTee = false
                        } label: {
                            if yellowTee {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    )
                            } else {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }


                        Button {
                            whiteTee.toggle()
                            redTee = false
                            yellowTee = false
                            blueTee = false
                        } label: {
                            if whiteTee {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                            .font(.headline)
                                    )
                            } else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }


                        Button {
                            blueTee.toggle()
                            redTee = false
                            yellowTee = false
                            whiteTee = false
                        } label: {
                            if blueTee {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    )
                            } else {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
                .padding()
                Spacer()
                Spacer()

                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Exit")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                Capsule()
                                    .stroke(Color.red, lineWidth: 2.0)
                            )
                    }
                    Button {
                        showScoringSheet.toggle()
                    } label: {
                        Text("Start Scoring")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                Capsule()
                                    .stroke(Color.green, lineWidth: 2.0)
                            )
                    }

                    .fullScreenCover(isPresented: $showScoringSheet) {
                        FormView()
                    }
                }
                .padding(.bottom, 10)
            }
            .navigationTitle("Create Round")
        }
    }
}

struct CreateNewRound_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewRound()
            .environmentObject(HoleViewModel())
    }
}

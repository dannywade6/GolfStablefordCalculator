//
//  CreateNewRound.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct CreateNewRound: View {
    
    var body: some View {
        
//        NavigationView {
            ZStack {
                
                //MARK: - Background
                
                LinearGradient(colors: [Color("background1"), Color("background2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                //MARK: - Content
                
                VStack {
                    NewRoundContent()
                    NewRoundButtons()           
                }
            }
//        }
    }
}

struct CreateNewRound_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewRound()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundViewModel())
            .environmentObject(RoundStorage())
    }
}

struct NewRoundContent: View {
    
    @EnvironmentObject var viewModel: HoleViewModel
    @EnvironmentObject var roundViewModel: RoundViewModel
    @EnvironmentObject var roundStorage: RoundStorage
    
    
    @State var golfCourseName: String = ""
    @State var selectedDate = Date()
    @State var inputHandicap: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    @State var showScoringSheet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                //MARK: - Course Name
                HStack {
                    Text("Golf Course Name:")
                        .foregroundColor(Color("text1"))
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    Image("flag.icon")
                        .padding()
                    TextField("Augusta National (Ga.) G.C.",
                              text: $roundViewModel.courseName)
                    .foregroundColor(Color(UIColor(red: 0.47, green: 0.51, blue: 0.54, alpha: 1)))
                }
                .frame(width: 327, height: 62)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                .shadow(radius: 0.5)
                
                //MARK: - Date
                
                HStack {
                    Text("Date:")
                        .foregroundColor(Color("text1"))
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    Image("date.icon")
                        .padding()
                    DatePicker("", selection: $roundViewModel.date, displayedComponents: .date)
                        .foregroundColor(Color(UIColor(red: 0.47, green: 0.51, blue: 0.54, alpha: 1)))
                        .padding()
                    Spacer()
                }
                .frame(width: 327, height: 62)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                .shadow(radius: 0.5)
                
                //MARK: - Handicap
                
                HStack {
                    Text("Handicap:")
                        .foregroundColor(Color("text1"))
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    Picker("Handicap", selection: $inputHandicap) {
                        ForEach(0...28, id:\.self) { handicap in
                            Text("\(handicap)")
                        }
                    }
                }
                .scaleEffect(1.2)
                .frame(width: 327, height: 62)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                .shadow(radius: 0.5)
                
                //MARK: - Tee
                
                HStack {
                    Text("Tee:")
                        .foregroundColor(Color("text1"))
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    Button {
                        roundViewModel.redTee.toggle()
                        roundViewModel.yellowTee = false
                        roundViewModel.whiteTee = false
                        roundViewModel.blueTee = false
                        
                    } label: {
                        if roundViewModel.redTee {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("teeRed1"))
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                )
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("teeRed1"))
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Button {
                        roundViewModel.yellowTee.toggle()
                        roundViewModel.redTee = false
                        roundViewModel.whiteTee = false
                        roundViewModel.blueTee = false
                    } label: {
                        if roundViewModel.yellowTee {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("teeYellow1"))
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                )
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("teeYellow1"))
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Button {
                        roundViewModel.whiteTee.toggle()
                        roundViewModel.redTee = false
                        roundViewModel.yellowTee = false
                        roundViewModel.blueTee = false
                    } label: {
                        if roundViewModel.whiteTee {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                )
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Button {
                        roundViewModel.blueTee.toggle()
                        roundViewModel.redTee = false
                        roundViewModel.yellowTee = false
                        roundViewModel.whiteTee = false
                    } label: {
                        if roundViewModel.blueTee {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("teeBlue1"))
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                )
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color("teeBlue1"))
                                .frame(width: 51, height: 49)
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                //MARK: - Buttons
                
                Spacer()
                
                
            }
            .padding(.horizontal)
        }
    }
}

struct NewRoundButtons: View {
    
    @State var showScoringSheet: Bool = false
    @State var showHomeScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack {
                Button {
                    showScoringSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "star.circle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Start Scoring")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                    .frame(width: 327, height: 64)
                    .background(
                        LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top))
                    .cornerRadius(18)
                }
                .fullScreenCover(isPresented: $showScoringSheet) {
                    FormView()
                }
                
                Button {
                    //                    presentationMode.wrappedValue.dismiss()
                    showHomeScreen.toggle()
                } label: {
                    Text("Exit")
                        .foregroundColor(Color("red1"))
                        .fontWeight(.semibold)
                        .font(.title3)
                        .frame(width: 327, height: 64)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .strokeBorder(LinearGradient(colors: [Color("red2"), Color("red3")], startPoint: .leading, endPoint: .top), lineWidth: 1.5)
                        )
                }
                .padding(.bottom, 15)
                .fullScreenCover(isPresented: $showHomeScreen) {
                    HomeView()
                }
            }
        }
    }
}

//
//  CreateNewRound.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 05/08/2022.
//

import SwiftUI

struct CreateNewRound: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        // MARK: - Background
        ZStack {
            LinearGradient(colors: [Color("backgroundgradient1"), Color("backgroundgradient2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.1)
                .ignoresSafeArea()
            
            // MARK: - Content
            VStack {
                NewRoundContent()
                NewRoundButtons()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
                        self.mode.wrappedValue.dismiss()
                    }){
                        HStack {
                            Image(systemName: "arrow.left")
                                .font(.headline)
                            Text("Create Round")
                                .padding(.leading, 15)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(Color("text1"))
                        
                    })
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
    
    @ObservedObject var keyboardResponder = KeyboardResponder()

    
    @State var golfCourseName: String = ""
    @State var selectedDate = Date()
    @State var inputHandicap: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    @State var showScoringSheet: Bool = false
    
    
    
    var body: some View {
        VStack {
            
            Spacer()
            
            //MARK: - Course Name
            VStack {
                HStack {
                    Text("Golf Course Name:")
                        .foregroundColor(Color("text1"))
                        .font(.headline)
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
                
            }
            .padding(.top, 10)
            .offset(y: keyboardResponder.currentHeight)
            
            //MARK: - Date
            
            VStack {
                HStack {
                    Text("Date:")
                        .foregroundColor(Color("text1"))
                        .font(.headline)
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
                .accentColor(Color("green1"))
                .frame(width: 327, height: 62)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                .shadow(radius: 0.5)
                
                //MARK: - Handicap
                
                HStack {
                    Text("Handicap:")
                        .foregroundColor(Color("text1"))
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    Picker("Handicap", selection: $viewModel.handicap) {
                        ForEach(0...28, id:\.self) { handicap in
                            Text("\(handicap)")
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(width: 327, height: 84)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                .shadow(radius: 0.5)
                .pickerStyle(.wheel)
                .clipped()
                
                
                //MARK: - Tee
                
                HStack {
                    Text("Tee:")
                        .foregroundColor(Color("text1"))
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                TeeView()
                
                Spacer()
            }
            .offset(y: keyboardResponder.currentHeight*3)
        }
        .padding(.horizontal)
        .padding()

    }
}




struct NewRoundButtons: View {
    
    @State var showScoringSheet: Bool = false
    @State var showHomeScreen: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
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
                                        presentationMode.wrappedValue.dismiss()
//                    showHomeScreen.toggle()
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
//                .fullScreenCover(isPresented: $showHomeScreen) {
//                    HomeView()
//                }
            }
        }
        .offset(y: keyboardResponder.currentHeight*3)
    }
}

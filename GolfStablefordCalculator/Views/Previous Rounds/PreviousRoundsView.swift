//
//  PreviousRoundsView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 06/08/2022.
//

import SwiftUI

struct PreviousRoundsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var roundStorage: RoundStorage
    @EnvironmentObject var roundViewModel: RoundViewModel
    @EnvironmentObject var viewModel: HoleViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color("backgroundgradient1"), Color("backgroundgradient2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                
                VStack {
                    ScrollView {
                        VStack {
                            if roundStorage.rounds.isEmpty {
                                RoundsEmptyView()
                                    .frame(width: 350, height: 400)
                                    .padding(.top, 40)
                                    .padding(.bottom, 100)
                            } else {
                                ForEach(roundStorage.rounds) { round in
                                    GroupBox() {
                                        DisclosureGroup(
                                            content: {
                                                VStack {
                                                    VStack {
                                                        Divider().padding(.vertical, 2)
                                                        HStack {
                                                            Text("Points:")
                                                                .font(.title3)
                                                            Spacer()
                                                            Text("\(round.points) Points")
                                                                .foregroundColor(Color("grey1"))
                                                                .padding(3)
                                                                .font(.headline)
                                                                .fontWeight(.regular)
                                                        }
                                                        
                                                        Divider().padding(.vertical, 2)
                                                        HStack {
                                                            Text("Date:")
                                                                .font(.title3)
                                                            
                                                            Spacer()
                                                            
                                                            Text("\(round.date)")
                                                                .foregroundColor(Color("grey1"))
                                                                .padding(3)
                                                                .font(.headline)
                                                                .fontWeight(.regular)
                                                                .padding(3)
                                                            
                                                        }
                                                        
                                                        Divider().padding(.vertical, 2)
                                                        HStack {
                                                            Text("Handicap:")
                                                                .font(.title3)
                                                            
                                                            Spacer()
                                                            Text("\(round.handicap)")
                                                                .foregroundColor(Color("grey1"))
                                                                .padding(3)
                                                                .font(.headline)
                                                                .fontWeight(.regular)
                                                        }
                                                        
                                                        Divider().padding(.vertical, 2)
                                                        
                                                        HStack {
                                                            Text("Tee: ")
                                                                .font(.title3)
                                                            
                                                            Spacer()
                                                            
                                                            RoundedRectangle(cornerRadius: 3)
                                                                .foregroundColor(teeColor(color: round.selectedTee.rawValue))
                                                                .frame(width: 25, height: 25)
                                                                .shadow(radius: 2)
                                                        }
                                                    }
                                                }
                                            }, label: {
                                                
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        Text("\(round.courseName)")
                                                            .font(.title2)
                                                            .foregroundColor(Color("grey1"))
                                                            .bold()
                                                        
                                                        Text("\(round.points) Points")
                                                            .font(.title3)
                                                            .foregroundColor(Color("green2"))
                                                    }
                                                    
                                                    Spacer()
                                                    Text("\(round.date)")
                                                        .font(.title2)
                                                        .foregroundColor(Color("green1"))
                                                        .fontWeight(.semibold)
                                                    
                                                }
                                            }
                                        )
                                        .accentColor(Color("green2"))
                                        
                                    }
                                    .overlay(
                                        DeleteButton(round: round, rounds: $roundStorage.rounds, onDelete: removeRows)
                                        , alignment: .topTrailing)
                                    
                                }
                                .onDelete(perform: removeRows)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 15)
                            }
                        }
                        
                        .navigationTitle("Previous Rounds")
                        
                        .navigationBarItems(trailing:
                                                EditButton()
                            .bold()
                            .font(.headline)
                            .foregroundColor(Color("grey1"))
                                            
                        )
                    }
                    Button {
                        print("NavigationLink to HomeView()")
                    } label: {
                        NavigationLink(destination: HomeView()) {
                            Text("Exit")
                                .foregroundColor(Color("red1"))
                                .fontWeight(.semibold)
                                .font(.title3)
                                .frame(width: 100, height: 53)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .strokeBorder(LinearGradient(colors: [Color("red2"), Color("red3")], startPoint: .leading, endPoint: .top), lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(10)
                }
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        withAnimation {
            roundStorage.rounds.remove(atOffsets: offsets)
        }
    }
    
    func teeColor(color: String) -> Color {
        if color == "Red" {
            return Color("teeRed1")
        } else if color == "Yellow" {
            return Color("teeYellow1")
        } else if color == "White" {
            return Color.white
        } else {
            return Color("teeBlue1")
        }
    }
}


struct DeleteButton: View {
    
    @Environment(\.editMode) var editMode
    
    let round: Round
    @Binding var rounds: [Round]
    let onDelete: (IndexSet) -> ()
    
    var body: some View {
        VStack {
            if self.editMode?.wrappedValue == .active {
                Button(action: {
                    if let index = rounds.firstIndex(of: round) {
                        self.onDelete(IndexSet(integer: index))
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                        .padding(.trailing, 4)
                }
                .offset(x: 10, y: -10)
            }
        }
    }
}

struct PreviousRoundsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousRoundsView()
            .environmentObject(HoleViewModel())
            .environmentObject(RoundStorage())
            .environmentObject(RoundViewModel())
    }
}

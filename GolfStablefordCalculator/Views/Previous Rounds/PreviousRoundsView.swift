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
                            ForEach(roundStorage.rounds, id: \.id) { round in
                                GroupBox() {
                                    DisclosureGroup(
                                        content: {
                                            VStack {
                                                VStack {
                                                    Divider().padding(.vertical, 2)
                                                    HStack {
                                                        
                                                        Text("Points:")
                                                            .bold()
                                                        Spacer()
                                                        Text("\(round.points)")
                                                            .bold()
                                                            .padding(3)
                                                    }
                                                    
                                                    Divider().padding(.vertical, 2)
                                                    HStack {
                                                        Text("Date:")
                                                            .bold()
                                                        Spacer()
                                                        
                                                        Text("\(round.date)")
                                                            .padding(3)
                                                        //                                                        .bold()
                                                        
                                                    }
                                                    
                                                    Divider().padding(.vertical, 2)
                                                    HStack {
                                                        Text("Handicap:")
                                                            .bold()
                                                        Spacer()
                                                        Text("\(round.handicap)")
                                                            .padding(3)
                                                        
                                                    }
                                                    
                                                    Divider().padding(.vertical, 2)
                                                    
                                                    HStack {
                                                        Text("Tee: ")
                                                            .bold()
                                                        
                                                        Spacer()
                                                        
                                                        Text(round.selectedTee.rawValue)
                                                    }
//                                                                                              .frame(width: 25, height: 25)
                                                }
                                            }
                                        }, label: {
                                            Text("\(round.courseName)")
                                                .font(.title3)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text("\(round.points) Points")
                                                .font(.title2)
                                                .bold()
                                                .foregroundColor(.green)
                                                .padding()
                                            
                                        }
                                    )
                                    .accentColor(.green)
                                    
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
                    .navigationBarItems(trailing: EditButton().foregroundColor(.red))
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Exit")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                Capsule()
                                    .stroke(Color.red, lineWidth: 2.0))
                    })
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

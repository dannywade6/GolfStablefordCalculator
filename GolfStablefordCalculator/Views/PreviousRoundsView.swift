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
            VStack {
                ScrollView {
                    VStack {
                        ForEach(roundStorage.rounds) { rounds in
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
                                                    Text("\(rounds.points)")
                                                    
                                                        .bold()
                                                        .padding(3)
                                                }
                                                
                                                Divider().padding(.vertical, 2)
                                                HStack {
                                                    Text("Date:")
                                                        .bold()
                                                    Spacer()
                                                    
                                                    Text("\(rounds.date)")
                                                        .padding(3)
                                                    
                                                }
                                                
                                                Divider().padding(.vertical, 2)
                                                HStack {
                                                    Text("Handicap:")
                                                        .bold()
                                                    Spacer()
                                                    Text("\(rounds.handicap)")
                                                        .padding(3)
                                                    
                                                }
                                                
                                                Divider().padding(.vertical, 2)
                                                HStack {
                                                    Text("Tee:")
                                                        .bold()
                                                    Spacer()
                                                    
                                                    if rounds.redTee {
                                                        Circle()
                                                            .fill(Color.red)
                                                            .frame(width: 25, height: 25)
                                                            .shadow(radius: 2)
                                                            .padding(3)
                                                    }
                                                    
                                                    if rounds.blueTee {
                                                        Circle()
                                                            .fill(Color.blue)
                                                            .frame(width: 25, height: 25)
                                                            .shadow(radius: 2)
                                                            .padding(3)
                                                    }
                                                    
                                                    if rounds.whiteTee {
                                                        Circle()
                                                            .fill(Color.white)
                                                            .frame(width: 25, height: 25)
                                                            .shadow(radius: 2)
                                                            .padding(3)
                                                    }
                                                    
                                                    if rounds.yellowTee {
                                                        Circle()
                                                            .fill(Color.yellow)
                                                            .frame(width: 25, height: 25)
                                                            .shadow(radius: 2)
                                                            .padding(3)
                                                    }
                                                }
                                            }
                                        }
                                    }, label: {
                                        Text("\(rounds.courseName)")
                                            .font(.title3)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("\(rounds.points) Points")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.green)
                                            .padding()
                                        
                                    }
                                )
                                .accentColor(.green)
                                
                            }
                            .overlay(
                                DeleteButton(),
                                alignment: .topTrailing
                            )
                            
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
    
    func removeRows(at offsets: IndexSet) {
        withAnimation {
            roundStorage.rounds.remove(atOffsets: offsets)
        }
    }
}

struct DeleteButton: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var roundStorage: RoundStorage
    
    var body: some View {
        VStack {
            if self.editMode?.wrappedValue == .active {
                Button {
//                    roundStorage.rounds.remove(at: )
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                        .padding(.trailing, 4)
                }
                .offset(x: 10, y: -10)

            }
        }
    }
    func delete(indexSet: IndexSet) {
        roundStorage.rounds.remove(atOffsets: indexSet)
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

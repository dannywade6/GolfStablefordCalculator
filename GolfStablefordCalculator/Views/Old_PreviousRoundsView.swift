////
////  PreviousRoundsView.swift
////  GolfStablefordCalculator
////
////  Created by Danny Wade on 05/08/2022.
////
//
//import SwiftUI
//
//struct PreviousRoundsView: View {
//    
//    @Environment(\.presentationMode) var presentationMode
//    
//    @EnvironmentObject var roundStorage: RoundStorage
//    
//    var body: some View {
//        NavigationView {
//            List {
//                Section(
//                    header:
//                        HStack {
//                            Text("Rounds")
//                        }
//                        .font(.headline)
//                        .foregroundColor(.green)
//                        .padding(.bottom, 5)
//                ) {
//                    
//                    ForEach(roundStorage.rounds) { round in
//                        HStack {
//                            Text("\(round.points) Points")
//                                .bold()
//                        }
//                    }
//                    .onDelete(perform: delete)
//                    .onMove(perform: move)
//                    
//                }
//            }
//            .accentColor(.white)
//            .listStyle(InsetGroupedListStyle())
//            .navigationTitle("Previous Rounds")
//            
//            .toolbar {
//                Button {
//                    presentationMode.wrappedValue.dismiss()
//                } label: {
//                    HStack {
//                        Text("Exit")
//                            .padding(.horizontal, 4)
//                            .font(.headline)
//                    }
//                }
//            }
//            
//        }
//        .accentColor(.red)
//    }
//    
//    func delete(indexSet: IndexSet) {
//        roundStorage.rounds.remove(atOffsets: indexSet)
//    }
//    
//    func move(indces: IndexSet, newOffset: Int) {
//        roundStorage.rounds.move(fromOffsets: indces, toOffset: newOffset)
//    }
//}
//
//struct PreviousRoundsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviousRoundsView()
//            .environmentObject(HoleViewModel())
//            .environmentObject(RoundStorage())
//    }
//}

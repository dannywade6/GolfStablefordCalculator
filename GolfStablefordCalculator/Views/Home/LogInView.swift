//
//  LogInView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 03/10/2022.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color("backgroundgradient1"), Color("backgroundgradient2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("AppIconLogin")
                    
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 150)
                    
                    .shadow(radius: 10)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Stableford")
                            .font(.title)
                            .fontWeight(.light)
                            .padding(.trailing, -3)
                        Text("Golf")
                            .font(.title)
                            .bold()
                            .overlay {
                                LinearGradient(colors: [Color("green2"), Color("green1")], startPoint: .leading, endPoint: .top
                                )
                                .mask(
                                    Text("Golf")
                                        .font(.title)
                                        .bold()
                                )
                        }
                    }
                }
                
                VStack {
                    VStack {
                            
                        Text("Sign in to continue:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -8.0)
                    }
                    .padding(.bottom, 30)

                    
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Continue with Apple")
                    }
                    .font(.callout)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .frame(width: 200, height: 50)
                    .background(Color.white)
                    .cornerRadius(7)
                    .shadow(radius: 10)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Sign up with Apple")
                    }
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(7)
                    .shadow(radius: 10)
                }

                Spacer()
                
                VStack {
                    Text("Stableford Golf")
                    Text("Developed by Danny Wade")
                }
                .foregroundColor(Color("green1"))
                .font(.caption2)
                    
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

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
            LinearGradient(colors: [Color("green1"), Color("green2")], startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
//                Image(systemName: "photo.circle")
                Image("AppIconLogin")
                    
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 150)
                    
                    .shadow(radius: 10)
                
                Spacer()
                
                VStack {
                    VStack {
                        Text("Welcome to Golf Scoring")
                            .font(.headline)
                            .foregroundColor(.white)
                            
                        Text("Sign in to continue")
                            .font(.subheadline)
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
                    Text("Golf Scoring")
                    Text("Wade Development 2022")
                        
                }
                .foregroundColor(.white)
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

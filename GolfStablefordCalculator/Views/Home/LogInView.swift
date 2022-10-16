//
//  LogInView.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 03/10/2022.
//

import SwiftUI
import AuthenticationServices

struct LogInView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("surname") var surname: String = ""
    @AppStorage("userId") var userId: String = ""
    
    
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
                    
                    
                    Text("Sign in to continue:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, -8.0)
                        .padding(.bottom, 30)
                    
                    SignInWithAppleButton(.continue) { request in
                        
                        request.requestedScopes = [.email, .fullName]
                        
                    } onCompletion: { result in
                        
                        switch result {
                        case .success(let auth):
                            
                            switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                
                                // User ID
                                let userID = credential.user
                                
                                //User Info
                                let email = credential.email
                                let firstName = credential.fullName?.givenName
                                let surname = credential.fullName?.familyName
                                
                                self.email = email ?? ""
                                self.userId = userID
                                self.firstName = firstName ?? ""
                                self.surname = surname ?? ""
                                
                            default:
                                break
                            }
                        case .failure(let error):
                            print(error)
                        }
                        
                    }
                    .signInWithAppleButtonStyle(
                        colorScheme == .dark ? .white : .black
                    )
                    .frame(width: 200, height: 50)
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

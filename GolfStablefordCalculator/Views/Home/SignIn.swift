//
//  SignIn.swift
//  GolfStablefordCalculator
//
//  Created by Danny Wade on 15/10/2022.
//

import SwiftUI
import AuthenticationServices

struct SignIn: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("surname") var surname: String = ""
    @AppStorage("userId") var userId: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
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
                .frame(height: 50)
                .padding()
                .cornerRadius(8)
            }
            .navigationTitle("Sign In")
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

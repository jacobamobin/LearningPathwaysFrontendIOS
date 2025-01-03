//
//  Login .swift
//  LearningPathwaysFrontendIOS
//
//  Created by Jacob Mobin on 2025-01-02.
//

import SwiftUI

struct AuthView: View {
    @State private var isSignUp = false // Toggle between Sign In and Sign Up
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false // For password visibility toggle

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text(isSignUp ? "Create an Account" : "Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(isSignUp ? "Sign up to get started" : "Sign in to continue")
                .foregroundColor(.gray)

            // Input Fields
            Group {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

                if isSignUp {
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
            }

            // Action Button
            Button(action: {
                handleAuthAction()
            }) {
                Text(isSignUp ? "Sign Up" : "Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            // Toggle between Sign In and Sign Up
            Button(action: {
                withAnimation {
                    isSignUp.toggle()
                }
            }) {
                Text(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
    }

    func handleAuthAction() {
        if isSignUp {
            // Handle Sign Up logic here
            print("Signing Up with email: \(email)")
        } else {
            // Handle Sign In logic here
            print("Signing In with email: \(email)")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}


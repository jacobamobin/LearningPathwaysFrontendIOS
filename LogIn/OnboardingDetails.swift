//
//  OnboardingDetails.swift
//  LearningPathwaysFrontendIOS
//
//  Created by Jacob Mobin on 2025-01-02.
//

import SwiftUI
import PhoneNumberKit
import iPhoneNumberField

struct OnboardingDetails: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var emailAddress: String = ""
    @State private var age: String = ""
    @State private var currentPage: Int = 0

    var body: some View {
        ZStack {
            if currentPage == 0 {
                OnboardingCombinedPage(title: "What's your name?", firstName: $firstName, lastName: $lastName, action: nextPage, backAction: previousPage)
                    .transition(.opacity)
            } else if currentPage == 1 {
                OnboardingPage(title: "What's your email address?", placeholder: "Email Address", text: $emailAddress, keyboardType: .emailAddress, action: nextPage, backAction: previousPage)
                    .transition(.opacity)
            } else if currentPage == 2 {
                OnboardingPhonePage(title: "What's your phone number?", phoneNumber: $phoneNumber, keyboardType: .phonePad, action: nextPage, backAction: previousPage)
                    .transition(.opacity)
            } else if currentPage == 3 {
                OnboardingPage(title: "How old are you?", placeholder: "Age", text: $age, keyboardType: .numberPad, action: submit, backAction: previousPage)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: currentPage)
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
    }

    private func nextPage() {
        if currentPage < 3 {
            currentPage += 1
        }
    }

    private func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }

    private func submit() {
        print("First Name: \(firstName), Last Name: \(lastName), Phone: \(phoneNumber), Email: \(emailAddress), Age: \(age)")
    }
}

struct OnboardingPhonePage: View {
    let title: String
    @Binding var phoneNumber: String
    var keyboardType: UIKeyboardType = .phonePad
    let action: () -> Void
    let backAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Spacer()

            Text(title)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom, -5)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 70)
                    .padding(15)
                    .foregroundStyle(Color(UIColor.secondarySystemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                iPhoneNumberField("Phone", text: $phoneNumber)
                    .flagHidden(false)
                    .flagSelectable(true)
                    .font(UIFont(size: 30, weight: .bold, design: .rounded))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .onChange(of: phoneNumber) {
                            if phoneNumber.count > 15 {
                                phoneNumber = String(phoneNumber.prefix(15))
                            }
                        }
            }
            
            


            HStack(spacing: 16) {
                Button(action: { backAction?() }) {
                    Text("Back")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }

                Button(action: action) {
                    Text("Next")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

struct OnboardingCombinedPage: View {
    let title: String
    @Binding var firstName: String
    @Binding var lastName: String
    let action: () -> Void
    let backAction: (() -> Void)?

    var body: some View {
        VStack {
            Spacer()

            Text(title)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom, 20)

            TextField("First Name", text: $firstName)
                .font(.system(size: 18, weight: .medium))
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
                .padding(.horizontal)
                .padding(.bottom, 10)

            TextField("Last Name", text: $lastName)
                .font(.system(size: 18, weight: .medium))
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
                .padding(.horizontal)
                .padding(.bottom, 20)

            HStack(spacing: 16) {
                Button(action: { backAction?() }) {
                    Text("Back")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }

                Button(action: action) {
                    Text("Next")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

struct OnboardingPage: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    let action: () -> Void
    let backAction: (() -> Void)?

    var body: some View {
        VStack {
            Spacer()

            Text(title)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom, 20)

            TextField(placeholder, text: $text)
                .font(.system(size: 18, weight: .medium))
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
                .padding(.horizontal)
                .padding(.bottom, 20)
                .keyboardType(keyboardType)

            HStack(spacing: 16) {
                Button(action: { backAction?() }) {
                    Text("Back")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }

                Button(action: action) {
                    Text("Next")
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnboardingDetails()
}



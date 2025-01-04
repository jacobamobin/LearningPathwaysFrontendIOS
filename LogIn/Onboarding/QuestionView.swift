//
//  QuestionView.swift
//  LearningPathwaysFrontendIOS
//
//  Created by Jacob Mobin on 2025-01-03.
//

import SwiftUI

struct QuestionView: View {
    let topic: String
    let subtopic: String
    
    var body: some View {
        VStack {
            Text("Your Selection")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Topic: \(topic)")
                    .font(.headline)
                
                Text("Subtopic: \(subtopic)")
                    .font(.headline)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal)
            
            Spacer()
            
            Text("The next screen will feature 10 questions.")
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.15), Color.purple.opacity(0.15)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
        .navigationTitle("Confirmation")
        .navigationBarBackButtonHidden(true)
    }
}

struct questionData {
    let ITquestions: [String] = []
    let LAWquestions: [String] = []
}

#Preview {
    QuestionView(topic: "Information Technology", subtopic: "Networking")
}


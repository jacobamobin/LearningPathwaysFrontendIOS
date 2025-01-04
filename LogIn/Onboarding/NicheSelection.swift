//
//  NicheSelection.swift
//  LearningPathwaysFrontendIOS
//
//  Created by Jacob Mobin on 2025-01-03.
//

import SwiftUI

struct NicheSelection: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Select a topic to begin (You can add/modify this later)")
                    .font(.subheadline)
                VStack(spacing: 20) {
                    NicheCard(topic: "Information Technology",
                              image: "desktopcomputer",
                              sfSymbol: "cpu",
                              subtopics: ["Data", "Software Development", "Networking", "Cybersecurity"])
                    
                    NicheCard(topic: "Law",
                              image: "scales",
                              sfSymbol: "doc.text",
                              subtopics: ["Criminal Law", "Corporate Law", "Family Law", "Environmental Law"])
                }
                .padding()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
            .navigationTitle("Interests")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NicheCard: View {
    let topic: String
    let image: String
    let sfSymbol: String
    let subtopics: [String]
    
    var body: some View {
        NavigationLink(destination: SubtopicSelectionView(topic: topic, subtopics: subtopics)) {
            HStack {
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: sfSymbol)
                        .foregroundColor(.white)
                        .font(.title)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(topic)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("\(subtopics.count) subtopics")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal)
        }
    }
}

struct SubtopicSelectionView: View {
    let topic: String
    let subtopics: [String]
    @State private var selectedSubtopic: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose a Subtopic")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.bottom, 5)
            
            Text("Select a subtopic under \(topic) to explore in more detail.")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(subtopics, id: \.self) { subtopic in
                        Button(action: {
                            withAnimation {
                                selectedSubtopic = subtopic
                            }
                        }) {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(selectedSubtopic == subtopic ? Color.blue : Color(.systemGray4))
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "doc.text")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(subtopic)
                                        .font(.headline)
                                        .foregroundColor(selectedSubtopic == subtopic ? .white : .primary)
                                    Text("Dive deeper into \(subtopic).")
                                        .font(.subheadline)
                                        .foregroundColor(selectedSubtopic == subtopic ? .white.opacity(0.8) : .secondary)
                                }
                                
                                Spacer()
                                
                                if selectedSubtopic == subtopic {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(selectedSubtopic == subtopic ? Color.blue : Color(.systemGray6))
                            .cornerRadius(15)
                            .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            Spacer()
            
            if let selectedSubtopic = selectedSubtopic {
                NavigationLink(destination: QuestionView(topic: topic, subtopic: selectedSubtopic)) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.15), Color.purple.opacity(0.15)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
    }
}

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
            
            // Placeholder for questions
            Text("The next screen will feature 10 questions.")
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.05), Color.purple.opacity(0.05)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
        .navigationTitle("Confirmation")
    }
}

#Preview {
    NicheSelection()
}

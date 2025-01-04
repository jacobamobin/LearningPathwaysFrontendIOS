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
            .navigationTitle("Select Your Niche")
            .navigationBarTitleDisplayMode(.inline)
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
                Image(systemName: sfSymbol)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .frame(width: 60, height: 60)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(topic)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("\(subtopics.count) subtopics available")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
        }
    }
}

struct SubtopicSelectionView: View {
    let topic: String
    let subtopics: [String]
    @State private var selectedSubtopic: String? = nil
    
    var body: some View {
        VStack {
            Text("Which area of \(topic) interests you the most")
                .font(.title2)
                .padding(.bottom, 20)
            
            ScrollView {
                ForEach(subtopics, id: \.self) { subtopic in
                    Button(action: {
                        selectedSubtopic = subtopic
                    }) {
                        Text(subtopic)
                            .font(.headline)
                            .foregroundColor(selectedSubtopic == subtopic ? .white : .blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedSubtopic == subtopic ? Color.blue : Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
            
            if let selectedSubtopic = selectedSubtopic {
                NavigationLink(destination: QuestionView(topic: topic, subtopic: selectedSubtopic)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .padding()
        .navigationTitle("Subtopic Selection")
    }
}

struct QuestionView: View {
    let topic: String
    let subtopic: String
    
    var body: some View {
        VStack {
            Text("You chose:")
                .font(.title2)
                .padding(.bottom, 5)
            
            Text("Topic: \(topic)")
                .font(.headline)
                .padding(.bottom, 2)
            
            Text("Subtopic: \(subtopic)")
                .font(.headline)
                .padding(.bottom, 20)
            
            // Placeholder for yes/no questions
            Text("Questions will appear here.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Your Choice")
    }
}

#Preview {
    NicheSelection()
}



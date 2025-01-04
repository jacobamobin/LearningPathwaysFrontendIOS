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
                              subtopics: [
                                "Data:Learn how information is stored, organized, and analyzed.",
                                "Software Development:Dive into coding, app creation, and software engineering principles.",
                                "Networking:Explore how devices connect, share, and communicate securely.",
                                "Cybersecurity:Understand how to protect digital assets and combat cyber threats."
                              ])
                    
                    NicheCard(topic: "Law",
                              image: "scales",
                              sfSymbol: "doc.text",
                              subtopics: [
                                "Criminal Law:Study justice systems and crime prevention techniques.",
                                "Corporate Law:Learn the legal framework for businesses and organizations.",
                                "Family Law:Explore laws related to personal relationships and domestic matters.",
                                "Environmental Law:Focus on legal approaches to protecting natural resources."
                              ])
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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationLink(destination: SubtopicSelectionView(topic: topic, subtopics: subtopics)) {
            HStack {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: sfSymbol)
                        .foregroundColor(.white)
                        .font(.title)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(topic)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .dark ? .white : .primary)
                    
                    Text("\(subtopics.count) subtopics")
                        .font(.subheadline)
                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.7) : .secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(colorScheme == .dark ? .white.opacity(0.7) : .gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(colorScheme == .dark ? Color(.systemGray5) : Color.white)
                    .shadow(
                        color: colorScheme == .dark ? .clear : .gray.opacity(0.2),
                        radius: 10, x: 0, y: 5
                    )
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
                                    Text(subtopic.components(separatedBy: ":")[0])
                                        .font(.headline)
                                        .foregroundColor(selectedSubtopic == subtopic ? .white : .primary)
                                    Text(subtopic.components(separatedBy: ":")[1])
                                        .font(.subheadline)
                                        .foregroundColor(selectedSubtopic == subtopic ? .white.opacity(0.8) : .secondary)
                                        .multilineTextAlignment(.leading)
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
                            .shadow(color: .gray.opacity(0.05), radius: 10, x: 0, y: 5)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            Spacer()
            
            if let selectedSubtopic = selectedSubtopic {
                NavigationLink(destination: QuestionView(topic: topic, subtopic: selectedSubtopic).navigationBarBackButtonHidden(true)) {
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
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
    }
}

#Preview {
    NicheSelection()
}

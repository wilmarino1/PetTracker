//
//  ProfileView.swift
//  PetTracker
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    SectionHeader(
                        title: "Pet Profile",
                        subtitle: "Review and edit your pet's details.",
                        systemImage: "pawprint.circle.fill",
                        imageColor: .brown
                    )
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ProfileCard(title: "Name", value: "Buddy", icon: "person.fill", color: .indigo)
                        ProfileCard(title: "Age", value: "3 years", icon: "calendar", color: .teal)
                        ProfileCard(title: "Breed", value: "Golden Retriever", icon: "pawprint.fill", color: .brown)
                        ProfileCard(title: "Gender", value: "Male", icon: "figure.stand", color: .cyan)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

//
//  ActivityView.swift
//  PetTracker
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    SectionHeader(
                        title: "Activity Tracker",
                        subtitle: "Monitor your pet's daily activity.",
                        systemImage: "figure.walk.circle.fill",
                        imageColor: .orange
                    )
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16)
 {
                        ActivityCard(title: "Steps", value: "10,000", icon: "footprints.circle.fill", color: .green)
                        ActivityCard(title: "Distance", value: "5.2 km", icon: "location.circle.fill", color: .blue)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

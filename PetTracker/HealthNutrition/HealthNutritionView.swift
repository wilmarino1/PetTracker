//
//  HealthNutritionView.swift
//  PetTracker
//

import SwiftUI

struct HealthNutritionView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    SectionHeader(
                        title: "Health & Nutrition",
                        subtitle: "Monitor your pet's health and diet.",
                        systemImage: "heart.circle.fill",
                        imageColor: .red
                    )
                    
                    // Health metrics -------------------------------------------------
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(
                            title: "Health Metrics",
                            subtitle: nil,
                            systemImage: "cross.circle.fill",
                            imageColor: .red
                        )
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            HealthCard(title: "Weight", value: "5.3 kg", icon: "scalemass.fill", color: .purple)
                            HealthCard(title: "Temperature", value: "38°C", icon: "thermometer", color: .red)
                        }
                    }
                    
                    // Nutrition plan -------------------------------------------------
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(
                            title: "Nutrition Plan",
                            subtitle: nil,
                            systemImage: "leaf.circle.fill",
                            imageColor: .green
                        )
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            NutritionCard(title: "Calories Consumed", value: "350 kcal", icon: "flame.fill", color: .orange)
                            NutritionCard(title: "Water Intake", value: "0.5 L", icon: "drop.fill", color: .blue)
                        }
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

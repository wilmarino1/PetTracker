//
//  HomeView.swift
//  PetTracker
//

import SwiftUI            // ← 👈  MUST be present

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // MARK: – Header
                    SectionHeader(
                        title: "Pet Dashboard",
                        subtitle: "Welcome back! Here's Buddy's overview.",
                        systemImage: "house.circle.fill",
                        imageColor: .orange
                    )
                    
                    // MARK: – Today’s Activity
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(
                            title: "Today's Activity",
                            subtitle: nil,
                            systemImage: "figure.walk.circle.fill",
                            imageColor: .green
                        )
                        
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()),   // ← correct usage
                                GridItem(.flexible())
                            ],
                            spacing: 16
                        ) {
                            ActivityCard(
                                title: "Steps",
                                value: "10,000",
                                icon: "footprints.circle.fill",
                                color: .green
                            )
                            ActivityCard(
                                title: "Distance",
                                value: "5.2 km",
                                icon: "location.circle.fill",
                                color: .blue
                            )
                        }
                    }
                    
                    // MARK: – Health & Nutrition
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(
                            title: "Health & Nutrition",
                            subtitle: nil,
                            systemImage: "heart.circle.fill",
                            imageColor: .red
                        )
                        
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ],
                            spacing: 16
                        ) {
                            HealthCard(
                                title: "Weight",
                                value: "5.3 kg",
                                icon: "scalemass.fill",
                                color: .purple
                            )
                            HealthCard(
                                title: "Temperature",
                                value: "38°C",
                                icon: "thermometer",
                                color: .red
                            )
                            NutritionCard(
                                title: "Calories",
                                value: "350 kcal",
                                icon: "flame.fill",
                                color: .orange
                            )
                            NutritionCard(
                                title: "Water",
                                value: "0.5 L",
                                icon: "drop.fill",
                                color: .blue
                            )
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

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif

//
//  ContentView.swift
//  PetTracker
//
//  Created by William Marino on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ActivityView()
                .tabItem {
                    Image(systemName: "figure.walk.circle")
                    Text("Activity")
                }
                .tag(0)
            
            HealthView()
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Health")
                }
                .tag(1)
            
            NutritionView()
                .tabItem {
                    Image(systemName: "chevron.left.2.circle")
                    Text("Nutrition")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}

struct ActivityView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Activity Tracker")
                .font(.largeTitle)
                .bold()
            
            Text("Monitor your pet's daily activity.")
                .font(.subheadline)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Steps")
                        .font(.title2)
                        .bold()
                    Text("10,000")
                        .font(.title3)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Distance")
                        .font(.title2)
                        .bold()
                    Text("5.2 km")
                        .font(.title3)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct HealthView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Health Overview")
                .font(.largeTitle)
                .bold()
            
            Text("Check your pet's health metrics.")
                .font(.subheadline)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Weight")
                        .font(.title2)
                        .bold()
                    Text("5.3 kg")
                        .font(.title3)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Temperature")
                        .font(.title2)
                        .bold()
                    Text("38°C")
                        .font(.title3)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct NutritionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Nutritional Plan")
                .font(.largeTitle)
                .bold()
            
            Text("Manage your pet's diet.")
                .font(.subheadline)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Calories Consumed")
                        .font(.title2)
                        .bold()
                    Text("350 kcal")
                        .font(.title3)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Water Intake")
                        .font(.title2)
                        .bold()
                    Text("0.5 L")
                        .font(.title3)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Pet Profile")
                .font(.largeTitle)
                .bold()
            
            Text("Review and edit your pet's details.")
                .font(.subheadline)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.title2)
                        .bold()
                    Text("Buddy")
                        .font(.title3)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Age")
                        .font(.title2)
                        .bold()
                    Text("3 years")
                        .font(.title3)
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Breed")
                        .font(.title2)
                        .bold()
                    Text("Golden Retriever")
                        .font(.title3)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Gender")
                        .font(.title2)
                        .bold()
                    Text("Male")
                        .font(.title3)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

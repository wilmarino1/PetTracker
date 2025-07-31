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
            HomeView()
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
                .tag(0)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "figure.walk.circle")
                    Text("Activity")
                }
                .tag(1)
            
            HealthNutritionView()
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Health & Nutrition")
                }
                .tag(2)
            
            HealthRecordView()
                .tabItem {
                    Image(systemName: "doc.text.circle")
                    Text("Health Record")
                }
                .tag(3)
            
            ProfileCard()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.orange)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Pet Dashboard")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Welcome back! Here's Buddy's overview.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "house.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Activity Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Today's Activity")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "figure.walk.circle.fill")
                                .foregroundColor(.green)
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            ActivityCard(title: "Steps", value: "10,000", icon: "footprints.circle.fill", color: .green)
                            ActivityCard(title: "Distance", value: "5.2 km", icon: "location.circle.fill", color: .blue)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Health & Nutrition Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Health & Nutrition")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "heart.circle.fill")
                                .foregroundColor(.red)
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            HealthCard(title: "Weight", value: "5.3 kg", icon: "scalemass.fill", color: .purple)
                            HealthCard(title: "Temperature", value: "38°C", icon: "thermometer", color: .red)
                            NutritionCard(title: "Calories", value: "350 kcal", icon: "flame.fill", color: .orange)
                            NutritionCard(title: "Water", value: "0.5 L", icon: "drop.fill", color: .blue)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Profile Quick View Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Pet Profile")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "pawprint.circle.fill")
                                .foregroundColor(.brown)
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            ProfileCard(title: "Name", value: "Buddy", icon: "person.fill", color: .indigo)
                            ProfileCard(title: "Age", value: "3 years", icon: "calendar", color: .teal)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct ActivityView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Activity Tracker")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Monitor your pet's daily activity.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "figure.walk.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Activity Cards
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ActivityCard(title: "Steps", value: "10,000", icon: "footprints.circle.fill", color: .green)
                        ActivityCard(title: "Distance", value: "5.2 km", icon: "location.circle.fill", color: .blue)
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct HealthNutritionView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Health & Nutrition")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Monitor your pet's health and diet.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "heart.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Health Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Health Metrics")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "cross.circle.fill")
                                .foregroundColor(.red)
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            HealthCard(title: "Weight", value: "5.3 kg", icon: "scalemass.fill", color: .purple)
                            HealthCard(title: "Temperature", value: "38°C", icon: "thermometer", color: .red)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Nutrition Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Nutrition Plan")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "leaf.circle.fill")
                                .foregroundColor(.green)
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            NutritionCard(title: "Calories Consumed", value: "350 kcal", icon: "flame.fill", color: .orange)
                            NutritionCard(title: "Water Intake", value: "0.5 L", icon: "drop.fill", color: .blue)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct HealthRecordView: View {
    @State private var vaccines: [VaccineRecord] = [
        VaccineRecord(name: "Rabies", date: Date(), nextDue: Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()),
        VaccineRecord(name: "DHPP", date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), nextDue: Calendar.current.date(byAdding: .month, value: 6, to: Date()) ?? Date())
    ]
    @State private var foodAmount: String = "2.5"
    @State private var exerciseRecommendation: String = "30 minutes of walking + 15 minutes of play time"
    
    @State private var showingAddVaccine = false
    @State private var newVaccineName = ""
    @State private var newVaccineDate = Date()
    @State private var newVaccineNextDue = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Health Record")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Manage vaccines, diet, and exercise plans.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "doc.text.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Vaccines Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Vaccination Records")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Button(action: {
                                showingAddVaccine = true
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.horizontal)
                        
                        LazyVStack(spacing: 12) {
                            ForEach(vaccines) { vaccine in
                                VaccineCard(vaccine: vaccine)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Food Amount Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Daily Food Amount")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "cup.and.saucer.fill")
                                .foregroundColor(.orange)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "cup.and.saucer.fill")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Food Amount (cups per day)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .fontWeight(.medium)
                                    
                                    HStack {
                                        TextField("Enter amount", text: $foodAmount)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .keyboardType(.decimalPad)
                                        
                                        Text("cups")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(20)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                    
                    // Exercise Recommendation Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Exercise Plan")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "figure.run.circle.fill")
                                .foregroundColor(.green)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "figure.run.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.green)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Recommended Exercise")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .fontWeight(.medium)
                                    
                                    TextField("Enter exercise plan", text: $exerciseRecommendation, axis: .vertical)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .lineLimit(3...6)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(20)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .sheet(isPresented: $showingAddVaccine) {
                AddVaccineView(
                    vaccineName: $newVaccineName,
                    vaccineDate: $newVaccineDate,
                    nextDueDate: $newVaccineNextDue,
                    vaccines: $vaccines,
                    isPresented: $showingAddVaccine
                )
            }
        }
    }
}

struct VaccineRecord: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let nextDue: Date
}

struct VaccineCard: View {
    let vaccine: VaccineRecord
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var isDuesSoon: Bool {
        let daysUntilDue = Calendar.current.dateComponents([.day], from: Date(), to: vaccine.nextDue).day ?? 0
        return daysUntilDue <= 30 && daysUntilDue >= 0
    }
    
    private var isOverdue: Bool {
        vaccine.nextDue < Date()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "cross.circle.fill")
                    .font(.title2)
                    .foregroundColor(isOverdue ? .red : isDuesSoon ? .orange : .green)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(vaccine.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Last: \(vaccine.date, formatter: dateFormatter)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Next: \(vaccine.nextDue, formatter: dateFormatter)")
                        .font(.caption)
                        .foregroundColor(isOverdue ? .red : isDuesSoon ? .orange : .secondary)
                }
                
                Spacer()
                
                if isOverdue {
                    Text("OVERDUE")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.red)
                        .cornerRadius(8)
                } else if isDuesSoon {
                    Text("DUE SOON")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

struct AddVaccineView: View {
    @Binding var vaccineName: String
    @Binding var vaccineDate: Date
    @Binding var nextDueDate: Date
    @Binding var vaccines: [VaccineRecord]
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Vaccine Information")) {
                    TextField("Vaccine Name", text: $vaccineName)
                    
                    DatePicker("Date Administered", selection: $vaccineDate, displayedComponents: .date)
                    
                    DatePicker("Next Due Date", selection: $nextDueDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Add Vaccine")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                        vaccineName = ""
                        vaccineDate = Date()
                        nextDueDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let newVaccine = VaccineRecord(name: vaccineName, date: vaccineDate, nextDue: nextDueDate)
                        vaccines.append(newVaccine)
                        isPresented = false
                        vaccineName = ""
                        vaccineDate = Date()
                        nextDueDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
                    }
                    .disabled(vaccineName.isEmpty)
                }
            }
        }
    }
}
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Pet Profile")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Review and edit your pet's details.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "pawprint.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.brown)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Profile Cards
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ProfileCard(title: "Name", value: "Buddy", icon: "person.fill", color: .indigo)
                        ProfileCard(title: "Age", value: "3 years", icon: "calendar", color: .teal)
                        ProfileCard(title: "Breed", value: "Golden Retriever", icon: "pawprint.fill", color: .brown)
                        ProfileCard(title: "Gender", value: "Male", icon: "figure.stand", color: .cyan)
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 100)
                }
                .padding(.top)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }


// MARK: - Card Components

struct ActivityCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

struct HealthCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

struct NutritionCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

struct ProfileCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

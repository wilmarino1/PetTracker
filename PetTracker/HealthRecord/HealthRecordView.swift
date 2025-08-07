//
//  HealthRecordView.swift
//  PetTracker
//

import SwiftUI

struct HealthRecordView: View {
    // MARK: – Sample data
    @State private var vaccines: [VaccineRecord] = [
        VaccineRecord(name: "Rabies", date: Date(),
                      nextDue: Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()),
        VaccineRecord(name: "DHPP", date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(),
                      nextDue: Calendar.current.date(byAdding: .month, value: 6, to: Date()) ?? Date())
    ]
    
    @State private var foodAmount: String = "2.5"
    @State private var exerciseRecommendation: String = "30 minutes of walking + 15 minutes of play time"
    
    // MARK: – Add‑Vaccine sheet state
    @State private var showingAddVaccine = false
    @State private var newVaccineName = ""
    @State private var newVaccineDate = Date()
    @State private var newVaccineNextDue = Calendar.current.date(byAdding: .year, value: 1,
                                                                to: Date()) ?? Date()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header ----------------------------------------------------
                    SectionHeader(
                        title: "Pet Profile",
                        subtitle: "Manage vaccines, diet, and exercise plans.",
                        systemImage: "doc.text.circle.fill",
                        imageColor: .blue
                    )
                    
                    // Vaccination records ---------------------------------------
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Vaccination Records")
                                .font(.title2).fontWeight(.bold)
                            Spacer()
                            Button(action: { showingAddVaccine = true }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2).foregroundColor(.green)
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
                    
                    // Food amount ------------------------------------------------
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Daily Food Amount")
                                .font(.title2).fontWeight(.bold)
                            Spacer()
                            Image(systemName: "cup.and.saucer.fill")
                                .foregroundColor(.orange)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "cup.and.saucer.fill")
                                    .font(.title2).foregroundColor(.orange)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Food Amount (cups per day)")
                                        .font(.subheadline).foregroundColor(.secondary).fontWeight(.medium)
                                    
                                    HStack {
                                        TextField("Enter amount", text: $foodAmount)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .keyboardType(.decimalPad)
                                        Text("cups")
                                            .font(.title3).fontWeight(.medium).foregroundColor(.secondary)
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
                    
                    // Exercise plan ---------------------------------------------
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Exercise Plan")
                                .font(.title2).fontWeight(.bold)
                            Spacer()
                            Image(systemName: "figure.run.circle.fill")
                                .foregroundColor(.green)
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "figure.run.circle.fill")
                                    .font(.title2).foregroundColor(.green)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Recommended Exercise")
                                        .font(.subheadline).foregroundColor(.secondary).fontWeight(.medium)
                                    
                                    TextField("Enter exercise plan",
                                              text: $exerciseRecommendation,
                                              axis: .vertical)
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


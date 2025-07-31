//
//  HealthRecord.swift
//  PetTracker
//
//  Created by William Marino on 7/30/25.
//

import SwiftUI
import Foundation

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
                                VaccineCard(vaccine: vaccine) {
                                    deleteVaccine(vaccine)
                                }
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
    
    private func deleteVaccine(_ vaccine: VaccineRecord) {
        vaccines.removeAll { $0.id == vaccine.id }
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
    let onDelete: (() -> Void)?
    
    init(vaccine: VaccineRecord, onDelete: (() -> Void)? = nil) {
        self.vaccine = vaccine
        self.onDelete = onDelete
    }
    
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
                
                // Status Badge
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
                
                // Delete Button (only show if onDelete is provided)
                if let onDelete = onDelete {
                    Button(action: onDelete) {
                        Image(systemName: "trash.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red.opacity(0.7))
                    }
                    .buttonStyle(PlainButtonStyle())
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
                    TextField("Vaccine Name (e.g., Rabies, DHPP)", text: $vaccineName)
                        .autocapitalization(.words)
                    
                    DatePicker("Date Administered", selection: $vaccineDate, in: ...Date(), displayedComponents: .date)
                    
                    DatePicker("Next Due Date", selection: $nextDueDate, in: Date()..., displayedComponents: .date)
                }
                
                Section {
                    HStack {
                        Spacer()
                        Text("Add Vaccine Record")
                            .foregroundColor(vaccineName.isEmpty ? .secondary : .blue)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if !vaccineName.isEmpty {
                            addVaccine()
                        }
                    }
                }
            }
            .navigationTitle("Add Vaccine")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismissView()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addVaccine()
                    }
                    .disabled(vaccineName.isEmpty)
                }
            }
        }
    }
    
    private func addVaccine() {
        guard !vaccineName.isEmpty else { return }
        
        let newVaccine = VaccineRecord(
            name: vaccineName.trimmingCharacters(in: .whitespacesAndNewlines),
            date: vaccineDate,
            nextDue: nextDueDate
        )
        vaccines.append(newVaccine)
        dismissView()
    }
    
    private func dismissView() {
        isPresented = false
        vaccineName = ""
        vaccineDate = Date()
        nextDueDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
    }
}

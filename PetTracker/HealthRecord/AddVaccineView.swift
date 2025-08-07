//
//  AddVaccineView.swift
//  PetTracker
//

import SwiftUI

struct AddVaccineView: View {
    // Bindings back to the HealthRecord view
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
                        resetForm()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let new = VaccineRecord(name: vaccineName,
                                                date: vaccineDate,
                                                nextDue: nextDueDate)
                        vaccines.append(new)
                        resetForm()
                    }
                    .disabled(vaccineName.isEmpty)
                }
            }
        }
    }
    
    private func resetForm() {
        isPresented = false
        vaccineName = ""
        vaccineDate = Date()
        nextDueDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
    }
}

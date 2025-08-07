//
//  VaccineCard.swift
//  testingtesting123
//
//  Created by William Marino on 8/7/25.
//


import SwiftUI

struct VaccineCard: View {
    let vaccine: VaccineRecord
    
    private var dateFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }
    
    private var daysUntilDue: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: vaccine.nextDue).day ?? 0
    }
    
    private var statusColor: Color {
        if vaccine.nextDue < Date() {            // overdue
            return .red
        } else if daysUntilDue <= 30 {           // due soon
            return .orange
        } else {
            return .green
        }
    }
    
    private var statusLabel: String? {
        if vaccine.nextDue < Date() {
            return "OVERDUE"
        } else if daysUntilDue <= 30 {
            return "DUE SOON"
        }
        return nil
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "cross.circle.fill")
                    .font(.title2)
                    .foregroundColor(statusColor)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(vaccine.name)
                        .font(.headline).fontWeight(.bold).foregroundColor(.primary)
                    
                    Text("Last: \(vaccine.date, formatter: dateFormatter)")
                        .font(.caption).foregroundColor(.secondary)
                    
                    Text("Next: \(vaccine.nextDue, formatter: dateFormatter)")
                        .font(.caption)
                        .foregroundColor(statusColor.opacity(0.8))
                }
                Spacer()
                if let label = statusLabel {
                    Text(label)
                        .font(.caption).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(statusColor)
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

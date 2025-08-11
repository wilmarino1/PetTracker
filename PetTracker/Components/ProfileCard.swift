//
//  ProfileCard.swift
//  testingtesting123
//
//  Created by William Marino on 8/7/25.
//


import SwiftUI

struct ProfileCard: View {
    let title: String          // e.g. "Name"
    let systemImage: String    // e.g. "person.fill"
    let iconColor: Color       // colour of the SF Symbol
    @Binding var text: String  // two‑way binding to the view‑model

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // ----- Title + Icon -------------------------------------------------
            HStack(spacing: 6) {
                Image(systemName: systemImage)
                    .foregroundColor(iconColor)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }

            // ----- TextField ----------------------------------------------------
            TextField("Enter \(title.lowercased())", text: $text)
                .font(.headline)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(UIColor.secondarySystemBackground))
        )
    }
}

//
//  SectionHeader.swift
//  testingtesting123
//
//  Created by William Marino on 8/7/25.
//


import SwiftUI

/// A reusable header that shows a title, optional subtitle, and an
/// optional system‑image on the trailing side.
struct SectionHeader: View {
    var title: String
    var subtitle: String? = nil
    var systemImage: String? = nil
    var imageColor: Color = .primary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
                if let systemImage = systemImage {
                    Image(systemName: systemImage)
                        .font(.largeTitle)
                        .foregroundColor(imageColor)
                }
            }
        }
        .padding(.horizontal)
    }
}

//
//  ProfileView.swift
//  PetTracker
//

import SwiftUI


// ------------------------------------------------------------
// MARK: – Main view
// ------------------------------------------------------------
struct ProfileView: View {
    // ----------- 1️⃣ State that stores the editable data -----------------
    @State private var name   = "Buddy"
    @State private var age    = "3 years"
    @State private var breed  = "Golden Retriever"
    @State private var gender = "Male"

    // ------------------------------------------------------------
    var body: some View {
        NavigationView {
            // --------------------------------------------------------
            // 2️⃣ Scroll view – tap outside to dismiss keyboard
            // --------------------------------------------------------
            ScrollView {
                VStack(spacing: 24) {
                    // ------------------------------------------------
                    // Header – unchanged from your original code
                    // ------------------------------------------------
                    SectionHeader(
                        title: "Pet Profile",
                        subtitle: "Review and edit your pet's details.",
                        systemImage: "pawprint.circle.fill",
                        imageColor: .brown
                    )

                    // ------------------------------------------------
                    // 3️⃣ Grid of editable cards
                    // ------------------------------------------------
                    LazyVGrid(
                        columns: [GridItem(.flexible()), GridItem(.flexible())],
                        spacing: 16
                    ) {
                        ProfileCard(
                            title: "Name",
                            systemImage: "person.fill",
                            iconColor: .indigo,
                            text: $name
                        )
                        ProfileCard(
                            title: "Age",
                            systemImage: "calendar",
                            iconColor: .teal,
                            text: $age
                        )
                        ProfileCard(
                            title: "Breed",
                            systemImage: "pawprint.fill",
                            iconColor: .brown,
                            text: $breed
                        )
                        ProfileCard(
                            title: "Gender",
                            systemImage: "figure.stand",
                            iconColor: .cyan,
                            text: $gender
                        )
                    }

                    // ------------------------------------------------
                    // Bottom spacer – keeps content from being cut‑off
                    // ------------------------------------------------
                    Spacer(minLength: 100)
                }
                .padding(.top)
                // Dismiss keyboard when tapping anywhere inside the scroll view
                .contentShape(Rectangle())
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .background(
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            )
            .navigationTitle("")          // optional: hide the automatic title
        }
    }

    // ------------------------------------------------------------
    // Helper to hide the keyboard (works on iOS & iPadOS)
    // ------------------------------------------------------------
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}

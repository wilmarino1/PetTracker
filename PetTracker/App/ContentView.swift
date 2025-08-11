//
//  ContentView.swift
//  PetTracker
//
//  Created by William Marino on 7/30/25.
//

import SwiftUI

/// The main entry point – a TabView that hosts all top‑level screens.
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
            
            ActivityView() //Replace with Appointment Reminders
                .tabItem {
                    Image(systemName: "figure.walk.circle")
                    Text("Activity")
                }
                .tag(1)
            
            HealthRecordView()
                .tabItem {
                    Image(systemName: "cross.circle")
                    Text("Health Records")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "pawprint.circle")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.blue)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

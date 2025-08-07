//
//  VaccineRecord.swift
//  PetTracker
//

import Foundation

/// Simple model that represents one vaccination entry.
struct VaccineRecord: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var date: Date
    var nextDue: Date
}

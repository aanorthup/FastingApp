//
//  FastingModel.swift
//  FastingApp
//
//  Created by admin on 11/11/23.
//

import Foundation

struct Fasting: Identifiable {
    var id = UUID()
    var startDate: Date
    var endDate: Date
    var weight: Double
    var measurements: Measurements
}

struct Measurements {
    var waist: Double
    var hips: Double
    var chest: Double
    var leftArm: Double
    var rightArm: Double
    var leftThigh: Double
    var rightThigh: Double
}

//
//  TargetsService.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 13.02.2024.
//

import Foundation

protocol TargetServiceProtocol {
    func fetchTargets() async throws -> [Target]
}

class TargetsService: TargetServiceProtocol {
    func fetchTargets() async throws -> [Target] {
//        try await Task.sleep(nanoseconds: 1_000_000_000)
        return mockTargets
    }
}

let mockTargets = [
    Target(id: "1", name: "Location"),
    Target(id: "2", name: "Age"),
    Target(id: "3", name: "Sex"),
    Target(id: "4", name: "Spoken Languages"),
    Target(id: "5", name: "Events"),
    Target(id: "6", name: "Company"),
    Target(id: "7", name: "Industry"),
    Target(id: "8", name: "Expertise"),
    Target(id: "9", name: "Education"),
    Target(id: "10", name: "Technology"),
    Target(id: "11", name: "Interests"),
    Target(id: "12", name: "Device"),
    Target(id: "13", name: "Keywords"),
    Target(id: "14", name: "Similar Products/Services"),
    Target(id: "15", name: "Hyperlinks")
]

//
//  ServicePackage.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import Foundation

struct ServicePackage: Identifiable, Hashable, Codable {
    let id: String
    let channelID: String
    let price: Double
    let benefits: [String]

}

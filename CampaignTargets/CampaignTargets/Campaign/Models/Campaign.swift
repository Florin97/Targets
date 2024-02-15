//
//  Campaign.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import Foundation

struct Campaign: Identifiable, Hashable, Codable {
    let id: String
    let channelID: String
    let packages: [ServicePackage]
}

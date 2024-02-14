//
//  Channel.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 14.02.2024.
//

import Foundation

struct Channel: Identifiable, Hashable, Codable {
    let id: String
    let targetsIds: Set<String>
    let name: String
}

//
//  ChannelsService.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 14.02.2024.
//

import Foundation

protocol ChannelsServiceProtocol {
    func fetchChannels() async throws -> [Channel]
}

class ChannelsService: ChannelsServiceProtocol {
    
    func fetchChannels() async throws -> [Channel] {
        channels
    }
}

let channel1 = Channel(id: "1", targetsIds: ["1"], name: "Facebook")

let channels = [
    Channel(id: "1", targetsIds: ["1","2","3","4","5"], name: "Facebook"),
    Channel(id: "2", targetsIds: ["1","2","3","4","5"],  name: "LinkedIn"),
    Channel(id: "3", targetsIds: ["1","2","3","4","5","10"],  name: "Twitter"),
    Channel(id: "4", targetsIds: ["1","2","3","4","11"], name: "Instagram"),
    Channel(id: "5", targetsIds: ["1","2","3","12","13","14"], name: "Google AdWords"),
    Channel(id: "6", targetsIds: ["7","13","15"], name: "SEO")
]

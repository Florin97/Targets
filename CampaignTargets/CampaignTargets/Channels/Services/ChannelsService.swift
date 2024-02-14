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

let channel1 = Channel(id: "1", targetId: ["1"], name: "Facebook")


//Target(id: "16", name: "Facebook"),
let channels = [
    Channel(id: "1", targetId: ["1","2","3","4","5"],  name: "LinkedIn"),
Channel(id: "1", targetId: ["1","2","3","6"],  name: "Twitter"),
Channel(id: "1", targetId: ["1"], name: "Instagram"),
Channel(id: "1", targetId: ["1"], name: "Google AdWords"),
Channel(id: "1", targetId: ["1"], name: "Email Support"),
Channel(id: "1", targetId: ["1"], name: "Monthly Reports"),
Channel(id: "1", targetId: ["1"], name: "Installation"),
Channel(id: "1", targetId: ["1"], name: "Conversion Monitoring"),
Channel(id: "1", targetId: ["1"], name: "Landing Page"),
Channel(id: "1", targetId: ["1"], name: "SEO")
]
//let mockTargets = [
//    Target(id: "1", name: "Location"),
//    Target(id: "2", name: "Age"),
//    Target(id: "3", name: "Sex"),
//    Target(id: "4", name: "Spoken Languages"),
//    Target(id: "5", name: "Events"),
//    Target(id: "6", name: "Company"),
//    Target(id: "7", name: "Industry"),
//    Target(id: "8", name: "Expertise"),
//    Target(id: "9", name: "Education"),
//    Target(id: "10", name: "Technology"),
//    Target(id: "11", name: "Interests"),
//    Target(id: "12", name: "Device"),
//    Target(id: "13", name: "Keywords"),
//    Target(id: "14", name: "Similar Products/Services"),
//    Target(id: "15", name: "Hyperlinks")
//]

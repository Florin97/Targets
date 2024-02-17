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
        guard let url = URL(string: "https://raw.githubusercontent.com/Florin97/Targets/main/CampaignTargets/Channels.json") else {
            throw NetworkError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.serverError
        }
        
        let channels = try JSONDecoder().decode([Channel].self, from: data)
        return channels
        
    }
}

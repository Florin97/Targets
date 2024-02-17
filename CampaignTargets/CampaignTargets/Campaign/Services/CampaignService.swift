//
//  CampaignService.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import Foundation

protocol CampaignServiceProtocol {
    func fetchPackages(byChannelId channelId: String) async throws -> [ServicePackage]
}

class CampaignService: CampaignServiceProtocol {
    
    func fetchPackages(byChannelId channelId: String) async throws -> [ServicePackage] {
        let filteredCampaigns = try await fetchCampaign(byChannelId: channelId)
        return filteredCampaigns.flatMap { $0.packages }
    }
    
    func fetchCampaign(byChannelId channelId: String) async throws -> [Campaign] {
        guard let url = URL(string: "https://raw.githubusercontent.com/Florin97/Targets/main/CampaignTargets/Campaigns.json") else {
            throw NetworkError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.serverError
        }
        
        let campaigns = try JSONDecoder().decode([Campaign].self, from: data)
        
        return campaigns.filter { $0.channelID == channelId }
    }
}

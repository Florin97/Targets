//
//  TargetsService.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 13.02.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case serverError
}

protocol TargetServiceProtocol {
    func fetchTargets() async throws -> [Target]
}

class TargetsService: TargetServiceProtocol {
    func fetchTargets() async throws -> [Target] {
        guard let url = URL(string: "https://raw.githubusercontent.com/Florin97/Targets/main/CampaignTargets/Targets.json") else {
            throw NetworkError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.serverError
        }
        
        let targets = try JSONDecoder().decode([Target].self, from: data)
        return targets
    }
}


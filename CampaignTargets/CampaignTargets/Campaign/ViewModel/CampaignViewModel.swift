//
//  CampaignViewModel.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import Foundation

enum CampaignState {
    case idle
    case loading
    case loaded(packages: [ServicePackage])
    case error(error: Error)
}

protocol CampaignViewModelProtocol: ObservableObject {
    func fetchPackages() async
    var state: CampaignState { get }
}

class CampaignViewModel: CampaignViewModelProtocol {
    @Published private(set) var state: CampaignState = .idle
    private let service: CampaignServiceProtocol
    private let channelId: String
    
    init(service: CampaignServiceProtocol = CampaignService(), channelId: String) {
        self.service = service
        self.channelId = channelId
    }
    
    @MainActor
    func fetchPackages() async {
        state = .loading
        do {
            print("fetchPachage")
            let packages = try await service.fetchPackages(byChannelId: channelId)
            state = .loaded(packages: packages)
            print("fetchPachage", packages)
        } catch {
            state = .error(error: error)
        }
    }
}

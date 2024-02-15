//
//  ChannelViewModel.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 14.02.2024.
//

import Foundation

enum ChannelState {
    case idle
    case loading
    case loaded(channels: [Channel])
    case error(error: Error)
}

protocol ChannelViewModelProtocol: ObservableObject {
    var state: ChannelState { get }
    func fetchChannels() async
}

class ChannelViewModel: ChannelViewModelProtocol {
    
    @Published private(set) var state: ChannelState = .idle
    let service: ChannelsServiceProtocol
    private let selectedTargetsIds: Set<String>
    
    init(selectedTargetsIds: Set<String>, service: ChannelsServiceProtocol = ChannelsService()) {
        self.selectedTargetsIds = selectedTargetsIds
        self.service = service
    }
    
    @MainActor
    func fetchChannels() async {
        state = .loading
        do {
            let channels = try await service.fetchChannels()
            let targetedChannels = channels.filter {
                print($0.targetsIds.isDisjoint(with: selectedTargetsIds))
                return !($0.targetsIds.isDisjoint(with: selectedTargetsIds))
            }
            state = .loaded(channels: targetedChannels)
        } catch {
            state = .error(error: error)
        }
    }
}

//
//  ChannelsVIew.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 14.02.2024.
//

import SwiftUI

struct ChannelsView<ViewModelType: ChannelViewModelProtocol>: View {
    @StateObject var viewModel: ViewModelType
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading channels")
            case .loaded(let channels):
                List(channels) { channel in
                    Text(channel.name)
                        .onTapGesture {
                            
                        }
                }
                .navigationTitle("Select channel")
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
        .task {
            await viewModel.fetchChannels()
        }
    }
}

#Preview {
    ChannelsView(viewModel: ChannelViewModel(selectedTargetsIds: ["1"]))
}

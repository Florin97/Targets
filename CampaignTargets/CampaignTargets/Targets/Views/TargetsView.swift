//
//  TargetsView.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 13.02.2024.
//

import SwiftUI

struct TargetsView<ViewModelType: TargetsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModelType
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading targets")
            case .loaded(let targets):
                ScrollView {
                    LazyVStack {
                        ForEach(targets, id: \.id) { target in
                            TargetCell(targetName: target.name, isSelected: viewModel.targetIsSelected(target: target))
                                .onTapGesture {
                                    viewModel.toggleSelection(for: target)
                                }
                                .padding(.horizontal)
                                .cornerRadius(10)
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: ChannelsView(viewModel: ChannelViewModel(selectedTargetsIds: viewModel.selectedTargets))) {
                            Text("Next")
                        }
                        .disabled(!viewModel.areTargetsSelected)
                    }
                }
                .navigationBarTitle("Targets")
                
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            }
        }
        .task {
            await viewModel.fetchTargets()
        }
    }
}


#Preview {
    TargetsView(viewModel: TargetsViewModel())
}


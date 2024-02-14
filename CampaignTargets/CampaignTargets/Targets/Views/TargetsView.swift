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
                List(targets,id: \.id, selection: $viewModel.selectedTargets) { target in
                    Text(target.name)
                }
                .environment(\.editMode, .constant(.active))
                .navigationBarTitle("Targets")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: ChannelsView(viewModel: viewModel)) {
                            Text("Next")
                        }
                        .disabled(!viewModel.areTargetsSelected)
                    }
                }
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            }
        }
        .task {
            await viewModel.fetchTargets()
        }
    }
}

struct ChannelsView<ViewModelType: TargetsViewModelProtocol>: View {
    @StateObject var viewModel: ViewModelType
    
    var body: some View {
        Text("")
    }
}


#Preview {
    TargetsView(viewModel: TargetsViewModel())
    //    MultiSelectListView()
}


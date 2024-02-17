//
//  CampaignVIew.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import SwiftUI


struct CampaignView<ViewModelType: CampaignViewModelProtocol>: View {
    @StateObject var viewModel: ViewModelType
    
    var body: some View {
       Group() {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading campaigns")
            case .loaded(let packages):
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(packages, id: \.id) { package in
                            NavigationLink(destination: ServicePackageDetail(package: package)) {
                                ServicePackageCell(package: package)
                            }
                        }
                    }
                }
                .padding(.vertical, 8)
                .navigationTitle("Choose package")
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
        .task {
            await viewModel.fetchPackages()
        }
    }
}

#Preview {
    CampaignView(viewModel: CampaignViewModel(channelId: "1"))
}



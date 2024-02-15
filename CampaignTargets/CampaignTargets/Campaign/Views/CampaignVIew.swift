//
//  CampaignVIew.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import SwiftUI


struct CampaignVIew<ViewModelType: CampaignViewModelProtocol>: View {
   @ObservedObject var viewModel: ViewModelType

    var body: some View {
        Group{
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading campaigns")
            case .loaded(let packages):
                List(packages, id: \.id) { package in
                    VStack(alignment: .leading) {
                        Text(package.channelID)
                            .font(.headline)
                        Text("Price: \(package.price, specifier: "%.2f")")
                            .font(.subheadline)
                        ForEach(package.benefits, id: \.self) { benefit in
                            Text("• \(benefit)")
                        }
                    }
                }
                .navigationTitle("Service Packages")
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
        .task {
            await viewModel.fetchPackages()
        }
    }
}

struct ServicePackageView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignVIew(viewModel: CampaignViewModel(channelId: "1"))
    }
}

//
//  CampaignTargetsApp.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 13.02.2024.
//

import SwiftUI

@main
struct CampaignTargetsApp: App {
    var body: some Scene {
        WindowGroup {
            CampaignVIew(viewModel: CampaignViewModel(channelId: "1"))
        }
    }
}

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
    
    var campaigns: [Campaign] {
        let facebookPackages = [
            ServicePackage(id: "fb1", channelID: "1", price: 299.0, benefits: ["Ad Listings", "Campaign Optimization", "Monthly Reports"]),
            ServicePackage(id: "fb2", channelID: "1", price: 349.0, benefits: ["Advanced Targeting", "Conversion Tracking"])
        ]

        let linkedInPackages = [
            ServicePackage(id: "li1", channelID: "2", price: 399.0, benefits: ["Lead Generation", "Profile Optimization"])
        ]

        let twitterPackages = [
            ServicePackage(id: "tw1", channelID: "3", price: 249.0, benefits: ["Brand Awareness", "Engagement Analysis"])
        ]

        let instagramPackages = [
            ServicePackage(id: "ig1", channelID: "4", price: 299.0, benefits: ["Visual Content Creation", "Hashtag Strategy"])
        ]

        let googleAdWordsPackages = [
            ServicePackage(id: "ga1", channelID: "5", price: 499.0, benefits: ["PPC Campaigns", "Keyword Research"])
        ]

        let seoPackages = [
            ServicePackage(id: "seo1", channelID: "6", price: 599.0, benefits: ["On-page SEO", "Backlink Strategy"])
        ]

        return [
            Campaign(id: "camp1", channelID: "1", packages: facebookPackages),
            Campaign(id: "camp2", channelID: "2", packages: linkedInPackages),
            Campaign(id: "camp3", channelID: "3", packages: twitterPackages),
            Campaign(id: "camp4", channelID: "4", packages: instagramPackages),
            Campaign(id: "camp5", channelID: "5", packages: googleAdWordsPackages),
            Campaign(id: "camp6", channelID: "6", packages: seoPackages)
        ]
        
    }
    
    func fetchPackages(byChannelId channelId: String) async throws -> [ServicePackage] {
        let filteredCampaigns = fetchCampaign(byChannelId: channelId)
        return filteredCampaigns.flatMap { $0.packages }
    }
    
    func fetchCampaign(byChannelId channelId: String) -> [Campaign] {
        return campaigns.filter { $0.channelID == channelId }
    }
}

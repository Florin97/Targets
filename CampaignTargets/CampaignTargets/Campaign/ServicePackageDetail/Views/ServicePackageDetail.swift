//
//  ServicePackageDetail.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 17.02.2024.
//

import SwiftUI
import MessageUI

struct ServicePackageDetail: View {
    var package: ServicePackage
    @State private var isShowingMailView = false
    @State private var mailResult: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        ScrollView {
            PackageDetailContent(package: package)
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitle(Text("Details"), displayMode: .inline)
        .navigationBarItems(trailing: EmailButton(isShowingMailView: $isShowingMailView))
        .sheet(isPresented: $isShowingMailView) {
            if MFMailComposeViewController.canSendMail() {
                MailView(result: self.$mailResult, servicePackage: package)
            } else {
                Text("Can't send emails from this device")
            }
        }
    }
}

struct PackageDetailContent: View {
    let package: ServicePackage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            PriceView(price: package.price)
            Divider()
            BenefitsView(benefits: package.benefits)
        }
        .padding()
    }
}

struct PriceView: View {
    let price: Double
    
    var body: some View {
        HStack {
            Text("Price:")
                .font(.title2)
                .foregroundColor(.secondary)
            Spacer()
            Text("$\(price, specifier: "%.2f")")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding(.vertical)
    }
}

struct BenefitsView: View {
    let benefits: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Benefits:")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.bottom, 5)

            ForEach(benefits, id: \.self) { benefit in
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text(benefit)
                }
                .font(.body)
            }
        }
    }
}

struct EmailButton: View {
    @Binding var isShowingMailView: Bool
    
    var body: some View {
        Button {
            self.isShowingMailView = true
        } label: {
            HStack(spacing: 5) {
                Image(systemName: "paperplane.fill")
                Text("Send Email")
            }
        }
    }
}



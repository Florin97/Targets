//
//  ServicePackageCell.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 17.02.2024.
//

import SwiftUI

struct ServicePackageCell: View {
    var package: ServicePackage

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Price: $\(package.price, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.bottom, 5)

            ForEach(package.benefits, id: \.self) { benefit in
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text(benefit)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .frame(width: 300, height: 200)
        .background(Color.cyan)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

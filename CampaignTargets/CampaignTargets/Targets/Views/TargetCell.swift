//
//  TargetCell.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 16.02.2024.
//

import SwiftUI

struct TargetCell: View {
    let targetName: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isSelected ? .green : .gray)
            Text(targetName)
                .fontWeight(isSelected ? .bold : .regular)
            Spacer()
        }
        .padding()
        .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
        .cornerRadius(10)
        
    }
}

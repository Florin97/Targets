//
//  TargetsViewModel.swift
//  CampaignTargets
//
//  Created by Florin Velesca on 13.02.2024.
//

import Foundation
import SwiftUI

enum TargetsLoadingState {
    case idle
    case loading
    case loaded([Target])
    case error(Error)
}

protocol TargetsViewModelProtocol: ObservableObject {
    var state: TargetsLoadingState { get }
    var selectedTargets: Set<String> { get set}
    var areTargetsSelected: Bool { get set }
    func fetchTargets() async
    func targetIsSelected(target: Target) -> Bool
    func toggleSelection(for target: Target)
}

class TargetsViewModel: TargetsViewModelProtocol {
    @Published private(set) var state: TargetsLoadingState = .idle
    @Published var areTargetsSelected = false
    @Published var selectedTargets: Set<String> = [] {
        didSet {
            areTargetsSelected = !selectedTargets.isEmpty
        }
    }
    
    private let targetService: TargetServiceProtocol
    
    init(targetService: TargetServiceProtocol = TargetsService()) {
        self.targetService = targetService
    }
    
    @MainActor
    func fetchTargets() async {
        state = .loading
        do {
            let targets = try await targetService.fetchTargets()
            state = .loaded(targets)
        } catch {
            state = .error(error)
        }
    }
    
    func targetIsSelected(target: Target) -> Bool {
        selectedTargets.contains(target.id)
    }
    
    func toggleSelection(for target: Target) {
        if selectedTargets.contains(target.id) {
            selectedTargets.remove(target.id)
        } else {
            selectedTargets.insert(target.id)
        }
    }
}

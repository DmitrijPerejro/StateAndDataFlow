//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

@main
struct Main: App {
    @StateObject private var loginViewVM = LoginViewViewModel(
        user: StorageManager.shared.fetchUser()
    )
    
    private var contentViewViewModel = ContentViewViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(contentViewViewModel)
        .environmentObject(loginViewVM)
    }
}

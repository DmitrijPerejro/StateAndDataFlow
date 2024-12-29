//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }
    
    var name: String {
        user.name
    }
    
    var isLoggedIn: Bool {
        user.isLoggedIn
    }
    
    var isValidName: Bool {
        name.count > 2
    }
    
    private let storage = StorageManager.shared
    
    func login() {
        user.isLoggedIn = true
        storage.saveUser(user)
    }
    
    func logout() {
        user = User.makeGuest()
        storage.clearUser()
    }
    
}

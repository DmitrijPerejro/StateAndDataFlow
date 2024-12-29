//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Perejro on 26/12/2024.
//

import SwiftUI
import Foundation

final class StorageManager {
    @AppStorage("user") private var user: Data?
    
    static let shared = StorageManager()
    
    private init() {}
    
    func fetchUser() -> User {
        guard let user else { return User.makeGuest() }
        
        do {
            return try JSONDecoder().decode(User.self, from: user)
        } catch {
            return User.makeGuest()
        }
    }
    
    func saveUser(_ user: User) {
        do {
            self.user = try JSONEncoder().encode(user)
        } catch {
            self.user = nil
        }
        
    }
    
    func clearUser() {
        user = nil
    }
}

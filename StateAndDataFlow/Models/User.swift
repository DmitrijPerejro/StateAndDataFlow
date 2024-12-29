//
//  User.swift
//  StateAndDataFlow
//
//  Created by Perejro on 26/12/2024.
//

import Foundation

struct User: Codable {
    var name: String
    var isLoggedIn: Bool
    
    static func makeGuest() -> User {
        User(name: "", isLoggedIn: false)
    }
}

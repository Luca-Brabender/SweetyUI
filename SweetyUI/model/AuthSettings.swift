//
//  authSettings.swift
//  SweetyUI
//
//  Created by Luca Brabender on 25.02.24.
//

import Foundation

class AuthSettings: ObservableObject{
    var user: User?
    var isAuthenticated: Bool
    
    init(user: User?, authenticated:Bool) {
        self.user = user
        self.isAuthenticated = authenticated
    }
}

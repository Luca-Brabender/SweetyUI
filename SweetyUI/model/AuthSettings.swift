//
//  authSettings.swift
//  SweetyUI
//
//  Created by Luca Brabender on 25.02.24.
//

import Foundation

class AuthSettings: ObservableObject{
    @Published var user: User?
    @Published var isAuthenticated: Bool
    
    init(user: User?, authenticated:Bool) {
        self.user = user
        self.isAuthenticated = authenticated
    }
}

extension AuthSettings{
    public func authenticate(_ user: User, _ isAuthenticated: Bool){
        self.user = user
        self.isAuthenticated = isAuthenticated
    }
}

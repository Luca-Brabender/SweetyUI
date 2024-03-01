//
//  User.swift
//  SweetyUI
//
//  Created by Luca Brabender on 25.02.24.
//

import Foundation


class User: Hashable, Identifiable, ObservableObject{
    let userId: UUID = UUID()
    var userName: String
    var email: String
    
    init(userName: String, email: String) {
        self.userName = userName
        self.email = email
    }
}

extension User{
    func hash(into hasher: inout Hasher) {
        hasher.combine(userName)
        hasher.combine(userId)
    }
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.userId == rhs.userId
    }
}

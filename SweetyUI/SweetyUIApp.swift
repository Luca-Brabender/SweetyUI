//
//  SweetyUIApp.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

@main
struct SweetyUIApp: App {
    @StateObject var authSettings = AuthSettings(user: nil, shoppingCart: nil)
    
    var body: some Scene {
        WindowGroup {
            SweetyUIView()
                .environmentObject(authSettings)
        }
    }
}

//
//  dreamerlyApp.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import SwiftUI

@main
struct dreamerlyApp: App {
    var body: some Scene {
        WindowGroup {
            let coordinator = AppCoordinator()
            coordinator.start()
        }
    }
}

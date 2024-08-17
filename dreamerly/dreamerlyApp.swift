//
//  dreamerlyApp.swift
//  dreamerly
//
//  Created by Tai Nguyen on 15/8/24.
//

import SwiftUI

@main
struct dreamerlyApp: App {
    init() {
        requestNotificationPermissions()
    }
    
    var body: some Scene {
        WindowGroup {
            let coordinator = AppCoordinator()
            coordinator.start()
        }
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }
}

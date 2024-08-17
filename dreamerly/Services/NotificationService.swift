//
//  NotificationService.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation
import UserNotifications

class NotificationService {
    static func scheduleReminderNotification(for task: Task) {
        guard let reminderDate = task.reminderDate else {
            print("No reminder date set.")
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder from dreamerly"
        content.body = task.title
        content.sound = .default
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: reminderDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: task.id.uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled for \(reminderDate).")
            }
        }
    }
}


func scheduleTestNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Test Reminder"
    content.body = "This is a test reminder notification."
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling test notification: \(error.localizedDescription)")
        } else {
            print("Test notification scheduled to trigger in 10 seconds.")
        }
    }
}

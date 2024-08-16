//
//  NotificationService.swift
//  dreamerly
//
//  Created by Tai Nguyen on 16/8/24.
//

import Foundation
import UserNotifications

class NotificationService {
    func scheduleReminder(for task: Task) {
        let content = UNMutableNotificationContent()
        content.title = task.title
        content.body = "Reminder for task due on \(task.dueDate)"
        content.sound = .default
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: task.dueDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: task.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

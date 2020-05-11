//
//  Reminder.swift
//  RemindersApp
//
//  Created by אדיר נוימן on 09/05/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import Foundation

class Reminder: Codable {
    
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(title: String, date: Date, isCompleted: Bool)
    {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
        
    }
   
}

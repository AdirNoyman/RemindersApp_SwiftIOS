//
//  ReminderCell.swift
//  RemindersApp
//
//  Created by אדיר נוימן on 09/05/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import UIKit

class ReminderCell: UITableViewCell {
    
    @IBOutlet weak var isCompletedView: UIView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var infoButton: UIButton!
    
    func update(reminder: Reminder, index: Int) {
        
        isCompletedView.layer.cornerRadius = isCompletedView.frame.size.width / 2.0
        isCompletedView.layer.borderColor = UIColor.lightGray.cgColor
        titleLabel.text = reminder.title
        
        infoButton.tag = index
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLabel.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted {
            
            isCompletedView.backgroundColor = UIColor.green
            isCompletedView.layer.borderWidth = 0.0
            
        } else {
            
            isCompletedView.backgroundColor = UIColor.white
            isCompletedView.layer.borderWidth = 2.0
            
        }
        
        
    }
    
}

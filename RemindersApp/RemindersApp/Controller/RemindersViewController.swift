//
//  RemindersViewController.swift
//  RemindersApp
//
//  Created by אדיר נוימן on 09/05/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
    }
    
    
    @IBAction func editButtonDidPressed(_ sender: UIBarButtonItem) {
        
        if tableview.isEditing {
            
            tableview.isEditing = false
            sender.title = "Edit"
            
            
        } else {
            
            tableview.isEditing = true
            sender.title = "Done"
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // I user wants to delete a cell (reminder in our case)
        if editingStyle == .delete {
            
            ReminderService.shared.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.shared.toggleCompleted(indexPath.row)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ReminderService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Deque the cell from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as! ReminderCell
        
        // Get the reminder for the given index path
        let reminder = ReminderService.shared.getReminder(indexPath.row)
        
        // Update the cell base on the reminder object
        cell.update(reminder: reminder, index: indexPath.row)
        
        // Return the cell
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // The object segue has two important properties:
        
        // 1) segue identity -> string we set in storyboard
        
        // 2) segue destination -> refrences the view controller we are transtioning to
        
        if segue.identifier == "UpdateSegue", let newReminderViewController = segue.destination as? NewReminderViewController, let infoButton = sender as? UIButton {
            
            newReminderViewController.reminderIndex = infoButton.tag
        }
    }
    
    
    
}

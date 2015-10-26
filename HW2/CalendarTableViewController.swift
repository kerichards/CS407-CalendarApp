//
//  CalendarTableViewController.swift
//  HW2
//
//  Created by Katherine Richards on 10/23/15.
//  Copyright © 2015 Katherine Richards. All rights reserved.
//

import UIKit
//import SwiftyJSON


class CalendarTableViewController: UITableViewController {
    
    var events = [Event]()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var alert = UIAlertController(title: "Alert", message: "Are you sure you want to remove this event?", preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
//            switch action.style{
//            case .Default:
//                print("default")
//                
//            case .Cancel:
//                print("cancel")
//                
//            case .Destructive:
//                print("destructive")
//            }
//        }))
//        self.presentViewController(alert, animated: true, completion: nil)
        if count == 0 {
            // Simple way of adding data
            var newEvent = Event(name: "Event Name 1", date: NSDate())
            events.append(newEvent)
        
            newEvent = Event(name: "Event Name 2", date: NSDate())
            events.append(newEvent)
        } else {
            self.tableView.reloadData()
        }
        count = count + 1
        print("count = '\(count)'")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        events.sortInPlace({$0.date.timeIntervalSinceNow < $1.date.timeIntervalSinceNow})
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        
        // Configure the cell...
        let currentEvent = events[indexPath.row]
        
        cell.textLabel?.text = "'\(currentEvent.name)' '\(currentEvent.date)'"
        
        return cell
    }
    
    func removeEvent(event: Event) -> Bool {
        var found = false
        print("Delete: events.count = '\(events.count)'")
        for index in 0...(self.events.count - 1) {
            if self.events[index].equals(event) {
                self.events.removeAtIndex(index)
                found = true
                break
            }
        }
        self.tableView.reloadData()
        return found
    }
    
    func saveEvent(event: Event, newEvent: Event) -> Bool {
        var found = false
        print("Save: events.count = '\(events.count)'")
        for index in 0...(self.events.count - 1) {
            if self.events[index].equals(event) {
                self.events[index] = newEvent
                found = true
                break
            }
        }
        if found == false {
            events.append(newEvent)
        }
        self.tableView.reloadData()
        return found
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        var descScene = segue.destinationViewController as! AddEventViewController
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedEvent = events[indexPath.row]
            descScene.currentEvent = selectedEvent
        } else {
            let selectedEvent = Event(name: "Create New Event", date: NSDate())
            descScene.currentEvent = selectedEvent
        }
    }
    

}

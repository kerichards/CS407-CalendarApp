//
//  AddEventViewController.swift
//  HW2
//
//  Created by Katherine Richards on 10/23/15.
//  Copyright © 2015 Katherine Richards. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    var currentEvent: Event?
    
    @IBAction func DeleteEvent(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Delete Event", message: "Are you sure you want to remove this event?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .Default, handler: { action in
            switch action.style{
                case .Default:
                    print("Delete default")
                    //var descScene = self.navigationController?.po .nextResponder() as! CalendarTableViewController
                    //descScene.removeEvent(self.currentEvent!)
                    self.navigationController?.popViewControllerAnimated(true)
                    var descScene = self.navigationController?.visibleViewController as! CalendarTableViewController
                    descScene.removeEvent(self.currentEvent!)
                
                case .Cancel:
                    print("delete event canceled")
        
                case .Destructive:
                    print("destructive")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("Delete cancel default")
            case .Cancel:
                print("delete event canceled")
                
            case .Destructive:
                print("destructive")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func SaveEvent(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Save Event", message: "Are you sure you want to save this event?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("Save default")
                self.navigationController?.popViewControllerAnimated(true)
                let newEvent = Event(name: self.nameField.text!, date: self.dateField.date)
                var descScene = self.navigationController?.visibleViewController as! CalendarTableViewController
                descScene.saveEvent(self.currentEvent!, newEvent: newEvent)
            case .Cancel:
                print("save event canceled")
            case .Destructive:
                print("destructive")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("Save cancel default")
            case .Cancel:
                print("save event canceled")
                
            case .Destructive:
                print("destructive")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = currentEvent?.name
        dateField.date = (currentEvent?.date)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    // MARK: - Navigation
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
}



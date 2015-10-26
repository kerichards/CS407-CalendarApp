//
//  Event.swift
//  HW2
//
//  Created by Katherine Richards on 10/23/15.
//  Copyright © 2015 Katherine Richards. All rights reserved.
//

import Foundation

struct Event {
    var name : String
    var date : NSDate
    
    func equals(other: Event) -> Bool {
        if self.name == other.name && self.date == other.date {
            return true
        }
        return false
    }
}
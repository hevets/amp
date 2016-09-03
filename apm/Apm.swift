//
//  Apm.swift
//  apm
//
//  Created by Steve Henderson on 2016-09-02.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

import Cocoa
import Foundation

class Apm {
    
    var currentActions:Int
    var actions:[Int]
    var score:Int
    
    init() {
        // initialize local vars
        currentActions = 0
        actions = [Int](repeating: 0, count: 60)
        score = 0
        
        // start the timer
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.recordActionsPerSecond), userInfo: nil, repeats: true)
    }
    
    // records all the actions in the last second
    @objc func recordActionsPerSecond() {
        if self.actions.count == 60 {
            self.actions.remove(at: 0)
        }
        
        self.actions.append(currentActions)
        currentActions = 0
    }
    
    // captures an event
    func event(event:NSEvent) {
        currentActions += 1
    }
    
    // returns the current apms
    func currentApms() -> Int {
        return self.actions.reduce(self.score) { $0 + $1 }
    }
    
}

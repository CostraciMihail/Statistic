//
//  STTimer.swift
//  Statistic
//
//  Created by winify on 6/21/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit

//TODO: Create class timer for star/stop statistic time

class STTimer: NSTimer {


//   
//    init() {
//        
//        super.init(timeInterval: <#T##NSTimeInterval#>,
//                         target: <#T##AnyObject#>,
//                       selector: <#T##Selector#>,
//                       userInfo: <#T##AnyObject?#>,
//                        repeats: <#T##Bool#>)
//
//    
//    }
    
    
    func getHourMinuteSecondFromTimeWorked(timeWorked time: String) -> (Int, Int, Int) {
        
        let timeFormatter: NSDateFormatter = NSDateFormatter()
        timeFormatter.calendar = NSCalendar.currentCalendar()
        timeFormatter.timeZone = NSTimeZone.localTimeZone()
        timeFormatter.timeStyle = .MediumStyle
        timeFormatter.dateFormat = "hh : mm : ss"
        let date = timeFormatter.dateFromString(time)
        
        let components = NSCalendar.currentCalendar().components([.Hour, .Minute, .Second], fromDate: date!)
        
        return (components.hour, components.minute, components.second)
        
    }
    
    //MAR
//    
//    func timeToWork (timeToWorked time: String) -> (Int, Int, Int) {
//        
//        
//        
//        return ()
//    }
//    
//    func endWorkedDay (timeToWorked time: String) -> <#return type#> {
//        <#function body#>
//    }
}

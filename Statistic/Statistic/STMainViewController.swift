//
//  STMainViewController.swift
//  Statistic
//
//  Created by winify on 5/16/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import SVProgressHUD

class STMainViewController: STBaseViewController {

	var timeIsStarted: Bool = false	
	let statisticConnector: STStatisticConnnector = STStatisticConnnector()
     var counter: Int64 = 0
    
    
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var stopStartButton: UIButton!
	@IBOutlet weak var logOutButton: UIButton!
	
	
	
	//MARK: View Cicle
	//MARK:
	override func viewDidLoad() {
		super.viewDidLoad()
		
		timeIsStarted = false
		self.stopStartButton.setTitle("Start Time", forState: .Normal)
		self.stopStartButton.backgroundColor = UIColor.greenColor()
		self.stopStartButton.layer.cornerRadius = 7
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		self.getStatisticInfo()

	}
	
	
	func getStatisticInfo() -> Void {
		
		SVProgressHUD.dismiss()
		SVProgressHUD.show()
		
		statisticConnector.getStatisticInfo({ (timeStatistic) in
			
			SVProgressHUD.dismiss()
			
			if let timeS = timeStatistic {
				
				appDelegate.user.userTime = timeS
				self.timeLabel.text = appDelegate.user.userTime?.timeWorked
                self.getDifferenceOfTime()
				
				if (timeS.loggedIn != nil) {
					
					if timeS.loggedIn! {
						
						self.changeTitleButton(timeIsStarted: true)
					
					} else {
						
						self.changeTitleButton(timeIsStarted: false)
					}
					
				}
			}
			
			
		}) { (failureError) in
			
			SVProgressHUD.showErrorWithStatus(failureError.description)
			SVProgressHUD.dismissWithDelay(3.0)
			
		}
	}
	
	
	//MARK: Actions
	//MARK:
	@IBAction func stopStartTimeButtonPressed(sender: AnyObject) {
	
		SVProgressHUD.dismiss()
		SVProgressHUD.show()
		
		if timeIsStarted {
	
			userConnector.stopTime({
				
				SVProgressHUD.dismiss()
				self.changeTitleButton(timeIsStarted: false)
				
				}, failureBlock: { (failureError) in
					
					print("failureError: \(failureError)")
					SVProgressHUD.showErrorWithStatus(failureError.description)
					SVProgressHUD.dismissWithDelay(3.0)
			})

		} else {
			
			userConnector.startTime({
				
				SVProgressHUD.dismiss()
				self.changeTitleButton(timeIsStarted: true)
				
				}, failureBlock: { (failureError) in
					
					print("failureError: \(failureError)")
					SVProgressHUD.dismiss()
					SVProgressHUD.showErrorWithStatus(failureError.description)
					SVProgressHUD.dismissWithDelay(3.0)
			})
		}
	}
	
	
	@IBAction func logOutButtonPressed(sender: AnyObject) {
		
		SVProgressHUD.show()
		
		userConnector.logoOut({ (token) in
			
			SVProgressHUD.show()
			SVProgressHUD.dismissWithDelay(0.5)
			
		
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.8 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> () in
			
				self.performSegueWithIdentifier(segueIdentifierOpenLoginView, sender: nil)
			})
			
			
			}) { (failureError) in
			
				SVProgressHUD.showErrorWithStatus(failureError.description)
				SVProgressHUD.dismissWithDelay(3.0)
		}
	}
	
	
	//MARK:OTHER
	//MARK:
	func changeTitleButton(timeIsStarted isStarted: Bool) -> Void {
		
		if  isStarted {
			
			timeIsStarted = isStarted
			self.stopStartButton.setTitle("Stop Time", forState: .Normal)
			self.stopStartButton.backgroundColor = UIColor.redColor()
		
		} else {
			
			timeIsStarted = isStarted
			self.stopStartButton.setTitle("Start Time", forState: .Normal)
			self.stopStartButton.backgroundColor = UIColor.greenColor()
		}
	}
	
	
    //TODO: Finish with update time
    func getDifferenceOfTime() {
        
        print("timeWorked: \(appDelegate.user.userTime?.timeWorked)")
        
        let timeFormatter: NSDateFormatter = NSDateFormatter()
        timeFormatter.calendar = NSCalendar.currentCalendar()
        timeFormatter.timeZone = NSTimeZone.localTimeZone()
        timeFormatter.timeStyle = .MediumStyle
        timeFormatter.dateFormat = "hh : mm : ss"
        
        let date = timeFormatter.dateFromString((appDelegate.user.userTime?.timeWorked)!)
        
        
        print("date: \(NSDate().description)")
        print("\(timeFormatter.dateFromString((appDelegate.user.userTime?.timeWorked)!))")
        
        
        let hourMinuteSecond: NSCalendarUnit = [.Hour, .Minute, .Second]
        let difference = NSCalendar.currentCalendar().components(hourMinuteSecond, fromDate: NSDate(), toDate: date!, options: [])
        
        print("hour: \(difference.hour)")
        print("minute: \(difference.minute)")
        print("second: \(difference.second)")
        
        
        
        NSTimer.scheduledTimerWithTimeInterval(15.0,
                                       target: self,
                                     selector: #selector(self.updateTime(dateT:) as (NSDate) -> Void),
                                     userInfo: nil,
                                      repeats: true)
        
    }
    
    
     func updateTime(dateT date: NSDate) -> Void{
        
        self.counter += 1
        print("counter: \(self.counter)")
    }
    
    
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
}

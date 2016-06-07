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
    var timer = NSTimer()
    var hours:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    

	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var stopStartButton: UIButton!
	@IBOutlet weak var logOutButton: UIButton!
	
	
	//MARK: View Cicle
	//MARK:
	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.getStatisticInfo()
		timeIsStarted = false
		self.stopStartButton.setTitle("Start Time", forState: .Normal)
		self.stopStartButton.backgroundColor = UIColor.greenColor()
		self.stopStartButton.layer.cornerRadius = 7
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

	}

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
	
	func getStatisticInfo() -> Void {
		
		SVProgressHUD.dismiss()
		SVProgressHUD.show()
		
		statisticConnector.getStatisticInfo({ (timeStatistic) in
			
			SVProgressHUD.dismiss()
			
			if let timeS = timeStatistic {
                appDelegate.user.userTime = timeS
                self.timeLabel.text = appDelegate.user.userTime?.timeWorked

				if (timeS.loggedIn != nil) {
					if timeS.loggedIn! {
						self.changeTitleButton(timeIsStarted: true)
                        self.startTimer()
					
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
                self.timer.invalidate()
				self.changeTitleButton(timeIsStarted: false)

            }, failureBlock: { (failureError) in
                print("failureError: \(failureError)")
                SVProgressHUD.showErrorWithStatus(failureError.description)
                SVProgressHUD.dismissWithDelay(3.0)
			})

		} else {
			userConnector.startTime({
				SVProgressHUD.dismiss()
                self.startTimer()
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
            self.timer.invalidate()
			
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
    
    func startTimer() {
        
        let timeFormatter: NSDateFormatter = NSDateFormatter()
        timeFormatter.calendar = NSCalendar.currentCalendar()
        timeFormatter.timeZone = NSTimeZone.localTimeZone()
        timeFormatter.timeStyle = .MediumStyle
        timeFormatter.dateFormat = "hh : mm : ss"
        let date = timeFormatter.dateFromString((appDelegate.user.userTime?.timeWorked)!)
        
        let components = NSCalendar.currentCalendar().components([.Hour, .Minute, .Second], fromDate: date!)
        self.hours = components.hour
        self.minutes = components.minute
        self.seconds = components.second
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                               target: self,
                                             selector: #selector(updateTime),
                                             userInfo: nil,
                                              repeats: true)
        
        self.timer.fire()
    }
    
    
    func updateTime(timer: NSTimer) {

        self.seconds += 1
        
        if self.seconds >= 60 {
            self.minutes += 1
            self.seconds = 0
        }
        
        if self.minutes >= 60 {
            self.hours += 1
            self.minutes = 0
        }
        
        timeLabel.text = " \(String(format: "%02d", self.hours)) : \(String(format: "%02d", self.minutes)) : \(String(format: "%02d", self.seconds)) "
    }
    
    
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
}

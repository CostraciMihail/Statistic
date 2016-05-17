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
	
	
	
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var stopStartButton: UIButton!
	
	//MARK: View Cicle
	//MARK:
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		timeIsStarted = false
		self.stopStartButton.setTitle("Start Time", forState: .Normal)
	}

	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		self.getStatisticInfo()

	}
	
	
	func getStatisticInfo() -> Void {
		
		SVProgressHUD.dismiss()
		SVProgressHUD.show()
		SVProgressHUD.dismissWithDelay(1.5)
		
		statisticConnector.getStatisticInfo({ (timeStatistic) in
			
			SVProgressHUD.dismiss()
			
			if let timeS = timeStatistic {
				
				appDelegate.user.userTime = timeS
				self.timeLabel.text = appDelegate.user.userTime?.timeWorked
				
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
	
	func changeTitleButton(timeIsStarted isStarted: Bool) -> Void {
		
		if  isStarted {
			
			timeIsStarted = isStarted
			self.stopStartButton.setTitle("Stop Time", forState: .Normal)
		
		} else {
			
			timeIsStarted = isStarted
			self.stopStartButton.setTitle("Start Time", forState: .Normal)
		}
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	
}

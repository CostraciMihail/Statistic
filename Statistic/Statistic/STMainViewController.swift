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
		
		statisticConnector.getUserStatistic({ (params) in
			
			
			
			}) { (failureError) in
			
				
				
				
		}
		
	}
	
	
	@IBAction func stopStartTimeButtonPressed(sender: AnyObject) {
	
		SVProgressHUD.show()
		
		if timeIsStarted {
	
			timeIsStarted = false
			
			userConnector.stopTime({ 
				
				SVProgressHUD.dismiss()
				self.stopStartButton.setTitle("Start Time", forState: .Normal)

				
				}, failureBlock: { (failureError) in
					
					print("failureError: \(failureError)")
					SVProgressHUD.showErrorWithStatus(failureError.description)

					
			})

		} else {
			
			timeIsStarted = true

			userConnector.startTime({
				
				SVProgressHUD.dismiss()
				self.stopStartButton.setTitle("Stop Time", forState: .Normal)

				
				}, failureBlock: { (failureError) in
					
					print("failureError: \(failureError)")
					SVProgressHUD.showErrorWithStatus(failureError.description)
			})

		}
		
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	
}

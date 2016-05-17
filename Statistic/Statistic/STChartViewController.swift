//
//  STChartViewController.swift
//  Statistic
//
//  Created by winify on 5/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import SVProgressHUD

class STChartViewController: STBaseViewController {

	let userStatistic: STStatisticConnnector = STStatisticConnnector()
	
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		self.getStatistic()
		
	}
	
	
	
	func getStatistic() -> Void {
		
		SVProgressHUD.show()
		userStatistic.getUserStatistic({ (userStatistic) in
			
			SVProgressHUD.dismiss()
			appDelegate.user.userStatistic = userStatistic
			
			print("daily: \(appDelegate.user.userStatistic!.daily)")
			print("workedDays: \(appDelegate.user.userStatistic!.workedDays)")
			print("fullName: \(appDelegate.user.userTime!.fullName)")
			print("loggedIn: \(appDelegate.user.userTime!.loggedIn)")
			
			
		}) { (failureError) in
			
			SVProgressHUD.dismiss()
			SVProgressHUD.showErrorWithStatus(failureError.description)
			SVProgressHUD.dismissWithDelay(3.0)
		}
		
	}
}

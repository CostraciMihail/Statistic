//
//  STNotificationManager.swift
//  Statistic
//
//  Created by winify on 5/18/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import LNRSimpleNotifications
import AudioToolbox

class STNotificationManager: LNRNotificationManager {
	
	static let shareInstance = LNRNotificationManager()
	
	override init() {
		
		super.init()
		
		self.notificationsPosition = LNRNotificationPosition.Top
		self.notificationsBackgroundColor = UIColor.whiteColor()
		self.notificationsTitleTextColor = UIColor.blackColor()
		self.notificationsBodyTextColor = UIColor.darkGrayColor()
		self.notificationsSeperatorColor = UIColor.grayColor()
		
		let alertSoundURL: NSURL? = NSBundle.mainBundle().URLForResource("click", withExtension: "wav")
		if let _ = alertSoundURL {
			var mySound: SystemSoundID = 0
			AudioServicesCreateSystemSoundID(alertSoundURL!, &mySound)
			self.notificationSound = mySound
		}
	}
	

	
	
}

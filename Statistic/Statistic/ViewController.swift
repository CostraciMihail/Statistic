//
//  ViewController.swift
//  Statistic
//
//  Created by winify on 4/28/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let connector: STConnectorClass

	@IBOutlet weak var logInButton: UIButton!
	@IBOutlet weak var logOutButton: UIButton!
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var startTimeButton: UIButton!
	@IBOutlet weak var stopTimeButton: UIButton!
	
	
	required init?(coder aDecoder: NSCoder) {
		
		connector = STConnectorClass()

		super.init(coder: aDecoder)
	}
	

	
	
	override func viewDidLoad() {
		super.viewDidLoad()

	self.view.backgroundColor = UIColor.redColor()
	
	}

	
	@IBAction func logInButtonPressed(sender: AnyObject) {
	
		let parametres: [String : String] = ["username": "mcostraci", "password": "Roller.sl92"]
		
		connector.logIn(userCredentials: parametres,
		                succesBlock: { (token) in
							
							if let tmpToken = token {
								
								print("Log in with Succes: \(tmpToken)")
								self.label.text = ""
								self.label.text = "Log in with Succes"
							}
							
							
		}) { (failureError) in
			
			self.label.text = ""
			self.label.text = "Log in failure"
		}
	}
	
	
	@IBAction func logOutButtonPressed(sender: AnyObject) {
		
		connector.logOut({ (token) in
			
			self.label.text = ""
			self.label.text = "Log out with Succes"
			
			}) { (failureError) in
				
				self.label.text = ""
				self.label.text = "Log out failure: \(failureError)"
		}
	}
	
	@IBAction func startTimeButtonPressed(sender: AnyObject) {
		
		connector.startTime({ () in
			
			self.label.text = ""
			self.label.text = "Start with Success"
			
		}) { (failureError) in
			
			self.label.text = ""
			self.label.text = "Failure to start time: \(failureError)"
		}
	}
	
	@IBAction func stopTimeButtonPressed(sender: AnyObject) {
	
		connector.stopTime({ () in
			
			self.label.text = ""
			self.label.text = "Stop with Success"
			
		}) { (failureError) in
			
			self.label.text = ""
			self.label.text = "Failure to Stop Time: \(failureError)"
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}



}


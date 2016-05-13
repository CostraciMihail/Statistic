//
//  STLoginViewController.swift
//  Statistic
//
//  Created by winify on 4/28/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit

class STLoginViewController: STBaseViewController {

	let connector: STConnectorClass
	let userConnector: STUserConnector
	

	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var logInButton: UIButton!
	
	
	
	

	required init?(coder aDecoder: NSCoder) {
		
		connector = STConnectorClass()
		userConnector = STUserConnector()
		

		super.init(coder: aDecoder)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()


	}

	
	@IBAction func logInButtonPressed(sender: AnyObject) {
	
//		let parametres: [String : String] = ["username": "mcostrac", "password": "Roller.sl92"]
		let parametres: [String : String] = ["username": self.userNameTextField.text!, "password": self.passwordTextField.text!]
		
		userConnector.logIn(userCredentials: parametres,
								succesBlock: { (token) in
			
				print("Log in with Success token: \(token!)")
				self.performSegueWithIdentifier("tabBarSegue", sender: nil)

									
			
			}) { (failureError) in
				
				print("Log in with failure: \(failureError)")
		}
		
	
		
		
		
//		connector.logIn(userCredentials: parametres,
//		                succesBlock: { (token) in
//							
//							if let tmpToken = token {
//								
//								print("Log in with Succes: \(tmpToken)")
//								self.label.text = ""
//								self.label.text = "Log in with Succes"
//							}
//							
//							
//		}) { (failureError) in
//			
//			self.label.text = ""
//			self.label.text = "Log in failure"
//		}
	}
	
	
	@IBAction func logOutButtonPressed(sender: AnyObject) {
		
		connector.logOut({ (token) in

			
			}) { (failureError) in

		}
	}
	
	@IBAction func startTimeButtonPressed(sender: AnyObject) {
		
		connector.startTime({ () in
			

			
		}) { (failureError) in
			

		}
	}
	
	@IBAction func stopTimeButtonPressed(sender: AnyObject) {
	
		connector.stopTime({ () in
			

			
		}) { (failureError) in
			

		}
		
	}
	
	
	@IBAction func userStatisticButtonPressed(sender: AnyObject) {
		
		connector.userStatistic({ (params) in
			

			
		}) { (failureError) in
			

		}
		
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}



}


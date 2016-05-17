//
//  STLoginViewController.swift
//  Statistic
//
//  Created by winify on 4/28/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import SVProgressHUD

let appDelegate: AppDelegate = AppDelegate()

class STLoginViewController: STBaseViewController {

	

	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var logInButton: UIButton!
	
	
	
	

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		self.userNameTextField.text! = "mcostraci"
		self.passwordTextField.text! = "Roller.sl92"

	}

	
	@IBAction func logInButtonPressed(sender: AnyObject) {
	
		SVProgressHUD.show()
		
		
		let parametres: [String : String] = ["username": self.userNameTextField.text!, "password": self.passwordTextField.text!]
		
		userConnector.logIn(userCredentials: parametres,
								succesBlock: { (token) in

									
				SVProgressHUD.showSuccessWithStatus("Success")
				SVProgressHUD.dismissWithDelay(1.0)
								
				print("appDelegate.user.userName: \(appDelegate.user.userName)")
				print("appDelegate.user.password: \(appDelegate.user.password)")
				print("appDelegate.user.fullName: \(appDelegate.user.fullName)")
				print("token: \(token)")
				
				appDelegate.user.userName =  self.userNameTextField.text!
				appDelegate.user.password = self.passwordTextField.text!

				
				self.performSegueWithIdentifier("tabBarSegue", sender: nil)

									
			}) { (failureError) in
				
				SVProgressHUD.showErrorWithStatus(failureError.description)
				SVProgressHUD.dismissWithDelay(2.0)
				print("Log in with failure: \(failureError)")
		}
	}

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}



}


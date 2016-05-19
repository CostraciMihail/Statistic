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

/// LogInViewController - controller which respond for logIn View
class STLoginViewController: STBaseViewController {

	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var logInButton: UIButton!

	

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		self.userNameTextField.delegate = self
		self.passwordTextField.delegate = self
		self.logInButton.backgroundColor = STAppDesign.mainColor()
		self.logInButton.layer.cornerRadius = 12
		self.view.resignFirstResponder()
		
		self.userNameTextField.text! = "mcostraci"
		self.passwordTextField.text! = "Roller.sl92"
	}

	/**
	Action for LogInButton
	
	- parameter sender: action that was made
	*/
	@IBAction func logInButtonPressed(sender: AnyObject) {
	
		SVProgressHUD.show()
		self.login()
	
	}

	/**
	Called when 'return' key pressed. return NO to ignore.
	
	- parameter textField: textField which is active
	
	- returns: bool
	*/
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		//textField with tag 22 is userNameTextField
		if textField.tag == 22 {
			passwordTextField.becomeFirstResponder()
		
		//textField with tag 23 is passwordTextField
		} else if textField.tag == 23 {
			
			textField.resignFirstResponder()
			self.login()
		}
		
		return true
	}
	
	
	/**
	Send logIn request
	*/
	func login() -> Void {
		
		SVProgressHUD.show()

		let parametres: [String : String] = ["username": self.userNameTextField.text!, "password": self.passwordTextField.text!]
		
		userConnector.logIn(userCredentials: parametres,
		                    succesBlock: { (token) in
								
								
								SVProgressHUD.showSuccessWithStatus("Success")
								SVProgressHUD.dismissWithDelay(0.7)
								
								print("appDelegate.user.userName: \(appDelegate.user.userName)")
								print("appDelegate.user.password: \(appDelegate.user.password)")
								print("appDelegate.user.fullName: \(appDelegate.user.fullName)")
								print("token: \(token)")
								
								appDelegate.user.userName =  self.userNameTextField.text!
								appDelegate.user.password = self.passwordTextField.text!
								
								
								dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> () in
									
									self.performSegueWithIdentifier(segueIdentifierOpenMainView, sender: nil)
								})
								
								
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


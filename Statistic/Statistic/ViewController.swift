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
							}
							
							
							
		}) { (failureError) in
			
		}
	}
	
	
	@IBAction func logOutButtonPressed(sender: AnyObject) {
		
		connector.logOut({ (token) in
			
			
			
			}) { (failureError) in
				
				
				
		}
		
		
	}
	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}



}



//
//  STBaseViewController.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import SVProgressHUD

/// STBaseViewController - it's base controller from which all ViewControllers will inherit
class STBaseViewController: UIViewController, UITextFieldDelegate {
	
	let userConnector: STUserConnector

	
	required init?(coder aDecoder: NSCoder) {
		
		userConnector = STUserConnector()
		SVProgressHUD.setDefaultMaskType(.Clear)
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	
	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	
}

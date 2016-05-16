
//
//  STBaseViewController.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit

class STBaseViewController: UIViewController {
	
	let userConnector: STUserConnector

	
	required init?(coder aDecoder: NSCoder) {
		
		userConnector = STUserConnector()		
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	
}

//
//  STUser.swift
//  Statistic
//
//  Created by winify on 5/6/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import Foundation

class User: AnyObject {
	
	var userName: String?
	var password: String?
	var fullName: String?
	var token   : String?
	
	static let sharedInstance = User()
	
	required init() {}
	
	
}
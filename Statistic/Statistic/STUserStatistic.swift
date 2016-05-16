//
//  File.swift
//  Statistic
//
//  Created by winify on 5/16/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import ObjectMapper

class STTimeStatistic: Mappable {
	
	var fullName: String?
	var timeWorked: String?
	var timeToWork: String?
	var loggedIn: Bool = false
	var error: String?
	
	
	required init?(_ map: Map) {
		
	}
	
	func mapping(map: Map) {
		
		fullName   <- map["username"]
		timeWorked <- map["timeWorked"]
		timeToWork <- map["timeToWork"]
		loggedIn   <- map["loggedIn"]
		error	   <- map["error"]
	}
	
}
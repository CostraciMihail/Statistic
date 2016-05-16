//
//  STStatistic.swift
//  Statistic
//
//  Created by winify on 5/16/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import ObjectMapper

class STStatisticMapper: Mappable {
	
	var daily: Int?
	var weekly: Int?
	var monthly: Int?
	var workedDays: Int?
	var timeToWork: Int?

	
	required init?(_ map: Map) {
		
	}
	
	
	func mapping(map: Map) {
		
		daily		<- map["daily"]
		weekly		<- map["weekly"]
		monthly		<- map["monthly"]
		workedDays  <- map["workedDays"]
		timeToWork  <- map["timeToWork"]
		
	}
	
}

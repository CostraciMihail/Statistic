//
//  STUserMapper.swift
//  Statistic
//
//  Created by winify on 5/16/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import Foundation
import ObjectMapper


class STUserMapper: Mappable {
	
	var userName: String?
	var password: String?
	var fullName: String?
	var token   : String?
	
	static let sharedInstance = STUserMapper()
	
	required init?() {}
	
	required init?(_ map: Map) {
		
	}
	
	func mapping(map: Map) {
	
		
	}
	
}

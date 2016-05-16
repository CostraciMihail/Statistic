//
//  STStatisticConnnector.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class STStatisticConnnector: STConnector {

	let user: STUserMapper = STUserMapper.sharedInstance!
	
	func getUserStatistic(succesBlock: (params: String?) -> Void,
	                   failureBlock: (failureError: NSError) -> Void) -> Void {
		
		let urlString = baseUrl + "/statistics"
		
		Alamofire.request(.POST, urlString, parameters: ["token": self.user.token!], encoding: .JSON)
			.responseObject {(response: Response<STStatisticMapper, NSError>) in
				
				switch response.result {
					
				case .Success:
					
					print("response \(response.result.description)")
					
					if let userStat = response.result.value {
						
			
						print("daily: \(userStat.daily)")
						print("weekly: \(userStat.weekly)")
						print("monthly: \(userStat.monthly)")
						print("workedDays: \(userStat.workedDays)")
						print("timeToWork: \(userStat.timeToWork)")
						
						succesBlock(params: response.result.description)
						print("User Statistic success")
						print("\(response)")
					}
					
					
				case .Failure(let error):
					print(error)
					failureBlock(failureError: error)
					
				}
		}
		
	}

	
	
	func getStatisticInfo(succesBlock: (params: String?) -> Void,
	                      failureBlock: (failureError: NSError) -> Void) -> Void {
		
		
		let urlString = baseUrl + "/statistics/getInfo"
		
		Alamofire.request(.POST, urlString, parameters: ["token": self.user.userName!])
			.responseObject {(response: Response<STTimeStatistic, NSError>) in
				
				switch response.result {
					
				case .Success:
					
					print("response \(response.result.description)")
					
					if let userStatInfo = response.result.value {
						
						print("userStatInfo \(userStatInfo.fullName)")
					
						succesBlock(params: response.result.description)
						print("User Statistic success")
						print("\(response)")
					}
					
					
				case .Failure(let error):
					print(error)
					failureBlock(failureError: error)
					
				}
		}
		
	}
	
	
	
	
}

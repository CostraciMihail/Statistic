//
//  STStatisticConnnector.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper


class STStatisticConnnector: STConnector {

	let user: STUserMapper = STUserMapper.sharedInstance!
	private let userConnector : STUserConnector = STUserConnector()
	
	
	func getUserStatistic(succesBlock: (userStatistic: STStatisticMapper?) -> Void,
	                   failureBlock: (failureError: NSError) -> Void) -> Void {
		
		let urlString = baseUrl + "/statistics"
		
		Alamofire.request(.POST,
					  urlString,
					 parameters: ["token":  appDelegate.user.token!],
					   encoding: .JSON)
					  .responseObject {(response: Response<STStatisticMapper, NSError>) in
							
							print("response \(response.result.description)")
							print("respond: \(response.debugDescription)")

							
							switch response.result {
								case .Success:
									
									print("response \(response.result.description)")
									print("respond: \(response.debugDescription)")

									if let userStat = response.result.value {
										
										print("daily: \(userStat.daily)")
										print("weekly: \(userStat.weekly)")
										print("monthly: \(userStat.monthly)")
										print("workedDays: \(userStat.workedDays)")
										print("timeToWork: \(userStat.timeToWork)")
										
										succesBlock(userStatistic: userStat)
										print("\ngetUserStatistic success")
										print("\(response)")
									}
								
								case .Failure(let error):
                                      print(error)
                                      print("error.code: \(error.code)")
                                      failureBlock(failureError: error)
								}
						  }
		
	}

	
	
	func getStatisticInfo(succesBlock: (timeStatistic: STTimeStatisticMapper?) -> Void,
	                      failureBlock: (failureError: NSError) -> Void) -> Void {
		
		
		let urlString = baseUrl + "/statistics/getInfo"
		
		Alamofire.request(.GET,
					 urlString,
					parameters: ["username" : appDelegate.user.userName!])
				.responseObject {(response: Response<STTimeStatisticMapper, NSError>) in
							
							print("\nrequest \(response.request)")
							print("respond: \(response.debugDescription)")

							
							switch response.result {
								case .Success:
                                
									if let userStatInfo = response.result.value {
										print("\n\n fullName: \(userStatInfo.fullName)")
										print("timeWorked: \(userStatInfo.timeWorked)")
										print("timeToWork: \(userStatInfo.timeToWork)")
										print("loggedIn: \(userStatInfo.loggedIn)")
										print("error: \(userStatInfo.error)")

										succesBlock(timeStatistic: userStatInfo)
										print("\n \n getStatisticInfo success")
										print("\(response)")
									}
								
								case .Failure(let error):
                                    print(error)
                                    failureBlock(failureError: error)
								
								}
						}
		
	}
	

	
}

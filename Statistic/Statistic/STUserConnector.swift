//
//  STUserConnector.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class STUserConnector: STConnector {

	var user : STUserMapper = STUserMapper.sharedInstance!
	
	
	
	func logIn(userCredentials params: [String : String],
						  succesBlock: (token: String?) -> Void,
						 failureBlock: (failureError: NSError) -> Void ) -> Void {
		
		let request: Request = self.requestWithParametres(parametres: params,
		                           serviceUrl: "/login",
								 requesMethod: .REQUEST_METHOD_POST)!
						request.responseJSON { (response) in
					
								print("response \(response.result.description)")
								print("respond: \(response.debugDescription)")

								
								switch response.result {
									case .Success:
										
										if let value = response.result.value {
											
											let json = JSON(value)
											appDelegate.user.token = json["token"].string!
											print("self.authToken: \(appDelegate.user.token)")
											succesBlock(token: appDelegate.user.token!)
										}
										
									case .Failure(let error):
										print(error)
										failureBlock(failureError: error)
										
									}
							}

	}


	
	func logoOut(succesBlock: (token: String?) -> Void,
	             failureBlock: (failureError: NSError) -> Void ) -> Void {
		
		
		let request: Request =
		self.requestWithParametres(parametres: ["token": appDelegate.user.token!],
								   serviceUrl: "/logout",
								  requesMethod: .REQUEST_METHOD_POST)!
									request.responseString { (response) in
										
							print("response \(response.result.description)")
							print("respond: \(response.debugDescription)")

							
							switch response.result {
								case .Success:
									
									succesBlock(token: appDelegate.user.token!)

									
								case .Failure(let error):
									print(error)
									failureBlock(failureError: error)
									
								}
						}
	
	}



	func startTime(succesBlock: () -> Void,
				  failureBlock: (failureError: NSError) -> Void) -> Void {
		
		
		let urlString = baseUrl + "/start"
		Alamofire.request(.POST,
						urlString,
						parameters: ["token":appDelegate.user.token!],
						encoding: .JSON)
						.responseString{ response in
							
								print("response \(response.result.description)")
								print("respond: \(response.debugDescription)")

								
								switch response.result {
									case .Success:
										
										succesBlock()
										print("StartTime successful")
										
										
									case .Failure(let error):
										print(error)
										failureBlock(failureError: error)
										
									}
						}
		
	}
	
	
	
	func stopTime(succesBlock: () -> Void,
				 failureBlock: (failureError: NSError) -> Void) -> Void {
		
		let urlString = baseUrl + "/stop"
		
		Alamofire.request(.POST,
						urlString,
						parameters: ["token":appDelegate.user.token!],
						encoding: .JSON)
						.responseString{ response in
				
							print("response \(response.result.description)")
							print("respond: \(response.debugDescription)")

							
							switch response.result {
								case .Success:
									
									succesBlock()
									print("stopTime successful")
									
									
								case .Failure(let error):
									print(error)
									failureBlock(failureError: error)
									
								}
					}
				
	}
	

}

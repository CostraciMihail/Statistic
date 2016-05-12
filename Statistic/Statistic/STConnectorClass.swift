//
//  STConnectorClass.swift
//  Statistic
//
//  Created by winify on 5/6/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class STConnectorClass: NSObject {

	let baseUrl: String = "http://192.168.3.145"
	var authToken: String?

	
	
	
	
	
	func logIn(userCredentials params: [String : String],
						  succesBlock: (token: String?) -> Void,
						 failureBlock: (failureError: NSError) -> Void ) -> Void {
		
		let urlString = baseUrl + "/login"
		
		Alamofire.request(.POST, urlString, parameters: params, encoding: .JSON)
			.responseJSON { response in
				
				switch response.result {
					
					case .Success:
						
						if let value = response.result.value {
							
							let json = JSON(value)
							self.authToken = json["token"].string!
							succesBlock(token: self.authToken!)
						}
						
					case .Failure(let error):
							print(error)
							failureBlock(failureError: error)
					
					}
			}
	}
	
	
	
	func logOut(succesBlock: () -> Void,
			   failureBlock: (failureError: NSError) -> Void) -> Void {
	
		let urlString = baseUrl + "/logout"
		
		Alamofire.request(.POST, urlString, parameters: ["token":self.authToken!], encoding: .JSON)
			.responseString{ response in
				
				switch response.result {
					
				case .Success:
					
					succesBlock()
					print("Logout succeessfull")

					
				case .Failure(let error):
					print(error)
					failureBlock(failureError: error)
					
				}
		}

	}
	
	
	
	func startTime(succesBlock: () -> Void,
	              failureBlock: (failureError: NSError) -> Void) -> Void {
		
		let urlString = baseUrl + "/start"
		
		Alamofire.request(.POST, urlString, parameters: ["token":self.authToken!], encoding: .JSON)
			.responseString{ response in
				
				switch response.result {
					
				case .Success:
					
					succesBlock()
					print("StartTime succeessfull")
	
					
				case .Failure(let error):
					print(error)
					failureBlock(failureError: error)
					
				}
		}
		
	}
	
	
	func stopTime(succesBlock: () -> Void,
				 failureBlock: (failureError: NSError) -> Void) -> Void {
		
		let urlString = baseUrl + "/stop"
		
		Alamofire.request(.POST, urlString, parameters: ["token":self.authToken!], encoding: .JSON)
			.responseString{ response in
				
				switch response.result {
					
				case .Success:
					
					succesBlock()
					print("stopTime succeessfull")
					
					
				case .Failure(let error):
					print(error)
					failureBlock(failureError: error)
					
				}
		}
		
	}
	
	
	
	func userStatistic(succesBlock: (params: String?) -> Void,
	              failureBlock: (failureError: NSError) -> Void) -> Void {
		
		let urlString = baseUrl + "/stop"
		
		Alamofire.request(.POST, urlString, parameters: ["token":self.authToken!], encoding: .JSON)
			.responseString{ response in
				
				switch response.result {
					
				case .Success:
					
					succesBlock(params: response.result.description)
					print("stopTime succeessfull")
					
					
				case .Failure(let error):
					print(error)
					failureBlock(failureError: error)
					
				}
		}
		
	}
	
	
}

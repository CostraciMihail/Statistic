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

	
	
	func logIn(userCredentials params: [String : String],
						  succesBlock: (token: String?) -> Void,
						 failureBlock: (failureError: NSError) -> Void ) -> Void {
		
		let request: Request = self.requestWithParametres(parametres: params,
		                           serviceUrl: "/login",
								 requesMethod: .REQUEST_METHOD_POST)!
		
		
		request.responseJSON { (response) in
	
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


	
	func logoOut(succesBlock: (token: String?) -> Void,
	             failureBlock: (failureError: NSError) -> Void ) -> Void {
		
		
		
		let request: Request = self.requestWithParametres( parametres: ["token": self.authToken!],
		                                                   serviceUrl: "/logout",
		                                                  requesMethod: .REQUEST_METHOD_POST)!
		
		
		request.responseJSON { (response) in
			
			switch response.result {
				
			case .Success:
				
				succesBlock(token: self.authToken!)

				
			case .Failure(let error):
				print(error)
				failureBlock(failureError: error)
				
			}
		}
		
		
		
		
		
	}




}

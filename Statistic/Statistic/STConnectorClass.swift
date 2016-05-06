//
//  STConnector.swift
//  Statistic
//
//  Created by winify on 5/6/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let baseUrl: String = "http://192.168.3.145"
var authToken: String?


class STConnectorClass: NSObject {
	
	
	
	func logIn(userCredentials params: [String : String] ) -> String {
		
		
		Alamofire.request(.POST, "http://192.168.3.145/login", parameters: params, encoding: .JSON)
			.responseJSON { response in
				
				switch response.result {
					
					case .Success:
						
						if let value = response.result.value {
							
							let json = JSON(value)
							print("user.token: \(json["token"].string!) ")

							authToken = json["token"].string!
						}
						
					case .Failure(let error):
						print(error)
					}
			}
		
		
		return authToken!
	}
	
	
	
	
}

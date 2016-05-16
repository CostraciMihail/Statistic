//
//  STConnector.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


enum REQUEST_METHOD {
	
	case REQUEST_METHOD_GET
	case REQUEST_METHOD_POST
	case REQUEST_METHOD_DELETE
}


class STConnector: NSObject {

	let baseUrl: String = "http://192.168.3.145"
//	var authToken: String?

	
	 func requestWithParametres(parametres parmas: [String:String], serviceUrl service: String, requesMethod method: REQUEST_METHOD) -> Request? {
		
		let urlString = baseUrl + service
		
		switch method {
			
			case .REQUEST_METHOD_GET:
				return Alamofire.request(.GET, urlString, parameters: parmas, encoding: .JSON)

			
				
			case .REQUEST_METHOD_POST:
				
			 return	Alamofire.request(.POST, urlString, parameters: parmas, encoding: .JSON)
			

				
			
			default: return nil
		}
		
		
	}
	
}

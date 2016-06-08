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

	
	 func requestWithParametres(parametres parmas: [String:String],
							   serviceUrl service: String,
							  requesMethod method: REQUEST_METHOD) -> Request? {
		
			let urlString = baseUrl + service
			
			switch method {
				case .REQUEST_METHOD_GET:
					return Alamofire.request(.GET, urlString, parameters: parmas, encoding: .JSON)

				
				case .REQUEST_METHOD_POST:
				 return	Alamofire.request(.POST, urlString, parameters: parmas, encoding: .JSON)

				default: return nil
			}
	}


    func reLogIn(succesBlock succesBlock: () -> Void,
                failureBlock: (failureError: NSError) -> Void) -> Void {
        
        let params = ["username": appDelegate.user.userName!, "password": appDelegate.user.password!]
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
                    
                    succesBlock()
                }
                
            case .Failure(let error):
                print(error)
                failureBlock(failureError: error)
                
            }
        }
    }

    
	
	
}

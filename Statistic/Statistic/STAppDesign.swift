//
//  STAppDesign.swift
//  Statistic
//
//  Created by winify on 5/13/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit


class STAppDesign: NSObject {

	
 class func RGBColor (hex: Int, alpha: Double) -> UIColor {
	
		let red = Double((hex & 0xFF0000) >> 16) / 255.0
		let green = Double((hex & 0xFF00) >> 8) / 255.0
		let blue = Double((hex & 0xFF)) / 255.0
		let color: UIColor = UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha:CGFloat(alpha) )
		return color
	}
	
	
	class func mainColor() -> UIColor {

		return RGBColor(0xF16D1A, alpha: 1.0)
	}
	
}

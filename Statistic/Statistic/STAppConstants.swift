//
//  STAppConstants.swift
//  Statistic
//
//  Created by winify on 5/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit

//SEGUES IDENTIFIES
let segueIdentifierOpenLoginView: String = "showLogInViewSegue"
let segueIdentifierOpenMainView: String = "openMainView"



//IPHONES

let IS_IPAD: Bool = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)
let IS_IPHONE: Bool = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone)

let IS_WIDE_IPHONE: Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.width > 320)
let IS_IPHONE_4: Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height < 568.0)
let IS_IPHONE_5: Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 568.0)
let IS_IPHONE_6: Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 667.0)
let IS_IPHONE_6PLUS: Bool = (IS_IPHONE && UIScreen.mainScreen().nativeScale == 3.0)
let IS_IPHONE_6_PLUS: Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 736.0)
let IS_RETINA: Bool = (UIScreen.mainScreen().scale == 2.0)



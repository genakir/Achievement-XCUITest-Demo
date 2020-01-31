//
//  LoginScreen.swift
//  Achievement-UITestsUITests
//
//  Created by Gennadii Kennedy on 1/31/20.
//  Copyright © 2020 Gennadii Kiryushatov. All rights reserved.
//

import Foundation
import XCTest

struct MainScreen {
    
    let mainNavigationBar = app.navigationBars.matching(identifier: "Achievement.Main").element
    let thirdTabBarButton = app.tabBars.children(matching: .button).element(boundBy: 2)
    
}

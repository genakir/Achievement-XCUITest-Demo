//
//  LoginScreen.swift
//  Achievement-UITestsUITests
//
//  Created by Gennadii Kennedy on 1/31/20.
//  Copyright © 2020 Gennadii Kiryushatov. All rights reserved.
//

import Foundation
import XCTest

let app = XCUIApplication(bundleIdentifier: "com.achievemint.app")

struct LoginScreen {
    
    let emailTextField = app.textFields.element
    let passwordSecureTextField = app.secureTextFields.element
    let chevronButton = app.buttons["Chevron"]
    let goButton = app.buttons.matching(identifier: "Go").element
    let incorrectEmailOrPasswordStaticText = app.staticTexts["Incorrect email or password"]
    
}

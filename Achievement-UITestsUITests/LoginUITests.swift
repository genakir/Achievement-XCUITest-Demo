//
//  LoginUITests.swift
//  Achievement-UITestsUITests
//
//  Created by Gennadii Kennedy on 1/31/20.
//  Copyright © 2020 Gennadii Kiryushatov. All rights reserved.
//

import Foundation

extension Achievement_UITestsUITests {
    
    func testLoginWithCorrectCredentials() {
        loginWithCredentials(email: "genakir@gmail.com", password: "Pass123456")
    }
    
    func testLoginWithIncorrectCredentials() {
        loginWithCredentials(email: "genakir@gmail.com", password: "password")
    }
    
    func testLogOut() {
        // Checking which screen is loaded (login or main)
        _ = waitForOneOf(elements: [loginScreen.emailTextField, mainScreen.mainNavigationBar])
        // If login screen is loaded - log in to the app
        if loginScreen.emailTextField.exists {
            loginWithCredentials(email: "genakir@gmail.com", password: "Pass123456")
        }
        waitForAndTapOn(element: mainScreen.thirdTabBarButton)
        waitForAndTapOn(element: accountScreen.logOutButton)
        waitForAndTapOn(element: accountScreen.yesButton)
        waitFor(element: loginScreen.emailTextField)
    }
    
}

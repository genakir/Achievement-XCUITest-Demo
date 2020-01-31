//
//  Achievement_UITestsUITests.swift
//  Achievement-UITestsUITests
//
//  Created by Gennadii Kennedy on 1/31/20.
//  Copyright © 2020 Gennadii Kiryushatov. All rights reserved.
//

import XCTest

class Achievement_UITestsUITests: XCTestCase {

    let app = XCUIApplication(bundleIdentifier: "com.achievemint.app")
    let loginScreen = LoginScreen()
    let mainScreen = MainScreen()
    let accountScreen = AccountScreen()
    
    override func setUp() {

        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {

    }
    
    func waitForAndTapOn(element: XCUIElement, timeout: TimeInterval = 15, file: StaticString = #file, line: UInt = #line) {
        XCTAssertTrue(element.waitForExistence(timeout: timeout), "\(element) isn't present on the screen after \(timeout) seconds", file: file, line: line)
        element.tap()
    }
    
    func waitFor(element: XCUIElement, timeout: TimeInterval = 15, file: StaticString = #file, line: UInt = #line) {
        XCTAssertTrue(element.waitForExistence(timeout: timeout), "\(element) isn't present on the screen after \(timeout) seconds", file: file, line: line)
    }
    
    func waitForOneOf(elements: [XCUIElement], timeout: TimeInterval = 15, file: StaticString = #file, line: UInt = #line) -> Bool {
        let startTime = NSDate.timeIntervalSinceReferenceDate
        while true {
            if NSDate.timeIntervalSinceReferenceDate - startTime > timeout {
                XCTFail("\(elements) aren't present on the screen after \(timeout) seconds", file: file, line: line)
                return false
            }
            for element in elements {
                if element.exists {
                    return true
                }
            }
            sleep(1)
        }
    }
    
    func loginWithCredentials(email: String, password: String) {
        logOutIfLoggedIn()
        waitForAndTapOn(element: loginScreen.emailTextField)
        loginScreen.emailTextField.typeText(email)
        waitForAndTapOn(element: loginScreen.chevronButton)
        waitForAndTapOn(element: loginScreen.passwordSecureTextField)
        loginScreen.passwordSecureTextField.typeText(password)
        waitForAndTapOn(element: loginScreen.goButton)
        if password == "password" { // if using incorrect password - we should expect incorrect alert
            waitFor(element: loginScreen.incorrectEmailOrPasswordStaticText)
        } else {
            waitFor(element: mainScreen.mainNavigationBar)
        }
    }
    
    func logOutIfLoggedIn() {
        _ = waitForOneOf(elements: [loginScreen.emailTextField, mainScreen.mainNavigationBar])
        if mainScreen.mainNavigationBar.exists {
            waitForAndTapOn(element: mainScreen.thirdTabBarButton)
            waitForAndTapOn(element: accountScreen.logOutButton)
            waitForAndTapOn(element: accountScreen.yesButton)
            waitFor(element: loginScreen.emailTextField)
        }
    }

}

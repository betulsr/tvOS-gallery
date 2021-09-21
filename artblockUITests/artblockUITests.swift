//
//  artblockUITests.swift
//  artblockUITests
//
//  Created by betül s on 2021-05-24.
//

import XCTest

class artblockUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        takeScreenshot(named: "Overview")
        if(app.textViews["Artblock"].exists == true)
        {
            takeScreenshot(named: "QRView")
        }
        let element = app.images["Showcase Images"]
        self.waitForElementToAppear(element: element, timeout: 30)
        if(app.images["Showcase Images"].exists == true){
            takeScreenshot(named: "Showcase")
        }
        sleep(6)
        takeScreenshot(named: "Art")
        sleep(6)
        takeScreenshot(named: "Art#2")
    }

    
    func takeScreenshot(named name: String) {
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(UIDevice.current.name)-\(name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
    
    func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,  file: String = #file, line: UInt = #line) {
            let existsPredicate = NSPredicate(format: "exists == true")

        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)

        waitForExpectations(timeout: timeout) { (error) -> Void in
                if (error != nil) {
                    let message = "Failed to find \(element) after \(timeout) seconds."
                    self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
                }
            }
        }
    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}

//
//  WebViewTests.swift
//  PragmaticTweets
//
//  Created by Sam Marten on 12/21/14.
//  Copyright (c) 2014 Sam Marten. All rights reserved.
//

import UIKit
import XCTest
import PragmaticTweets

class WebViewTests: XCTestCase, UIWebViewDelegate {

    var loadedWebViewExpectation : XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAutomaticWebLoad() {
        if let viewController = UIApplication.sharedApplication().windows[0].rootViewController as? ViewController
        {
            viewController.twitterWebView.delegate = self
            self.loadedWebViewExpectation = expectationWithDescription("web view auto-load test")
            waitForExpectationsWithTimeout(5.0, handler:nil)
        } else {
            XCTFail("couldn't get root view controller")
        }
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        XCTFail("web view load failed")
        self.loadedWebViewExpectation!.fulfill()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        if let webViewContents = webView.stringByEvaluatingJavaScriptFromString("document.documentElement.textContent") {
            if webViewContents != "" {
                self.loadedWebViewExpectation!.fulfill()
            }
        }
    }

}

//
//  ViewController.swift
//  PragmaticTweets
//
//  Created by Sam Marten on 12/13/14.
//  Copyright (c) 2014 Sam Marten. All rights reserved.
//

import UIKit
import Social

public class ViewController: UIViewController {

    @IBOutlet public weak var twitterWebView: UIWebView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.reloadTweets()
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleShowMyTweetsButtonTapped(sender: UIButton) {
        self.reloadTweets()
    }

    @IBAction func handleTweetButtonTapped(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let tweetVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            let message = NSLocalizedString("I just finished the first project in iOS 8 SDK Development. #pragsios8", comment: "")
            tweetVC.setInitialText(message)
            self.presentViewController(tweetVC, animated: true, completion: nil)
        } else {
            println("Can't send tweet")
        }
    }
    
    func reloadTweets() {
        let url = NSURL(string: "http://www.twitter.com/sammartendev")
        let urlRequest = NSURLRequest(URL: url!)
        self.twitterWebView.loadRequest(urlRequest)
    }
}


//
//  WikiViewController.swift
//  StarWarsSwift
//
//  Created by Joan on 10/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var character : Character = Character()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    convenience init(character: Character)
    {
        self.init(nibName:"WikiViewController", bundle:nil)
        //self.init()
        self.character = character
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("notifyThatCharacterDidChange:"), name: "CHARACTER_DID_CHANGE_NOTIFICATION_NAME", object: nil)
        
        //NSNotificationCenter.defaultCenter().postNotificationName("CHARACTER_DID_CHANGE_NOTIFICATION_NAME", object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        if var charUrl = character.wikiUrl{
            var request = NSURLRequest(URL: charUrl)
            self.webView.loadRequest(request)
        }else{
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - WebView
    
    func webViewDidFinishLoad(webView: UIWebView){
        self.activityIndicator.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError){
        self.activityIndicator.stopAnimating()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    // MARK: - Notifications
    func notifyThatCharacterDidChange(notification : NSNotification)
    {
    
    }


}

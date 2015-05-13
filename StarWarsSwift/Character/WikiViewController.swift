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
    var canLoad : Bool = false
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    convenience init(character: Character)
    {
        self.init(nibName:"WikiViewController", bundle:nil)
        self.character = character
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("notifyThatCharacterDidChange:"), name: notificationChangeCharacter, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadWebView()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    func reloadWebView()
    {
        self.canLoad = true
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
        self.canLoad = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError){
        self.activityIndicator.stopAnimating()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return self.canLoad
    }

    // MARK: - Notifications
    func notifyThatCharacterDidChange(notification : NSNotification)
    {
        if var characterDict = notification.userInfo,
            var char = characterDict[notificationCharacterKey] as? Character{
                character = char
                reloadWebView()
        }
    }


}

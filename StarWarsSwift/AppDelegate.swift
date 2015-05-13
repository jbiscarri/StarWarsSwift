//
//  AppDelegate.swift
//  StarWarsSwift
//
//  Created by Joan on 08/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

import UIKit


let kLastSelectedCharacter:String = "lastSelectedCharacter";

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        saveDefaultCharacter()
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        var model = Universe()
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad){
            configureForPadWithModel(model)
        }else{
            configureForPhoneWithModel(model)
        }
                
        window?.makeKeyAndVisible()
        
        return true
    }

    func configureForPadWithModel(model:Universe)
    {
        var universeVC = UniverseTableViewController(style: .Plain, model: model)
        var characterVC:CharacterViewController;
        if var char = lastSelectedCharacterInModel(model)
        {
            characterVC = CharacterViewController(character: char)
        }else{
            characterVC = CharacterViewController()
        }
        universeVC.delegate = characterVC
        var uNav = UINavigationController(rootViewController: universeVC)
        var cNav = UINavigationController(rootViewController: characterVC)
        var splitVC = UISplitViewController()
        splitVC.viewControllers = [uNav, cNav]
        splitVC.delegate = characterVC
        window?.rootViewController = splitVC
        
    }
    
    func configureForPhoneWithModel(model:Universe)
    {
        var universeVC = UniverseTableViewController(style: .Plain, model: model)
        universeVC.delegate = universeVC
        var navigation = UINavigationController(rootViewController: universeVC)
        window?.rootViewController = navigation
    }
    
    func saveDefaultCharacter()
    {
        var def = NSUserDefaults.standardUserDefaults()
        if def.objectForKey(kLastSelectedCharacter) == nil {
            def.setObject([0,0], forKey: kLastSelectedCharacter)
            def.synchronize()
        }
    }
    
    func lastSelectedCharacterInModel(model: Universe) -> (Character?)
    {
        var def = NSUserDefaults.standardUserDefaults()
        if var lastCharacterData:NSArray = def.objectForKey(kLastSelectedCharacter) as? NSArray{
            if var section : NSInteger = lastCharacterData[0] as? NSInteger,
                var pos : NSInteger = lastCharacterData[1] as? NSInteger{
                    if (section == ImperialSection) {
                        return model.imperialAtIndex(pos)
                    }else{
                        return model.rebelAtIndex(pos)
                    }
            }
        }
        return nil
    }
    
    
    
}


//
//  Character.swift
//  StarWarsSwift
//
//  Created by Joan on 08/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

import UIKit

class Character {
    var name : String?
    var alias : String?
    var wikiUrl : NSURL?
    var soundData : NSData?
    var photo : UIImage?
    
    init(){}
    
    init(name: String, alias: String, wikiUrl: NSURL, soundData: NSData, photo: UIImage) {
        self.name = name
        self.alias = alias
        self.wikiUrl = wikiUrl
        self.soundData = soundData
        self.photo = photo
    }
    
    init(alias: String, wikiUrl: NSURL, soundData: NSData, photo: UIImage) {
        self.name = nil
        self.alias = alias
        self.wikiUrl = wikiUrl
        self.soundData = soundData
        self.photo = photo
    }   
}

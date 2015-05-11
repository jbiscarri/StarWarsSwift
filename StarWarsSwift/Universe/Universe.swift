//
//  Universe.swift
//  StarWarsSwift
//
//  Created by Joan on 08/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

import UIKit

class Universe {
    var _rebels : Array<Character> = Array()
    var _imperials : Array<Character> = Array()
    
    init(){
        var bundle = NSBundle.mainBundle()
        
        //vader
        var vader : Character = Character()
        if var vaderUrl = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader"),
            var vaderSoundURL = bundle.URLForResource("vader", withExtension: "caf"),
            var vaderSound = NSData(contentsOfURL: vaderSoundURL),
            var vaderImage = UIImage(named: "darthVader.jpg"){
                vader = Character(name: "Anakin Skywalker", alias: "Darth Vader", wikiUrl: vaderUrl, soundData: vaderSound, photo: vaderImage)
        }
        
        // Tarkin
        var tarkin : Character = Character()
        if var tarkinUrl = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"),
            var tarkinSoundURL = bundle.URLForResource("tarkin", withExtension: "caf"),
            var tarkinSound = NSData(contentsOfURL: tarkinSoundURL),
            var tarkinImage = UIImage(named: "tarkin.jpg"){
                tarkin = Character(name: "Wilhuf Tarkin", alias: "Grand Moff Tarkin", wikiUrl: tarkinUrl, soundData: tarkinSound, photo: tarkinImage)
        }
        
        //palpatine
        var palpatine : Character = Character()
        if var palpatineUrl = NSURL(string: "http://en.wikipedia.org/wiki/palpatine"),
            var palpatineSoundURL = bundle.URLForResource("palpatine", withExtension: "caf"),
            var palpatineSound = NSData(contentsOfURL: palpatineSoundURL),
            var palpatineImage = UIImage(named: "palpatine.jpg"){
                palpatine = Character(name: "Palpatine", alias: "Darth Sidious", wikiUrl: palpatineUrl, soundData: palpatineSound, photo: palpatineImage)
        }
        
        //Chewbacca
        var chewie : Character = Character()
        if var chewieUrl = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca"),
            var chewieSoundURL = bundle.URLForResource("chewbacca", withExtension: "caf"),
            var chewieSound = NSData(contentsOfURL: chewieSoundURL),
            var chewieImage = UIImage(named: "chewbacca.jpg"){
                chewie = Character( alias: "Chewbacca", wikiUrl: chewieUrl, soundData: chewieSound, photo: chewieImage)
        }
        
        // C-3PO
        var c3po : Character = Character()
        if var c3poUrl = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO"),
            var c3poSoundURL = bundle.URLForResource("c3po", withExtension: "caf"),
            var c3poSound = NSData(contentsOfURL: c3poSoundURL),
            var c3poImage = UIImage(named: "c3po.jpg"){
                c3po = Character( alias: "C-3PO", wikiUrl: c3poUrl, soundData: c3poSound, photo: c3poImage)
        }
        
        var yoda : Character = Character()
        if var yodaUrl = NSURL(string: "http://en.wikipedia.org/wiki/Yoda"),
            var yodaSoundURL = bundle.URLForResource("yoda", withExtension: "caf"),
            var yodaSound = NSData(contentsOfURL: yodaSoundURL),
            var yodaImage = UIImage(named: "yoda.jpg"){
                yoda = Character(name: "Minch Yoda", alias: "Master Yoda", wikiUrl: yodaUrl, soundData: yodaSound, photo: yodaImage)
        }
        
        // R2-D2
        var r2d2 : Character = Character()
        if var r2d2Url = NSURL(string: "http://en.wikipedia.org/wiki/R2-D2"),
            var r2d2SoundURL = bundle.URLForResource("r2-d2", withExtension: "caf"),
            var r2d2Sound = NSData(contentsOfURL: r2d2SoundURL),
            var r2d2Image = UIImage(named: "R2-D2.jpg"){
                r2d2 = Character( alias: "R2-D2", wikiUrl: r2d2Url, soundData: r2d2Sound, photo: r2d2Image)
        }
        
        
        _imperials = [vader, tarkin, palpatine]
        _rebels = [chewie, c3po, yoda, r2d2]
        
    }
    
    func rebelAtIndex(index: Int) -> Character{
        return _rebels[index]
    }
    
    func imperialAtIndex(index: Int) -> Character{
        return _imperials[index]
    }
    
    var imperialCount : Int  {
        return _imperials.count
    }
    
    var rebelCount : Int  {
        return _rebels.count
    }
        
}

//
//  CharacterViewController.swift
//  StarWarsSwift
//
//  Created by Joan on 09/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

import UIKit


class CharacterViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var character : Character = Character()
    var player : CafPlayer = CafPlayer.cafPlayer() as! CafPlayer
    
    convenience init(character: Character)
    {
        self.init(nibName:"CharacterViewController", bundle:nil)
        //self.init()
        self.character = character
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    
    @IBAction func play(sender: AnyObject) {
        self.player.playSoundData(self.character.soundData)
    }

    @IBAction func wiki(sender: AnyObject) {
        var wikiVC = WikiViewController(character:self.character)
        self.navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    func configureView()
    {
        //Photo
        if var photo = character.photo{
            self.imageView.image = photo
        }else{
            self.imageView?.image = nil
        }
        
    }
    

}

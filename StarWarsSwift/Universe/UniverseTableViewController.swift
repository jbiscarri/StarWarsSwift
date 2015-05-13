//
//  UniverseTableViewController.swift
//  StarWarsSwift
//
//  Created by Joan on 08/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//


import UIKit

let ImperialSection : Int = 0
let RebelSection : Int = 1
let notificationChangeCharacter : String = "CHARACTER_DID_CHANGE_NOTIFICATION_NAME"
let notificationCharacterKey : String = "char"



protocol UniverseTableViewControllerDelegate
{
    func universeTableViewController(uVC:UniverseTableViewController, character:Character)
}

class UniverseTableViewController: UITableViewController, UniverseTableViewControllerDelegate {
    

    
    var _model : Universe? = nil
    var delegate : UniverseTableViewControllerDelegate? = nil

    convenience init(style: UITableViewStyle, model: Universe) {
        self.init(style:style)
        _model = model
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cellNib = UINib(nibName: "UniverseCellTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "UniverseCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if var model = _model{
            if (section == ImperialSection) {
                return model.imperialCount;
            }else{
                return model.rebelCount;
            }
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UniverseCell", forIndexPath: indexPath) as! UniverseCellTableViewCell
        if var char = self.getDesiredCharacter(indexPath){
            cell.configureCell(char)
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 60
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if var model = _model{
            if (section == ImperialSection) {
                return "IMPERIALS"
            }else{
                return "REBELS"
            }
        }
        return nil
    } 

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if var char = self.getDesiredCharacter(indexPath){
            var characterVC = CharacterViewController(character: char)
            
            if var dele = delegate{
                dele.universeTableViewController(self, character: char)
            }
            
            NSNotificationCenter.defaultCenter().postNotificationName(notificationChangeCharacter, object: self, userInfo: [notificationCharacterKey:char])
            
            var def = NSUserDefaults.standardUserDefaults()
            def.setObject([indexPath.section,indexPath.row], forKey: kLastSelectedCharacter)
            def.synchronize()
        }

    }
    
    func getDesiredCharacter(indexPath:NSIndexPath) -> Character?
    {
        var character : Character?
        if var model = _model{
            if (indexPath.section == ImperialSection) {
                character = model.imperialAtIndex(indexPath.row)
            }else{
                character = model.rebelAtIndex(indexPath.row)
            }
        }
        return character
    }
    
    //Protocol
    func universeTableViewController(uVC: UniverseTableViewController, character: Character) {
        var characterVC = CharacterViewController(character: character)
        self.navigationController?.pushViewController(characterVC, animated: true)
    }
    
}

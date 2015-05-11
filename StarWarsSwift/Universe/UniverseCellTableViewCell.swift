//
//  UniverseCellTableViewCell.swift
//  StarWarsSwift
//
//  Created by Joan on 09/05/15.
//  Copyright (c) 2015 Biscarri. All rights reserved.
//

import UIKit

class UniverseCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellAlias: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(character: Character)
    {
        //Photo
        if var photo = character.photo{
            cellImage?.image = photo
        }else{
            cellImage?.image = nil
        }
        
        //Name
        if var name = character.name{
            cellName?.text = name
        }else{
            cellName?.text = ""
        }
        
        //ALIAS
        if var alias = character.alias{
            cellAlias?.text = alias
        }else{
            cellAlias?.text = ""
        }
    }
    
}

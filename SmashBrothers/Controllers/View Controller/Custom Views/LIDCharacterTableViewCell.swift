//
//  LIDCharacterTableViewCell.swift
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class LIDCharacterTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    //MARK: - Properties
    
    var character: LIDCharacters?{
        didSet{
            updateCell()
        }
    }
    
    var thumbnail: UIImage?{
        didSet{
            updateCell()
        }
    }
    
    //MARK: - Private Methods
    private func updateCell(){
        guard let character = character else {return}
        characterLabel.text = character.name
        guard let thumbnail = thumbnail else {return}
        characterImageView.image = thumbnail
    }
    
}

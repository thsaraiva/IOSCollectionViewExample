//
//  CollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Thiago Saraiva on 16/08/2018.
//  Copyright © 2018 ThiagoSaraiva. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellTitle : UILabel!
    @IBOutlet weak var selectionImage : UIImageView!
    
    var isEditting: Bool = false {
        didSet {
            selectionImage.isHidden = !isEditting
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if isEditting{
                selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
    
}

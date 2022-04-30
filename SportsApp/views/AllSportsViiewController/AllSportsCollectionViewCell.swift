//
//  AllSportsCollectionViewCell.swift
//  SportsApp
//
//  Created by Ali on 30/04/2022.
//

import UIKit

class AllSportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var allSportImageView: UIImageView!
    
    @IBOutlet weak var sportName: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        allSportImageView.image = nil
    }
    
    
}

//
//  OnBordingCollectionViewCell.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 21/06/21.
//

import UIKit

class OnBordingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var steperImage: UIImageView!
    @IBOutlet var title: UILabel!
    
    @IBOutlet var descriptions: UILabel!
    
    
    func setup(_ slide : onBoadingSlide){
        
        steperImage.image = slide.slideImage
        title.text = slide.title
        descriptions.text = slide.description
      
    }
}

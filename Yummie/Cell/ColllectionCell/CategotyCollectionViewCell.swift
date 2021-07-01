//
//  CategotyCollectionViewCell.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 22/06/21.
//

import UIKit
import Kingfisher




class CategotyCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet var categoryTitle: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func setup(category : DishCategory){
        
        categoryTitle.text = category.title
        
        categoryImage.kf.setImage(with: category.image?.asUrl)
        
       // categoryImage.image = category.image
        
    }

}

//
//  ChefSpecialCollectionViewCell.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 23/06/21.
//

import UIKit



class ChefSpecialCollectionViewCell: UICollectionViewCell {

    @IBOutlet var title: UILabel!
  
    @IBOutlet var calories: UILabel!
    @IBOutlet var dishImage: UIImageView!
    override func awakeFromNib() {
      
        super.awakeFromNib()
       
    }
    
    func setup(chefDish : Dish){
        
        title.text = chefDish.name
        
        calories.text = "\(chefDish.calories ?? 0)"
        dishImage.kf.setImage(with: chefDish.image?.asUrl)
    }
    

}

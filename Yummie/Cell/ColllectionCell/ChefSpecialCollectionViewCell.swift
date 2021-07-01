//
//  ChefSpecialCollectionViewCell.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 23/06/21.
//

import UIKit



class ChefSpecialCollectionViewCell: UICollectionViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var descriptions: UILabel!
    @IBOutlet var calories: UILabel!
    @IBOutlet var dishImage: UIImageView!
    override func awakeFromNib() {
      
        super.awakeFromNib()
       
    }
    
    func setup(chefDish : Dish){
        
        title.text = chefDish.name
        descriptions.text = chefDish.desctiption
        calories.text = chefDish.formettedCalories
        dishImage.kf.setImage(with: chefDish.image?.asUrl)
    }
    

}

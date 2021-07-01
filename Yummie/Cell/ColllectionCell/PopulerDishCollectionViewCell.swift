//
//  PopulerDishCollectionViewCell.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 23/06/21.
//

import UIKit





class PopulerDishCollectionViewCell: UICollectionViewCell {
    var cellClicked : ((Int) -> Void)?
    @IBOutlet var title: UILabel!
    @IBOutlet var populerDishImage: UIImageView!
    @IBOutlet var caleroryTitle: UILabel!
    @IBOutlet var descriptions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(populerDish : Dish){
        
        title.text = populerDish.name
        populerDishImage.kf.setImage(with: populerDish.image?.asUrl)
        caleroryTitle.text = populerDish.formettedCalories
        descriptions.text = populerDish.desctiption
    }
  

}

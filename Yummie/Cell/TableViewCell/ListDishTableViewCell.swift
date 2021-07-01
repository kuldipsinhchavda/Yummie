//
//  ListDishTableViewCell.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 25/06/21.
//

import UIKit

class ListDishTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var descriptions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func listDish(dish : Dish){
        
        title.text = dish.name
        dishImage.kf.setImage(with: dish.image?.asUrl)
        descriptions.text = dish.description
        
    }
    func orderSetup(order : order){
        
        title.text = order.dish?.name
        dishImage.kf.setImage(with: order.dish?.image?.asUrl)
        descriptions.text = order.name
    }
}

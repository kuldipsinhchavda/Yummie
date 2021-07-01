//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 24/06/21.
//

import UIKit

class DishDetailsViewController: UIViewController {
    @IBOutlet var dishImage: UIImageView!
    var dish : Dish!
    @IBOutlet var calories: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var titleLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populerView()
    }

    func populerView(){
        dishImage.kf.setImage(with: dish.image?.asUrl)
        titleLable.text = dish.name
        calories.text = dish.formettedCalories
        descriptionLbl.text = dish.desctiption
    }
    @IBAction func placeOrder(_ sender: UIButton) {
    }
}

//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 24/06/21.
//

import UIKit
import ProgressHUD

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
        calories.text = "\(dish.calories ?? 0)"
        descriptionLbl.text = dish.description
    }
    @IBAction func placeOrder(_ sender: UIButton) {
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else { ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
                
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
}

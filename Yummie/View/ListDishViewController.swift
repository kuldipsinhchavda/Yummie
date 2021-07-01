//
//  ListDishViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 25/06/21.
//

import UIKit

class ListDishViewController: UIViewController {

    var listDish : [Dish] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ListDishTableViewCell", bundle: .main), forCellReuseIdentifier: "ListDishTableViewCell")
     
    }

}
extension ListDishViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListDishTableViewCell", for: indexPath) as! ListDishTableViewCell
        cell.listDish(dish: listDish[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aVc = storyboard?.instantiateViewController(identifier: "DishDetailsViewController") as! DishDetailsViewController
        aVc.dish = listDish[indexPath.row]
        navigationController?.pushViewController(aVc, animated: true)
    }
}

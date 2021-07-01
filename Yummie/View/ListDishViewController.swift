//
//  ListDishViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 25/06/21.
//

import UIKit

class ListDishViewController: UIViewController {

    var category : DishCategory!
    var listDish : [Dish] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.title
        tableView.register(UINib(nibName: "ListDishTableViewCell", bundle: .main), forCellReuseIdentifier: "ListDishTableViewCell")
        var categoryData = [String : Any]()
        categoryData["id"] = category.id
        
    
        commenWs.getURL(url: "dishes/\(category.id)") { (responce, status) in
            
            
          if let data = responce["data"] as? [NSDictionary]{
                
            
            for i in 0..<data.count{
                
                
                     do {
                         let data2 = try JSONSerialization.data(withJSONObject: data[i], options: .prettyPrinted)
                         let reqStr = String(data: data2, encoding: .utf8)
                         let strToData = reqStr?.data(using: .utf8)
                         let userData = try JSONDecoder().decode(Dish.self, from: strToData!)
                         print(userData)
                         
                         let title = userData.name
                         let id = userData.id
                         let image = userData.image
                         let calories = userData.calories
                         let descriptions = userData.description
                         
                         let addData = Dish(title1: title!, image1: image!, id1: id!, cal: calories!, desc: descriptions ?? "good" )
                         self.listDish.append(addData)
                         
                         self.tableView.reloadData()
                       
                     }
                     catch
                         
                     {
                         print(error)
                     }
            }
                
                
            }
        }
     
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

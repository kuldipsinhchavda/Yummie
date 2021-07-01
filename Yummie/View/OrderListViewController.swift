//
//  OrderListViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 25/06/21.
//

import UIKit

class OrderListViewController: UIViewController {
    
    var orders = [order]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ListDishTableViewCell", bundle: .main), forCellReuseIdentifier: "ListDishTableViewCell")
        
        commenWs.getURL(url: "orders") { (responce, status) in
            
            if let data = ["data"] as? [NSDictionary] {
               
                for i in 0..<data.count {
                    
                    do {
                        let data2 = try JSONSerialization.data(withJSONObject: data[i], options: .prettyPrinted)
                        let reqStr = String(data: data2, encoding: .utf8)
                        let strToData = reqStr?.data(using: .utf8)
                        let userData = try JSONDecoder().decode(orderDatum, from: strToData!)
                        print(userData)
                        
                        let id = userData.id
                        let name = userData.name
                        let dishName = userData.orderDish.name
                        
                        let addData = order(id1:id  , name:name  , dish: dishName)
                        self.orders.append(addData)
                        
                        self.tableView.reloadData()
                      
                    }
                    catch
                        
                    {
                     
                    }
                    
                }
                
            }
            
        }
        
    }
}
extension OrderListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aVc = tableView.dequeueReusableCell(withIdentifier: "ListDishTableViewCell", for: indexPath) as! ListDishTableViewCell
        aVc.orderSetup(order: orders[indexPath.row])
        return aVc
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aVc = storyboard?.instantiateViewController(identifier: "DishDetailsViewController") as! DishDetailsViewController
        aVc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(aVc, animated: true)
    }
}

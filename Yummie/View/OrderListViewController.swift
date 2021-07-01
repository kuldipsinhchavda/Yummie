//
//  OrderListViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 25/06/21.
//

import UIKit

class OrderListViewController: UIViewController {
    
    var order:[order] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

     
        tableView.register(UINib(nibName: "ListDishTableViewCell", bundle: .main), forCellReuseIdentifier: "ListDishTableViewCell")
        
    }
}
extension OrderListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aVc = tableView.dequeueReusableCell(withIdentifier: "ListDishTableViewCell", for: indexPath) as! ListDishTableViewCell
        aVc.orderSetup(order: order[indexPath.row])
        return aVc
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aVc = storyboard?.instantiateViewController(identifier: "DishDetailsViewController") as! DishDetailsViewController
        aVc.dish = order[indexPath.row].dish
        navigationController?.pushViewController(aVc, animated: true)
    }
}

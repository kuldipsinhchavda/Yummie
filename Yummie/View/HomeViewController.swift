//
//  HomeViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 22/06/21.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
    
    var cellClicked : ((Int) -> Void)?
    var categoryItem = [DishCategory]()
    
    var popular = [Dish]()
    
    var chefDish = [Dish]()
    
    @IBOutlet var populerDishCollectionView: UICollectionView!
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var chefDishCollectionVIew: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
//       let service = NetworkService()
//       let req = service.creataRequest(route: .temp, method: .post, parameters: ["name" : "kuldipsinh" , "lastName" : "chavda"])
//        print("\(req.url)")
//        print(req.httpBody)
     //
        
        
        ProgressHUD.show()
        commenWs.getURL(url: "dish-categories") { (responce, status) in
            
            if status{
                
            ProgressHUD.dismiss()
            
            if let data = responce["data"] as? [String:Any]{
                
                if let categoryData = data["categories"] as? [NSDictionary]{
                    
                    print(categoryData)
                    
                    for i in 0..<categoryData.count{
               
                    do {
                        let data2 = try JSONSerialization.data(withJSONObject: categoryData[i], options: .prettyPrinted)
                        let reqStr = String(data: data2, encoding: .utf8)
                        let strToData = reqStr?.data(using: .utf8)
                        let userData = try JSONDecoder().decode(DishCategory.self, from: strToData!)
                        print(userData)
                        
                        let title = userData.title
                        let id = userData.id
                        let image = userData.image
                        
                        let addData = DishCategory(title1: title, image1: image, id1: id)
                        self.categoryItem.append(addData)
                        
                        self.categoryCollectionView.reloadData()
                      
                    }
                    catch
                        
                    {
                        ProgressHUD.showError(error.localizedDescription)
                    }
         
                    }
                    
                }
                
                if let popularData = data["populars"] as? [NSDictionary] {
                    
                    
                    for i in 0..<popularData.count{
               
                    do {
                        let data2 = try JSONSerialization.data(withJSONObject: popularData[i], options: .prettyPrinted)
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
                        self.popular.append(addData)
                        
                        self.populerDishCollectionView.reloadData()
                      
                    }
                    catch
                        
                    {
                        ProgressHUD.showError(error.localizedDescription)
                    }
         
                    }
                    
                }
                if let popularData = data["specials"] as? [NSDictionary] {
                    
                    
                    for i in 0..<popularData.count{
               
                    do {
                        let data2 = try JSONSerialization.data(withJSONObject: popularData[i], options: .prettyPrinted)
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
                        self.chefDish.append(addData)
                        
                        self.chefDishCollectionVIew.reloadData()
                      
                    }
                    catch
                        
                    {
                        ProgressHUD.showError(error.localizedDescription)
                    }
         
                    }
                    
                }
            }
                
                
            }
            else{
                
            }
            
        }
        
        
        
        
        
        
        
        
        
//        NetworkService.shared.fetchAllCategories {[weak self] (restuls) in
//
//
//
//            switch restuls{
//            case .success(let allDishes):
//                print("\(allDishes)")
//                ProgressHUD.dismiss()
//                self?.category = allDishes.categoryDish ?? []
//                self?.populer = allDishes.populer ?? []
//                self?.chefDish = allDishes.chif ?? []
//
//                self?.categoryCollectionView.reloadData()
//                self?.populerDishCollectionView.reloadData()
//                self?.chefDishCollectionVIew.reloadData()
//            case .failure(let error):
//                print(error.localizedDescription)
//                ProgressHUD.showError(error.localizedDescription)
//            }
//        }
        
       

    }
//    public func second(index: Int) {
//        let aVc = self.storyboard?.instantiateViewController(identifier: "DishDetailsViewController") as! DishDetailsViewController
////      let uItem = self.models[indexPath.section].item
//    aVc.image = self.populer[index].image
//        aVc.desc = self.populer[index].desctiption
//        aVc.titleLbl1 = self.populer[index].name
//        aVc.calories1 = self.populer[index].formettedCalories
//
//    self.navigationController?.pushViewController(aVc, animated: true)
//}
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: "CategotyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategotyCollectionViewCell")
        populerDishCollectionView.register(UINib(nibName: "PopulerDishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopulerDishCollectionViewCell")
        chefDishCollectionVIew.register(UINib(nibName: "ChefSpecialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChefSpecialCollectionViewCell")
        
    }
    
  
}
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case  categoryCollectionView:
            return categoryItem.count
        case populerDishCollectionView:
            return popular.count
        case chefDishCollectionVIew:
            return chefDish.count
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case  categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategotyCollectionViewCell", for: indexPath) as! CategotyCollectionViewCell
            
            
            cell.setup(category: categoryItem[indexPath.row])
            return cell
        case populerDishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopulerDishCollectionViewCell", for: indexPath) as! PopulerDishCollectionViewCell
          
            cell.setup(populerDish: popular[indexPath.row])
            return cell
            
        case chefDishCollectionVIew:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChefSpecialCollectionViewCell", for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setup(chefDish: chefDish[indexPath.row])
                return cell
                
            
        default:
            return UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if collectionView == categoryCollectionView {
            
            let aVc = storyboard?.instantiateViewController(identifier: "ListDishViewController") as! ListDishViewController
            aVc.category = categoryItem[indexPath.row]
            navigationController?.pushViewController(aVc, animated: true)
        }
        else {

            let controller = storyboard?.instantiateViewController(identifier: "DishDetailsViewController") as! DishDetailsViewController
            controller.dish = collectionView == populerDishCollectionView ? popular[indexPath.row] : chefDish[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}


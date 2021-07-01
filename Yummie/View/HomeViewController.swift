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
    var category : [DishCategory] = []
    
    var populer : [Dish] = []
    
    var chefDish : [Dish] = []
    
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
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories {[weak self] (restuls) in
            switch restuls{
            case .success(let allDishes):
                print("success")
                ProgressHUD.dismiss()
                self?.category = allDishes.categoryDish ?? []
                self?.populer = allDishes.populer ?? []
                self?.chefDish = allDishes.chif ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.populerDishCollectionView.reloadData()
                self?.chefDishCollectionVIew.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
       

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
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        populerDishCollectionView.register(UINib(nibName: "populerDishCollectionView", bundle: nil), forCellWithReuseIdentifier: "populerDishCollectionView")
        chefDishCollectionVIew.register(UINib(nibName: "chefDishCollectionVIew", bundle: nil), forCellWithReuseIdentifier: "chefDishCollectionVIew")
        
    }
    
}
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case  categoryCollectionView:
            return category.count
        case populerDishCollectionView:
            return populer.count
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
            
            
            cell.setup(category: category[indexPath.row])
            return cell
        case populerDishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopulerDishCollectionViewCell", for: indexPath) as! PopulerDishCollectionViewCell
          
            cell.setup(populerDish: populer[indexPath.row])
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
            navigationController?.pushViewController(aVc, animated: true)
        }
        else {

            let controller = storyboard?.instantiateViewController(identifier: "DishDetailsViewController") as! DishDetailsViewController
            controller.dish = collectionView == populerDishCollectionView ? populer[indexPath.row] : chefDish[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}


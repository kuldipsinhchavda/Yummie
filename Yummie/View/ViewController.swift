//
//  ViewController.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 21/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextBtn: UIButton!
    var slide : [onBoadingSlide] = []
    
    var currentPage = 0 {
        
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slide.count - 1 {
                
                nextBtn.setTitle("Get Started", for: .normal)
            }
            else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        slide = [onBoadingSlide(title: "Quick Delivery At Your Doorsteps", description: "Your meal is ready" , slideImage: UIImage(named: "food")!),onBoadingSlide(title: "Quick Delivery At Your Doorsteps", description: "Your meal is ready" , slideImage: UIImage(named: "food2")!),onBoadingSlide(title: "hello", description: "Your meal is ready" , slideImage: UIImage(named: "food3")!)]
        
        pageControl.numberOfPages = slide.count
        
        
    }
    @IBAction func slideBtn(_ sender: UIButton) {
        
        if currentPage == slide.count - 1 {
            
            let aVc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            navigationController?.pushViewController(aVc, animated: true)
        }
        else{
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBordingCollectionViewCell", for: indexPath) as! OnBordingCollectionViewCell
        
        cell.setup(slide[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
      
    }
}

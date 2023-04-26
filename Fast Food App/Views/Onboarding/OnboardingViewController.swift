//
//  OnboardingViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import UIKit
import Lottie
import RealmSwift

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let realm = try? Realm()
    
    let slides: [OnboardingSlide] = [OnboardingSlide(title: "Fast food at your fingertips", description: "Order your favorite meals from top fast food restaurants.", animation: "fast-food"), OnboardingSlide(title: "Order in seconds, enjoy in minutes", description: "We're always working to get your food to you as quickly as possible.", animation: "delivery"), OnboardingSlide(title: "Your hunger, our priority", description: "Our app makes it easy to get the food you love, whenever you want it.", animation: "app")]
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count-1{
                nextButton.setTitle("Get Started", for: .normal)
            }
            else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.deleteAll()
//            }
//        } catch let error as NSError {
//            print("Error clearing Realm database: \(error.localizedDescription)")
//        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    @IBAction func nextButtonClicked(_ sender: UIButton){
        if currentPage == slides.count-1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier)
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
            let people = realm!.objects(User.self)
            print("Name\tEmail\t\t\tPassword")
            for person in people{
                print("\(person.name)\t\(person.email)\t\(person.password)")
            }
        }
        else{
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
       
       
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        
    }
}

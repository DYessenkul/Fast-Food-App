//
//  OnboardingCollectionViewCell.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import UIKit
import Lottie

class OnboardingCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var lottieAnimationView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var slogan: UILabel!
    
    
    let animationView = LottieAnimationView()
    
    func setup(_ slide: OnboardingSlide){
        title.text = slide.title
        slogan.text = slide.description
        animationView.animation = LottieAnimation.named(slide.animation)
        animationView.backgroundColor = .white
        animationView.frame = lottieAnimationView.bounds
        animationView.center = lottieAnimationView.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        lottieAnimationView.addSubview(animationView)
    }
}

//
//  ViewController.swift
//  Transition
//
//  Created by Daniil G on 27.01.2021.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBAction func animationButton(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 6, delay: 0, options: [.calculationModeLinear]) {
        
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.superView.frame.size = CGSize(width: 300, height: 300)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                self.superView.frame.size = CGSize(width: 250, height: 250)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                self.superView.frame.size = CGSize(width: 300, height: 300)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                self.superView.frame.size = CGSize(width: 250, height: 250)
            }
            
        } completion: { fineshed in
            print(fineshed)
        }
    }
    
    private var superView: UIView!
    private var subView: UIView!
    private var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView()
        
        view.addSubview(superView)
        superView.addSubview(subView)
    }
    
    private func settingView() {
        superView = UIView()
        superView.backgroundColor = .blue
        superView.layer.position = CGPoint(x: 90, y: 100)
        superView.frame.size = CGSize(width: 250, height: 250)
        
        subView = UIView()
        subView.layer.position = CGPoint(x: superView.frame.width / 5, y: superView.frame.height / 5)
        subView.frame.size = CGSize(width: superView.frame.width / 1.67, height: superView.frame.height / 1.67)
        
        let background = UIImage(named: "camera")

        imageView = UIImageView(frame: subView.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        subView.addSubview(imageView)
        
    }
}


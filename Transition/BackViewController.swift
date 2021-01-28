//
//  BackViewController.swift
//  Transition
//
//  Created by Daniil G on 27.01.2021.
//

import UIKit

class BackViewController: UIViewController {
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    private var shutterTop: UIView!
    private var shutterButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shutterTop = UIView()
        shutterButton = UIView()
        
        shutterTop.backgroundColor = .green
        shutterTop.frame.size = CGSize(width: view.frame.width,
                                       height: view.frame.height / 2)
        
        shutterButton.backgroundColor = .green
        shutterButton.center = CGPoint(x: 0, y: view.frame.height / 2)
        shutterButton.frame.size = CGSize(width: view.frame.width,
                                          height: view.frame.height / 2)
        
//        view.addSubview(shutterTop)
//        view.addSubview(shutterButton)
        
//        animationShutter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
//        animationShutter()
    }

    private func animationShutter() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut]) { [self] in
            shutterTop.transform = CGAffineTransform(translationX: 0, y: -shutterTop.frame.height)
            shutterButton.transform = CGAffineTransform(translationX: 0, y: shutterButton.frame.height)
        } completion: { (yes) in
            print(yes)
        }

    }

}

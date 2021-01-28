//
//  CameraSegue.swift
//  Transition
//
//  Created by Daniil G on 28.01.2021.
//

import UIKit

class CameraSegue: UIStoryboardSegue {
    
    private var toViewController: UIViewController!
    private var fromViewController: UIViewController!
    
    private var shutterTop: UIView!
    private var shutterButton: UIView!
    
    override func perform() {
        cameraSegue()
    }
    
    private func cameraSegue() {
        toViewController = self.destination
        fromViewController = self.source
    
        shutterTop = settingShutters(view: fromViewController).shutterTop
        shutterButton = settingShutters(view: fromViewController).shutterButton
        
        fromViewController.view.addSubview(shutterTop)
        fromViewController.view.addSubview(shutterButton)
        
        animationShutter()
    }
    
    private func settingShutters(view: UIViewController) -> (shutterTop: UIView, shutterButton: UIView) {
        shutterTop = UIView()
        shutterButton = UIView()
        
        if view == fromViewController {
            shutterTop.backgroundColor = .green
            shutterTop.frame.size = CGSize(width: fromViewController.view.frame.width,
                                           height: -fromViewController.view.frame.height / 2)
            
            shutterButton.backgroundColor = .green
            shutterButton.center = CGPoint(x: 0, y: fromViewController.view.frame.height)
            shutterButton.frame.size = CGSize(width: fromViewController.view.frame.width,
                                              height: fromViewController.view.frame.height / 2)
        } else {
            shutterTop.backgroundColor = .green
            shutterTop.frame.size = CGSize(width: fromViewController.view.frame.width,
                                           height: fromViewController.view.frame.height / 2)
            
            shutterButton.backgroundColor = .green
            shutterButton.center = CGPoint(x: 0, y: fromViewController.view.frame.height / 2)
            shutterButton.frame.size = CGSize(width: fromViewController.view.frame.width,
                                              height: fromViewController.view.frame.height / 2)
        }
        
        return (shutterTop: shutterTop, shutterButton: shutterButton)
    }
    
    private func animationShutter() {
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut]) { [self] in
            shutterTop.transform = CGAffineTransform(translationX: 0, y: shutterTop.frame.height)
            shutterButton.transform = CGAffineTransform(translationX: 0, y: -shutterButton.frame.height)
        } completion: { success in
            self.shutterTop.transform = CGAffineTransform(translationX: 0, y: -self.shutterTop.frame.height)
            self.shutterButton.transform = CGAffineTransform(translationX: 0, y: self.shutterButton.frame.height)
            
            let shutterTop = self.settingShutters(view: self.toViewController).shutterTop
            let shutterButton = self.settingShutters(view: self.toViewController).shutterButton
            
            self.toViewController.view.addSubview(shutterTop)
            self.toViewController.view.addSubview(shutterButton)
            
            self.fromViewController.present(self.toViewController, animated: false, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 5, options: [.curveEaseOut]) { [self] in
                shutterTop.transform = CGAffineTransform(translationX: 0, y: -shutterTop.frame.height)
                shutterButton.transform = CGAffineTransform(translationX: 0, y: shutterButton.frame.height)
            }
        }
    }
}

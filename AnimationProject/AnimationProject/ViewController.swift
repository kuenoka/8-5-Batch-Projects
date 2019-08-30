//
//  ViewController.swift
//  AnimationProject
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

//
//  ViewController.swift
//  PracticeProject
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstRect = CAShapeLayer()
    let secondRect = CAShapeLayer()
    let thirdRect = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .purple
        
        let benzier = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: 100, height: 20), cornerRadius: 5)
        firstRect.path = benzier.cgPath
        firstRect.fillColor = UIColor.white.cgColor
        firstRect.position = CGPoint(x: 200.0, y: 400.0)
        firstRect.bounds = CGRect(x: 0.0, y: 0.0, width: 100, height: 20)
        
        self.view.layer.addSublayer(firstRect)
        
        secondRect.path = benzier.cgPath
        secondRect.fillColor = UIColor.white.cgColor
        secondRect.position = CGPoint(x: 200.0, y: 430.0)
        secondRect.bounds = CGRect(x: 0.0, y: 0.0, width: 100, height: 20)
        
        self.view.layer.addSublayer(secondRect)
        
        thirdRect.path = benzier.cgPath
        thirdRect.fillColor = UIColor.white.cgColor
        thirdRect.position = CGPoint(x: 200.0, y: 460.0)
        thirdRect.bounds = CGRect(x: 0.0, y: 0.0, width: 100, height: 20)
        
        self.view.layer.addSublayer(thirdRect)
        
        rotateFirstRect()
        rotateSecondRect()
        rotateThirdRect()
    }
    
    func rotateFirstRect() {
        let basicAnimation = CABasicAnimation(keyPath: "transform")
        
        basicAnimation.toValue = CATransform3DRotate(firstRect.transform, CGFloat(135 * Float.pi / 180), 0, 0, 1)
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        firstRect.add(basicAnimation, forKey: "animationtest")
    }
    
    func rotateSecondRect() {
        let basicAnimation = CABasicAnimation(keyPath: "transform")
        
        basicAnimation.toValue = CATransform3DRotate(secondRect.transform, CGFloat(180 * Float.pi / 180), 0, 0, 1)
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        secondRect.add(basicAnimation, forKey: "animationtest")
    }
    
    func rotateThirdRect() {
        let basicAnimation = CABasicAnimation(keyPath: "transform")
        
        basicAnimation.toValue = CATransform3DRotate(thirdRect.transform, CGFloat(135 * Float.pi / 180), 0, 0, -1)
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        thirdRect.add(basicAnimation, forKey: "animationtest")
    }
}



//
//  ViewController.swift
//  GestureRecognizerProject
//
//  Created by MCS on 9/3/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var theMovingLabel: UILabel!
  private var initialPoint: CGPoint!
  private var numberOfTaps = 0
  private var defaultText = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //addPanGesture()
    //addRotationGesture()
    addTappedGesture()
    //addPinchGesture()
  }
  
  func addPinchGesture() {
    let pinchGestureRecognizer = UIPinchGestureRecognizer()
    pinchGestureRecognizer.addTarget(self, action: #selector(pinchThelabel(sender:)))
    theMovingLabel.addGestureRecognizer(pinchGestureRecognizer)
  }
  
  func addTappedGesture() {
    let tappedGestureRecognizer = UITapGestureRecognizer()
    tappedGestureRecognizer.addTarget(self, action: #selector(changeTheLabel(sender:)))
    theMovingLabel.addGestureRecognizer(tappedGestureRecognizer)
    defaultText = theMovingLabel.text!
  }
  
  func addRotationGesture() {
    let rotationGestureRecognizer = UIRotationGestureRecognizer()
    rotationGestureRecognizer.addTarget(self, action: #selector(rotateTheLabel(sender:)))
    theMovingLabel.addGestureRecognizer(rotationGestureRecognizer)
  }
  func addPanGesture() {
    let movingGestureRecognizer = UIPanGestureRecognizer()
    movingGestureRecognizer.addTarget(self, action: #selector(moveTheLabel(sender:)))
    theMovingLabel.addGestureRecognizer(movingGestureRecognizer)
    theMovingLabel.isUserInteractionEnabled = true
    initialPoint = theMovingLabel.frame.origin
  }
  
  @objc func moveTheLabel(sender: UIPanGestureRecognizer) {
    print("the label was dragged to point \(sender.translation(in: theMovingLabel))")
    let translatedPoint = sender.translation(in: view)
    sender.view?.frame.origin.x = initialPoint.x + translatedPoint.x
    sender.view?.frame.origin.y = initialPoint.y + translatedPoint.y
  }
  
  @objc func rotateTheLabel(sender: UIRotationGestureRecognizer) {
    print("the label was rotated \(sender.rotation) radians")
    let rotatedTransform = CGAffineTransform(rotationAngle: sender.rotation)
    theMovingLabel.transform = rotatedTransform
  }
  
  @objc func changeTheLabel(sender: UITapGestureRecognizer) {
    print("the label was changed")
    numberOfTaps += 1
    
    if (numberOfTaps % 2 == 0) {
      theMovingLabel.text = "It was double tapped"
    }
    if (numberOfTaps % 4 == 0) {
      theMovingLabel.text = defaultText
    }
  }
  
  @objc func pinchThelabel(sender: UIPinchGestureRecognizer) {
    print("the label was pinched")
    guard sender.view != nil else { return }
    
    if sender.state == .began || sender.state == .changed {
      sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
      sender.scale = 1.0
    }
  }
  
}

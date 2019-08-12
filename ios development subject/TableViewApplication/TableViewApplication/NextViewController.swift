//
//  NextViewController.swift
//  TableViewApplication
//
//  Created by MCS on 8/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate{
    func updateSwitch(with value: Bool)
    func updateSlider(with value: Float)
    func updateString(with value: String)
    func updateStepper(with value: Double)
    func updateSegmentControl(with value: Int)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var mySwitch: UISwitch!
    var editSwitchText : String?
    var enableSwitch = true
    @IBAction func mySwitch(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var mySlider: UISlider!
    var editSliderText : String?
    var enableSlider = true
    @IBAction func mySlider(_ sender: Any) {
        mySlider.maximumValue = 100
        mySlider.minimumValue = 0
    }
    
    @IBOutlet weak var theTextField: UITextField!
   
    var editString: String?
    var enableTextField = true
    var delegate: NextViewControllerDelegate?
    
    @IBOutlet weak var myStepper: UIStepper!
    var editStepperText: String?
    var enableStepper = true
    @IBAction func myStepper(_ sender: Any) {
        myStepper.maximumValue = 10
        myStepper.minimumValue = 0
    }
    
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    var editSegmentControl: String?
    var enableSegmentControl = true
    @IBAction func mySegmentControl(_ sender: Any) {
    }
    
    @IBAction func Submit(_ sender: Any) {
        
        if enableSwitch == false{
            delegate?.updateSwitch(with: mySwitch.isOn)
        }
        else if enableSlider == false{
            delegate?.updateSlider(with: mySlider.value)
        }
        else if enableTextField == false{
            delegate?.updateString(with: theTextField.text ?? "")
        }
        else if enableStepper == false{
            delegate?.updateStepper(with: myStepper.value)
        }
        else if enableSegmentControl == false{
            delegate?.updateSegmentControl(with: mySegmentControl.selectedSegmentIndex)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch.isHidden = enableSwitch
        mySlider.isHidden = enableSlider
        theTextField.isHidden = enableTextField
        myStepper.isHidden = enableStepper
        mySegmentControl.isHidden = enableSegmentControl
        
        editSwitchText = "\(mySwitch.isOn)"
        editSliderText = "\(mySlider.value)"
        theTextField.text = editString
        editStepperText = "\(myStepper.value)"
        
        switch mySegmentControl.selectedSegmentIndex
        {
        case 0:
            editSegmentControl = "First Segment Selected"
        case 1:
            editSegmentControl = "Second Segment Selected"
        default:
            break
        }
        
    }
    
}

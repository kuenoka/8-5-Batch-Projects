//
//  ViewController.swift
//  TableViewApplication
//
//  Created by MCS on 8/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, NextViewControllerDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var array = ["Switch: ", "Slider: ", "TextField: ", "Stepper: ", "SegmentControl: "]
    var arrayOuput = ["None", "None", "None", "None", "None"]
    
    let originalSwitch = "Switch: "
    let originalSlider = "Slider: "
    let originalText = "TextField: "
    let originalStepper = "Stepper: "
    let originalSegmentControl = "SegmentConttol: "

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //Data Source Starts
    func tableView( _ tableView:UITableView, numberOfRowsInSection section : Int)-> Int{
        
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    // Data Source Ends here
    
    func updateSwitch(with value: Bool){
        
        array[0] = originalSwitch + "\(value)"
        tableView.reloadData()
    }
    
    func updateSlider(with value: Float){
        
        array[1] = originalSlider + "\(value)"
        tableView.reloadData()
    }
    
    func updateString(with value: String){

        array[2] = originalText + value
        tableView.reloadData()
    }
    
    func updateStepper(with value: Double){
        
        array[3] = originalStepper + "\(value)"
        tableView.reloadData()
    }
    
    func updateSegmentControl(with value: Int){
        
        if value == 0{
            array[4] = originalSegmentControl + "First Segment Selected"
        }
        else{
            array[4] = originalSegmentControl + "Second Segment Selected"
        }
        
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        if indexPath.row == 0{
            nextViewController.enableSwitch = false
        }
        else if indexPath.row == 1{
           nextViewController.enableSlider = false
        }
        else if indexPath.row == 2{
            nextViewController.enableTextField = false
        }
        else if indexPath.row == 3{
            nextViewController.enableStepper = false
        }
        else{
            nextViewController.enableSegmentControl = false
        }
        
        
        nextViewController.editSwitchText = ""
        nextViewController.editSliderText = ""
        nextViewController.editString = ""
        nextViewController.editStepperText = ""
        nextViewController.editSegmentControl = ""

        nextViewController.delegate = self
        
        //to go back
        navigationController?
            .pushViewController(nextViewController, animated: true)
    }
    
}


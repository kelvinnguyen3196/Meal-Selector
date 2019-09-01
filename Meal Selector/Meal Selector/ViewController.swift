//
//  ViewController.swift
//  Meal Selector
//
//  Created by Kelvin Nguyen on 7/24/19.
//  Copyright © 2019 Kelvin Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Declarations
    @IBOutlet weak var inputTxt: UITextField!
    @IBOutlet weak var randomBtn: UIButton!
    @IBOutlet weak var outputTxt: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTxt.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: Logic
    var array = [String]()
    

    //MARK: Button Actions
    @IBAction func addToArray(_ sender: Any) {
        let text = inputTxt.text
        
        if text?.isEmpty ?? true {
            outputTxt.text = "You can't enter nothing! Type a meal and press add!"
        }
        else {
            array.append(inputTxt.text!)
            let joined = array.joined(separator: ", ")
            
            outputTxt.text = "Meal items so far: " + joined
            inputTxt.text = ""
        }
    }
    @IBAction func randomizeArray(_ sender: Any) {
        if array.isEmpty {
            outputTxt.text = "You don't have anything on the list!"
        }
        else {
            let size = array.count
            
            let randomInt = Int.random(in: 0..<size)
            
            outputTxt.text = "The meal I have selected is:\n\n" + array[randomInt] + "\n\nThank you for using Meal Selector!\nPlease enjoy your meal!"
        }
    }
    @IBAction func removeLastItem(_ sender: Any) {
        let size = array.count - 1
        
        if array.isEmpty {
            outputTxt.text = "Don't worry the list is already empty. You can add new items now!"
        }
        else {
            array.remove(at: size)
            let joined = array.joined(separator: ", ")
            
            outputTxt.text = "Meal items so far: " + joined
        }
    }
    @IBAction func clearArray(_ sender: Any) {
        if array.isEmpty {
            outputTxt.text = "Don't worry the list is already empty. You can add new items now!"
        }
        else{
            array.removeAll()
            
            outputTxt.text = "Meal items so far: "
        }
    }
    
    //MARK: UI Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // Close keyboard when pressing return
        inputTxt.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // Close keyboard when touching outside of keyboard
        self.view.endEditing(true)
    }
    
}

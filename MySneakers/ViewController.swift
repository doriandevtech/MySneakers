//
//  ViewController.swift
//  MySneakers
//
//  Created by Dorian Emenir on 04/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var shoeType: UISegmentedControl!
    
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var sizeStepper: UIStepper!
    
    @IBOutlet weak var colorPicker: UIPickerView!
    
    @IBOutlet weak var shoeSelection: UIImageView!
    
    @IBOutlet weak var orderResult: UILabel!
    
    var name: String = ""
    
    var typeNumber: Int = 0
    var type: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Add closing keyboard gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        nameTF.delegate = self
    }
    
//    CLose Simulator keyboard when pressed "return" key
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @IBAction func nameTFPressed(_ sender: UITextField) {
        
    }
    
    @IBAction func shoeTypePressed(_ sender: UISegmentedControl) {
        typeNumber = sender.selectedSegmentIndex
        if typeNumber == 0 {
            type = "Ville"
        } else if typeNumber == 1 {
            type = "Running"
        } else {
            type = "Baskets"
        }
    }
    
    
    @IBAction func genderPressed(_ sender: UISwitch) {
    }
    
    
    @IBAction func sizeChanged(_ sender: UIStepper) {
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    
//    Verify if the name has been entered
    func textFieldDidChangeSelection(_ textField: UITextField) {
        name = textField.text ?? ""
        print(name)
    }
}

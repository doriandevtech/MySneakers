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
        
        showSizeValue()
        showGenderLabel()
        
        setUpPicker()
    }
    
//    Close Simulator keyboard when pressed "return" key
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func showGenderLabel() {
        genderLbl.text = genderSwitch.isOn ? "Homme" : "Femme"
    }
    
    func showSizeValue() {
        sizeLbl.text = String(Int(sizeStepper.value))
    }
    
    func getShoeParams(type: Int, gender: String, color: String) {
        
    }
    
//    @IBAction func nameTFPressed(_ sender: UITextField) {
//        print(sender.text ?? "")
//    }
    
    @IBAction func shoeTypePressed(_ sender: UISegmentedControl) {
        typeNumber = sender.selectedSegmentIndex
        if typeNumber == 0 {
            type = "City"
        } else if typeNumber == 1 {
            type = "Running"
        } else {
            type = "Baskets"
        }
    }
    
    
    @IBAction func genderPressed(_ sender: UISwitch) {
        showGenderLabel()
    }
    
    @IBAction func sizeChanged(_ sender: UIStepper) {
        showSizeValue()
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    
//    Verify if the name has been entered
    func textFieldDidChangeSelection(_ textField: UITextField) {
        name = textField.text ?? ""
        print(name)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
//    Declare picker possible outcome
    var pickerColors: [String] {
        return ["White", "Black"]
    }
    
//    Setup color picker
    func setUpPicker() {
        colorPicker.delegate = self
        colorPicker.dataSource = self
    }
    
//    Number of components in Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    Number of rows (distinct choices) inside the component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerColors.count
    }
    
//    Set the rows title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerColors[row]
    }
    
//    Access selected row's content
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerColors[row])
    }
    
    
}









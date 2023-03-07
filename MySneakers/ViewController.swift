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
    var type: String = "City"
    var color: String = "White"
    var gender: String = "Homme"
    var size: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Add closing keyboard gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        nameTF.delegate = self // Allows nameTF to have textFieldDelegate as an extension
        
//        Sets the first UI's display
        showSizeValue()
        showGenderLabel()
        updateShoeImage()
        orderResult.text = ""
        
//        Sets up the PickerView
        setUpPicker()
        
    }
    
//    Close Simulator keyboard when pressed "return" key
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
//    Updates in real time the gender displayed on screen
    func showGenderLabel() {
        genderLbl.text = genderSwitch.isOn ? "Boy" : "Girl"
        gender = genderLbl.text ?? ""
        updateShoeImage()
    }
    
//    Updates in real time the shoe size displayed on screen
    func showSizeValue() {
        sizeLbl.text = String(Int(sizeStepper.value))
        size = sizeLbl.text ?? ""
        updateShoeImage()
    }
    
//    Constructs the name of the image filename that the UIImage will point to
    func getShoeParams(type: String, gender: String, color: String) -> String {
        
        let typeParam: String = type.lowercased()
        let genderParam: String = gender.lowercased()
        let colorParam: String = color.lowercased()
        
        return "\(genderParam)_\(typeParam)_\(colorParam)"
    }
    
//    Updates the shoe image's shown
    func updateShoeImage() {
        shoeSelection.image = UIImage(named: getShoeParams(type: type, gender: genderLbl.text ?? "", color: color))
    }
    
//    Sets the value of the text displayed on the UI regarding the parameters
    func updateOrderResult() {
        if name == "" || name == "Mr." || name == "Miss" {
            if gender == "Boy" {
                name = "Mr."
            } else if gender == "Girl"{
                name = "Miss"
            }
        }
        orderResult.text = """
            Hello \(name) I found this pair of \(type.lowercased()) shoes in \(color.lowercased()) size \(sizeLbl.text?.lowercased() ?? "")
        """
    }
    
//    SegmentedControl pressed
    @IBAction func shoeTypePressed(_ sender: UISegmentedControl) {
        typeNumber = sender.selectedSegmentIndex // Assign the selected segment's index to typeNumber variable
        if typeNumber == 0 {
            type = "City"
        } else if typeNumber == 1 {
            type = "Running"
        } else {
            type = "Basket"
        }
        
        updateShoeImage() // Update the shoe image if type is pressed
        updateOrderResult() // Update order result's message when a type is pressed
    }
    
//    Switch pressed
    @IBAction func genderPressed(_ sender: UISwitch) {
        showGenderLabel()
        updateShoeImage() // Update the shoe image if gender is pressed
        updateOrderResult() // Update order result's message when gender is pressed
    }
    
//    Stepper pressed
    @IBAction func sizeChanged(_ sender: UIStepper) {
        showSizeValue()
        updateShoeImage() // Update the shoe image if size is pressed
        updateOrderResult() // Update order result's message when size is pressed
    }
    
}

extension ViewController: UITextFieldDelegate {
    
//    Hide keyboard when "return" is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
//    Verify if the name has been entered
    func textFieldDidChangeSelection(_ textField: UITextField) {
        name = textField.text ?? ""
        updateOrderResult()
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
        color = pickerColors[row]
        updateShoeImage() // Update the shoe image if item is selected
        updateOrderResult() // Update order result's message when item is selected
    }
    
    
}

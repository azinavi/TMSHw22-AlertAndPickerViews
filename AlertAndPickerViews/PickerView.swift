//
//  PickerView.swift
//  AlertAndPickerViews
//
//  Created by azinavi on 12/2/24.
//

import UIKit

class PickerView: UIViewController {
    
    let textField = UITextField()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var cityArray = ["Москва", "Нью-Йорк", "Лондон", "Париж", "Токио"]
    var selectedCountryIndex: Int?

    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        
    }
    
    private func setupTextField() {
        textField.placeholder = "Введите город"
        textField.textAlignment = .left
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.inputView = pickerView
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
        toolBar.setItems([done], animated: true)
        textField.inputAccessoryView = toolBar
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func doneButtonPressed() {
        textField.resignFirstResponder()
    }
    
    func showOnDisplay() {
        if let selectedCountryIndex = selectedCountryIndex {
            let city = cityArray[selectedCountryIndex]
            nameLabel.text = "\(city)"
        }
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}


extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountryIndex = row
        showOnDisplay()
    }
    
}

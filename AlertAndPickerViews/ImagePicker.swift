//
//  ImagePickerController.swift
//  AlertAndPickerViews
//
//  Created by azinavi on 12/2/24.
//

import UIKit

class ImagePicker: UIViewController {
    var downloadImageButton = UIButton()
    var imageView = UIImageView()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupSuperView()
        setupDownloadImageButton()
        setupImageView()
        
    }
    
    private func setupSuperView() {
        view.backgroundColor = .black
    }
    
    private func setupDownloadImageButton() {
        let button = UIButton(type: .system)
        button.setTitle("Загрузить изображение", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200), // Ширина текстового поля
            button.heightAnchor.constraint(equalToConstant: 40) // Высота текстового поля
        ])
    }
    @objc func buttonTapped( _sender: UIButton) {
        classicActionSheet()
    }
    
    private func classicActionSheet() {
        let alert = UIAlertController(title: "Add Photo from Gallery", message: "Do you want to add any photo?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open Gallery", style: .default, handler: { _ in
            self.pickPhotoButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("Cancel")
        }))
        self.present(alert, animated: true)
    }
    
    private func pickPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
}

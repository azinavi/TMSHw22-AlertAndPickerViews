//
//  AlertView.swift
//  AlertAndPickerViews
//
//  Created by azinavi on 12/2/24.
//

import UIKit

class AlertView: UIViewController {
    var button = UIButton()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSuperView()
        setupButton()
        
    }
    
    private func setupSuperView() {
        view.backgroundColor = .black
    }
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Показать сообщение", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func buttonTapped( _sender: UIButton) {
        classicAlert()
    }
    
    func classicAlert() {
        let alert = UIAlertController(title: "Важное сообщение", message: "Спасибо, что выбрали наше приложение!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { [self] _ in
            sayThanksOnDisplay(text: "Спасибо!!!")
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .destructive, handler: { [self] _ in
            nameLabel.text = .none
        }))
        
        self.present(alert, animated: true)
    }
    
    func sayThanksOnDisplay(text: String) {
        nameLabel.text = text
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

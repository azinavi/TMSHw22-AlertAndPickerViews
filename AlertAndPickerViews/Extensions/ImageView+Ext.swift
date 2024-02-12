//
//  ImageViewController+Ext.swift
//  AlertAndPickerViews
//
//  Created by azinavi on 12/2/24.
//

import UIKit

//MARK: Extensions
extension ImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            self.imageView.image = pickedImage
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

//
//  NewContactViewController.swift
//  ColectionView
//
//  Created by Teslenko Anastasiya on 18.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit
import os.log//This will import the unified registration system
//for button save
class NewContactViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var contact: Contact?
    @IBOutlet weak var nameContact: UITextField!
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var numberContact: UITextField!
    @IBOutlet weak var saveItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveItem else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameContact.text ?? ""
        let number = numberContact.text ?? ""
        let photo = contactPhoto.image
        
        contact = Contact(photo: photo!, number: number, name: name)
        print(66)
    }
    
    @IBAction func addPhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        
        nameContact.resignFirstResponder()
        numberContact.resignFirstResponder()

        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        contactPhoto.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        let name = nameContact.text ?? ""
        let number = numberContact.text ?? ""
        let photo = contactPhoto.image
        
        contact = Contact(photo: photo!, number: number, name: name)
    }
    
}

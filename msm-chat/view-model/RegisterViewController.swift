//
//  RegisterViewController.swift
//  msm-chat
//
//  Created by Fernando on 16/04/22.
//

import UIKit
import ImagePicker

class RegisterViewController: UIViewController, ImagePickerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var userStatus: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorFieldMessage: UILabel!
    
    let imagePickerController = ImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToLogin() {
        backToLoginScreen()
    }

    @IBAction func sendImageProfile() {
        self.imagePickerController.delegate = self
        self.imagePickerController.imageLimit = 1

        present(imagePickerController, animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        return
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        self.profileImage.image = images.first
        dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerUser() {
        defaultFieldStatus()
        
        if(validateInputFields(name: name.text ?? "", userStatus: userStatus.text ?? "", userName: userName.text ?? "", password: password.text ?? "")){
            //TODO - API Register logic
            print("Cadastrou")
            backToLoginScreen()
            
        } else {
            print("Erro")
            errorFieldMessage.isHidden = false
            errorInputFieldLayer(field: name)
            errorInputFieldLayer(field: userStatus)
            errorInputFieldLayer(field: userName)
            errorInputFieldLayer(field: password)
        }
        
    }
    
    private func backToLoginScreen() {
        dismiss(animated: true, completion: nil)
    }
    
    private func defaultFieldStatus(){
        errorFieldMessage.isHidden = true
        defaultInputFieldLayer(field: name)
        defaultInputFieldLayer(field: userStatus)
        defaultInputFieldLayer(field: userName)
        defaultInputFieldLayer(field: password)
    }
    
    private func validateInputFields(name: String, userStatus: String, userName: String, password: String) -> Bool {
        let isNameEmpty = isEmptyField(field: name)
        let isUserStatus = isEmptyField(field: userStatus)
        let isUsernameEmpty = isEmptyField(field: userName)
        let isPasswordEmpty = isEmptyField(field: password)
        return isNameEmpty == false && isUserStatus == false && isUsernameEmpty == false && isPasswordEmpty == false
    }
    
    private func isEmptyField(field : String) -> Bool {
        return field == ""
    }
    
    private func defaultInputFieldLayer(field : UITextField) {
        field.layer.borderWidth = 0
    }
    
    private func errorInputFieldLayer(field : UITextField) {
        if(field.text == ""){
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    
}

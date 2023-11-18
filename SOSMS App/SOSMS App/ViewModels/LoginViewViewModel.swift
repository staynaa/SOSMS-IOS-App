//
//  LoginViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = "" //stores the email
    @Published var password = "" //stores the password the user typed
    @Published var errorMsg = "" //to alert user
    
    init(){}
    // function is called when user clicks login button
    func login() {
        errorMsg = ""
        //check that the inputs aren't empty and dont contain spaces
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMsg = "Fill In All Fields Correctly Please."
            return
        }
        //check that a valid email was entered
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Enter A Valid Email."
            return
        }
        print("Called")
    }
    func validate(){
        
    }
}

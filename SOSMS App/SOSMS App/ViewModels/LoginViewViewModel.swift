//
//  LoginViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = "" //stores the email
    @Published var password = "" //stores the password the user typed
    @Published var wrongEmail=0
    @Published var wrongPW=0
    @Published var errorMsg = "" //to alert user
    
    init(){}
    // function is called when user clicks login button
    func login() {
        errorMsg = ""
        wrongEmail=0
        wrongPW=0
        //check that the inputs aren't empty and dont contain spaces
        guard validate() else{
            return
        }
        print("Called")
        Auth.auth().signIn(withEmail: email, password: password)
    }
    func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            wrongPW = 3
            wrongEmail = 3
            errorMsg = "Fill In All Fields Correctly Please."
            return false
        }
        //check that a valid email was entered
        guard email.contains("@") && email.contains(".") else {
            wrongEmail = 3
            errorMsg = "Enter A Valid Email."
            return false
        }
        return true
    }
}

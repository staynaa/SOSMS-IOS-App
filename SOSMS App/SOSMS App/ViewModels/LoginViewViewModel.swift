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
//    func login() {
//        errorMsg = ""
//        wrongEmail=0
//        wrongPW=0
//        //check that the inputs aren't empty and dont contain spaces
//        guard validate() else{
//            return
//        }
//        print("Called")
//        Auth.auth().signIn(withEmail: email, password: password)
//    }
    func login() {
        errorMsg = ""
        wrongEmail = 0
        wrongPW = 0

        // Check that the inputs aren't empty and don't contain spaces
        guard validate() else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }

            if let error = error as NSError? {
                // Handle sign-in errors here
                let errorCode = error.code

                switch errorCode {
                case AuthErrorCode.wrongPassword.rawValue:
                    strongSelf.wrongPW = 3
                    strongSelf.errorMsg = "Incorrect password. Please try again."
                case AuthErrorCode.userNotFound.rawValue, AuthErrorCode.invalidEmail.rawValue:
                    strongSelf.wrongEmail = 3
                    strongSelf.errorMsg = "User not found or invalid email."
                default:
                    strongSelf.errorMsg = "Login failed due to technical issues. Please try again later."
                }
            } else {
                // Sign-in successful, you can access the user data from `result.user`
                print("Sign-in successful")
            }
        }
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

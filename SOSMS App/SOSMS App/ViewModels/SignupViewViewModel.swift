//
//  SignupViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import Foundation

class SignupViewViewModel: ObservableObject{
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var nameErr=0
    @Published var emailErr=0
    @Published var pwErr=0
    @Published var notConfirmed=0
    @Published var errorMsg = ""
    @Published var errorMsgPW = ""
    
    init(){}
    
    func signup(){
        errorMsg = ""
        errorMsgPW = ""
        nameErr = 0
        emailErr = 0
        pwErr = 0
        notConfirmed = 0
        //check that fields aren't empty and specified fields don't have spaces
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty,
            !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty,
            !fullname.isEmpty
        else{
            errorMsg = "Fill In All Fields Correctly Please."
            print("fields not filled")
            nameErr = 3
            emailErr = 3
            pwErr = 3
            notConfirmed = 3
            return
        }
        // check that the email entered was entered in a valid format
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Enter A Valid Email."
            print("email incorrect")
            emailErr = 0
            return
        }
        //check if password is the specified length
        guard password.count>=8 else{
            errorMsgPW = "Password Too Short"
            print("password short")
            pwErr = 3
            return
        }
        //check that the passwords are the same
        guard confirmPassword==password else{
            errorMsg = "Confirm Password."
            print("password don't equal")
            pwErr = 3
            notConfirmed = 3
            return
        }
    }
}

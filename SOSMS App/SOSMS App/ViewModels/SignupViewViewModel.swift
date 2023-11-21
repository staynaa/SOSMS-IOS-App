//
//  SignupViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseAuth // authentication
import FirebaseFirestore
import Foundation

class SignupViewViewModel: ObservableObject{
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var nameErr=0
    @Published var emailErr=0
    @Published var pwErr=0
    @Published var errorMsg = ""
    @Published var errorMsgPW = ""
    
    init(){}
    
    func signup(){
        errorMsg = ""
        errorMsgPW = ""
        nameErr = 0
        emailErr = 0
        pwErr = 0
        //check that fields aren't empty and specified fields don't have spaces
        guard validate() else{
            
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else{
                return
            }
            self?.createNewUser(id: userID)
        }
    }
    private func createNewUser(id: String){
        let newUser = User(id: id, userName: fullname, email: email, joined: Date().timeIntervalSinceReferenceDate)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    // check input for sign up/ registration
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty,
            !fullname.isEmpty
        else{
            errorMsg = "Fill In All Fields Correctly Please."
            print("fields not filled")
            nameErr = 3
            emailErr = 3
            pwErr = 3
            return false
        }
        // check that the email entered was entered in a valid format
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Enter A Valid Email."
            print("email incorrect")
            emailErr = 0
            return false
        }
        //check if password is the specified length
        guard password.count>=8 else{
            errorMsgPW = "Password Too Short"
            print("password short")
            pwErr = 3
            return false
        }
        return true
    }
}

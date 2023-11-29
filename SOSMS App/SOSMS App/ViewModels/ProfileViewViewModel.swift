//
//  ProfileViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ProfileViewViewModel: ObservableObject{
    @Published var user: User? = nil
    // @Published var email: String = ""
    init(){}
    func getUser(){
        guard let userID = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    userName: data["userName"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}

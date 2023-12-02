//
//  NewContactViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewContactViewViewModel: ObservableObject{
    @Published var contName: String = "" // name
    @Published var contNumber: String = "" // phone number
    @Published var relation: String = "" // relationship to user
    @Published var active: Bool = true //active is by default true when created
    @Published var errorMsg: Bool = false //to alert user
    
    func addCont(){ //add new contact
        guard canAdd else{
            return
        }
        //here we will get the user id
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let contID = UUID().uuidString
        let newContact = EmergencyContact( //model
            id: contID,
            contName: contName,
            contNumber: contNumber,
            relation: relation,
            active: active)
        let db = Firestore.firestore()
        //create another table to add the emergency contact for the current user
        db.collection("users").document(userID).collection("emergency_contacts").document(contID)
            .setData(newContact.asDictionary())
    }
    var canAdd: Bool {
        guard !contName.trimmingCharacters(in: .whitespaces).isEmpty, !relation.trimmingCharacters(in: .whitespaces).isEmpty, !contNumber.trimmingCharacters(in: .whitespaces).isEmpty, checkNumeric(S:contNumber) else{
            return false
        }
        return true
    }
    func checkNumeric(S: String) -> Bool {
        return Double(S) != nil
    }
    
}

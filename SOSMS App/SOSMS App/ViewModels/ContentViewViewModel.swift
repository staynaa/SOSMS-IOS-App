//
//  ContentViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseAuth
import Foundation

class ContentViewViewModel: ObservableObject{
    @Published var currentUser: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUser = user?.uid ?? ""
            }
        }
    }
    
    public var isLogged: Bool{
        return Auth.auth().currentUser != nil
    }
}

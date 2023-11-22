//
//  NewContactViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import Foundation
class NewContactViewViewModel: ObservableObject{
    @Published var contName: String = "" // name
    @Published var contNumber: String = "" // phone number
    @Published var relation: String = "" // relationship to user
    @Published var active: Bool = true //active is by default true when created
    
    func addCont(){ //add new contact
        
    }
    
}

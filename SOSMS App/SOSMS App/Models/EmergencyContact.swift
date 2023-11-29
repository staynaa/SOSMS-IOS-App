//
//  EmergencyContact.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/28/23.
//

import Foundation
struct EmergencyContact: Codable, Identifiable{
    let id: String
    let contName: String
    let contNumber: String
    let relation: String
    var active: Bool
    
    mutating func setActive (_ state: Bool){
        active = state;
    }
}

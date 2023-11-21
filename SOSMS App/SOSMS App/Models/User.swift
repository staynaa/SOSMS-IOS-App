//
//  User.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import Foundation

struct User: Codable{
    let id: String
    let userName: String
    let email: String
    let joined: TimeInterval
}

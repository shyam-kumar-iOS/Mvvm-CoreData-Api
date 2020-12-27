//
//  UsersModel.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 10/5/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation

struct UsersModel : Codable {
    
    let avatar : String
    let email : String
    let first_name : String
    let last_name : String
    let id : Int16
    
    static let dB = DatabaseHelper()
    
    func store() {
        guard let user = UsersModel.dB.add(Users.self) else {return}
        user.avatar = avatar
        user.email = email
        user.first_name = first_name
        user.last_name = last_name
        user.id = Int16(id)
        UsersModel.dB.save()
        
    }
    
    func clearDb(T : Users) {
        UsersModel.dB.delete(object: T)
    }
    
   static func fetchAndClear() {

        let users = UsersModel.dB.fetch(Users.self)
        users.forEach{ (obj) in
            UsersModel.dB.delete(object: obj)
        }

    }


}

public struct UsersResponse<T: Codable> : Codable {
    
    public let page : Int
    public let per_page : Int
    public let total : Int
    public let total_pages : Int
    public let data : T

}

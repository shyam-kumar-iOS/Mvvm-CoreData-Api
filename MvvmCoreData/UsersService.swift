//
//  UsersService.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 10/5/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation
import Alamofire

struct UsersService {
    
    static func getData(completion: @escaping (() -> Void)) {
        
        AF.request("https://reqres.in/api/users?page=2").responseJSON { (res) in
           
            do {
            let json = try JSONSerialization.jsonObject(with: res.data!) as? NSDictionary
            
                let model = try JSONDecoder().decode( UsersResponse<[UsersModel]>.self, from: res.data!)

                UsersModel.fetchAndClear()
                
                model.data.forEach{ $0.store()}
                
                print("json", json!)
               
                completion()
            
            } catch {
                print("error", error)
            }
        }
    }
    
    
}

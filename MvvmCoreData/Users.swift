//
//  Users.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 10/5/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation
import CoreData

public class Users: NSManagedObject {
    
    @NSManaged var avatar : String
    @NSManaged var email : String
    @NSManaged var first_name : String
    @NSManaged var last_name : String
    @NSManaged var id : Int16
    
    
    
}


//
//  User.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 9/30/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation
import CoreData

public class User : NSManagedObject {
    @NSManaged var name : String
    @NSManaged var age : Int16
    @NSManaged var createdAt : Date
}



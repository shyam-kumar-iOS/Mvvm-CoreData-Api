//
//  Model.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 9/21/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation


  struct Model : Codable  {
    var message: String
    var notificationCount : Int
    var allNotificationCount: Int
    var detail: [detail]
    var status: Int 

    enum CodingKeys: String, CodingKey {
        case message
        case notificationCount = "notification_count"
        case allNotificationCount = "all_notification_count"
        case detail
        case status

    }
    
    enum AdditionalCodingKeys: String, CodingKey {
           case id
           case detail
           case userID = "user_id"
           case userName = "user_name"
           case userType = "user_type"
           case userImage = "user_image"
           case sourceID = "source_id"
           case readStatus = "read_status"
           case createdDate = "created_date"
           case sourceFrom = "source_from"
           case commentID = "comment_id"
           case sharedFrom = "shared_from"
       }
    
    
//    required init(from decoder: Decoder) throws {
//
//   // try self.init(from : decoder)
//
//       let jsonDecoder = Decoder()
//        self.init(from: jsonDecoder)
//
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    message = try container.decode(String.self, forKey: .message)
//    notificationCount = try container.decode(Int.self, forKey: .notificationCount)
//    allNotificationCount = try container.decode(Int.self, forKey: .allNotificationCount)
//    status = try container.decode(Int.self, forKey: .status)
//
//    }
    
    
}

// MARK: - Detail
 struct detail: Codable {
    var id: Int
    var detail: String
    var userID: Int
    var userName: String
    var userType: Int
    var userImage: String
    var sourceID : Int
    var readStatus: Int
    var createdDate: String
    var sourceFrom: String
    var commentID: String
    var sharedFrom: String

    enum CodingKeys: String, CodingKey {
        case id
        case detail
        case userID = "user_id"
        case userName = "user_name"
        case userType = "user_type"
        case userImage = "user_image"
        case sourceID = "source_id"
        case readStatus = "read_status"
        case createdDate = "created_date"
        case sourceFrom = "source_from"
        case commentID = "comment_id"
        case sharedFrom = "shared_from"
    }
    
//    required convenience init(from decoder: Decoder) throws {
//
//    self.init()
//
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decode(Int.self, forKey: .id)
//        userID = try container.decode(Int.self, forKey: .userID)
//        userType = try container.decode(Int.self, forKey: .userType)
//        sourceID = try container.decode(Int.self, forKey: .sourceID)
//        readStatus = try container.decode(Int.self, forKey: .readStatus)
//        detail = try container.decode(String.self, forKey: .detail)
//        userName = try container.decode(String.self, forKey: .userName)
//        userImage = try container.decode(String.self, forKey: .userImage)
//        createdDate = try container.decode(String.self, forKey: .createdDate)
//        sourceFrom = try container.decode(String.self, forKey: .sourceFrom)
//        commentID = try container.decode(String.self, forKey: .commentID)
//        sharedFrom = try container.decode(String.self, forKey: .sharedFrom)
//
//    }
    
    
}

//{"foods":[{"food_name":"Milk Chocolate","brand_name":"Snickers","serving_weight_grams":41.7,"nf_calories":212.3,"nf_total_fat":11.6,"nf_saturated_fat":4,"nf_total_carbohydrate":22.7,"nf_protein":3.9}]}


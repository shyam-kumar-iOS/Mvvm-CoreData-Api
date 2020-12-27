//
//  Service.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 9/21/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation
import Alamofire

struct Service {
    
    
    static func getResponse(url: String, Method: HTTPMethod, param: [String : AnyObject], success: @escaping (_ dic: NSDictionary,_ err: Error?) -> Void, failure: @escaping (Error) -> Void ) {

        let headersss : HTTPHeaders = ["Authorization" : "Basic c2h5YW0ua3VtYXJAbGV0emNvbm5lY3QuY29tOjEyMzQ1Njc4"]

        AF.request(url, method: Method, parameters: param, encoding: JSONEncoding.default, headers: headersss).responseJSON { (response) -> Void in
            
            
            switch response.result {

            case .success(let value):

                if let dic = value as? NSDictionary {
                    success(dic, nil)
                }

            case .failure(let error):
                failure(error)
            }

        }
    }
    
    static func getDataResponse<obj:Decodable>(url: String, method: HTTPMethod, param: [String : AnyObject],sucess: @escaping (_ model: (obj)) -> Void) {
            
        let headersss : HTTPHeaders = ["Authorization" : "Basic c2h5YW0ua3VtYXJAbGV0emNvbm5lY3QuY29tOjEyMzQ1Njc4"]
        
        AF.request(url, method: method, parameters: param, encoding: JSONEncoding.default, headers: headersss).responseDecodable { (response: DataResponse<obj, AFError>) in
                       switch response.result {
                       case .success(let value):
                        sucess(value)
                         
                        //   print("vfv", value.detail)
                      //    model(value)
    //                       for i in value.detail {
    //                           print(i.detail)
    //                       }
                       case .failure(let error):
                           print(error)
                       }
                   }
               }
    
    
    
//    static func getResponse(url: String, Method: HTTPMethod, param: [String : AnyObject], success: @escaping (_ dic: DataResponse<Any, Error>,_ err: Error?) -> Void, failure: @escaping (Error) -> Void ) {
//
//           let headersss : HTTPHeaders = ["Authorization" : "Basic c2h5YW0ua3VtYXJAbGV0emNvbm5lY3QuY29tOjEyMzQ1Njc4"]
//
//           AF.request(url, method: Method, parameters: param, encoding: JSONEncoding.default, headers: headersss).responseJSON { (response) -> Void in
//
//               switch response.result {
//
//               case .success(let value):
//
//
//                success(<#DataResponse<Any, Error>#>)
//
//
//               case .failure(let error):
//                   failure(error)
//               }
//
//           }
//       }
    
//    static func performRequest<T:Decodable>(_ route:URLConvertible, decoder: JSONDecoder , completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
//        return AF.request(route).responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
//                                 completion(response.result)
//             }
//         }
    
    
    


    
    //    static func performRequest<T:Decodable>(route:URLConvertible, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
//           return AF.request(route)
//                           .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
//                               completion(response.result)
//           }
//       }
    
    
    
    
}

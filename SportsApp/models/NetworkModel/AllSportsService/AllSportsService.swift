//
//  AllSportsService.swift
//  SportsApp
//
//  Created by Ali on 30/04/2022.
//

import Foundation
import Alamofire

class AllSportsService {
    
    func fatchDataFromAPI(completionHandler: @escaping (AllSports?, Error?) -> Void){
        AF.request(Constants.getAllSportsURL).responseDecodable(of: AllSports.self)  { (response) in
            switch response.result {
            case let .success(data):
                completionHandler(data, nil)
            case let .failure(error):
                completionHandler(nil, error)
            }
        }
    }
    func fatchDataItemsFromAPI<T:Decodable>(url:String ,typeItem:  T.Type ,completionHandler: @escaping ( T? , Error?) -> Void){
        AF.request(Constants.getAllSportsURL).responseDecodable(of: T.self )  { (response) in
            switch response.result {
            case let .success(data):
                completionHandler(data, nil)
            case let .failure(error):
                completionHandler(nil, error)
            }
        }
    }
    
}

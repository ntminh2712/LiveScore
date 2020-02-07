//
//  MatchesRefereeEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesRefereeEntity: Mappable {
    
    var id: Int?
    var lastname: String?
    var common_name: String?
    var fullname: String?
    var firstname: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        lastname <- map["lastname"]
        common_name <- map["common_name"]
        fullname <- map["fullname"]
        firstname <- map["firstname"]
    }
}

//
//  MatchesCoachesDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesCoachesDetailEntity: Mappable {

    var id: Int?
    var common_name:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        common_name <- map["common_name"]
    }
}

//
//  StandingEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class StandingEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result: StandingDetailEntity?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}

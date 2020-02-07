//
//  ScoresEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ScoresEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result: ScoresResultEntity?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}

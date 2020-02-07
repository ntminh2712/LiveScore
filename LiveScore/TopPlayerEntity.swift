//
//  TopPlayerEntitty.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class TopPlayerEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result: [TopPlayerDetailEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}

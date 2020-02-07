//
//  TeamsEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class TeamsEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result: TeamDetailEntity?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}

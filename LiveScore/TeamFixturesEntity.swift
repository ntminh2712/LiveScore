//
//  TeamFixtureEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class TeamFixturesEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result: [MatchesDetailEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}

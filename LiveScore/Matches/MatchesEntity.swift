//
//  MatchesEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result_list_matches: [MatchesLeaguesEntity]?
    var result_matches_detail: MatchesDetailEntity?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result_list_matches <- map["result"]
        result_matches_detail <- map["result"]
    }
}

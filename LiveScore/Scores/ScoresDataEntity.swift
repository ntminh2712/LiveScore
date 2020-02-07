//
//  ScoresDataEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ScoresDataEntity: Mappable {
    var title_leagues: String = ""
    var icon: String = ""
    var total_matches: Int = 0
    var data_matches: [ScoresDetailMatchesEntity] = []
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title_leagues <- map["title_leagues"]
        icon <- map["icon"]
        total_matches <- map["total_matches"]
        data_matches <- map["matches"]
    }
}

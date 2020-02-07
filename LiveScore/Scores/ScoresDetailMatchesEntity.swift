//
//  ScoresDetailMatchesEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ScoresDetailMatchesEntity: Mappable {
    var localteam_id: String = ""
    var visitorteam_id: String = ""
    var localteam_score: String = ""
    var visitorteam_score: String = ""
    var status: String = ""
    var favorite: Bool = false
    var tag_pen: Bool = false
    var tag_agg: Bool = false
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        localteam_id <- map["localteam_id"]
        visitorteam_id <- map["visitorteam_id"]
        localteam_score <- map["localteam_score"]
        visitorteam_score <- map["visitorteam_score"]
        visitorteam_score <- map["visitorteam_score"]
        favorite <- map["favorite"]
        tag_pen <- map["tag_pen"]
        tag_agg <- map["tag_agg"]
    }
}
